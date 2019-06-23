package cn.deepcoding.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.deepcoding.dao.FeeDao;
import cn.deepcoding.dao.FeeDueTimeDao;
import cn.deepcoding.dao.StudentDao;
import cn.deepcoding.model.Fee;
import cn.deepcoding.model.Student;
import cn.deepcoding.service.FeeService;

@Service
@Transactional
public class FeeServiceImpl implements FeeService {

	@Autowired
	private FeeDao feeDao;
	
	@Autowired 
	private StudentDao studentDao;
	
	@Autowired
	private FeeDueTimeDao feeDueTimeDao;
	
	
 
	//王晓宇
	public void save(Fee fee) {
		System.err.println(fee.getStudent().getName());
		System.err.println(fee.getStudent().getId());
		
		Integer continuePay = null;
		Integer num = null;
		Student student = studentDao.getOneStudent(fee.getStudent().getId());//学生表信息  拿到学费/杂费/住宿费总额
		String count = feeDao.countTuition(fee.getStudent().getId(), fee.getType());//费用表该类型已交总额
		
		if (fee.getType().equals("学费")) {//如果费用类型是学费
			if (count == null) { //如果没有数据
				if(student.getTuition() > fee.getAmount()){
					continuePay = 0;//0是未缴清
				}else{
					continuePay = 1;
				}
				
			} else if (student.getTuition() > (Double.parseDouble(count)+fee.getAmount())) { //如果学生应交学费大于交费的总合
				continuePay = 0;//0是未缴清
			} else {
				continuePay = 1;//1是已缴清
			}
		}else if (fee.getType().equals("杂费")) {//如果费用类型是杂费
			if (count == null) {
				if(student.getIncidentals() > fee.getAmount()){
					continuePay = 0;//0是未缴清
				}else{
					continuePay = 1;
				}
				
			} else if (student.getIncidentals() > (Double.parseDouble(count)+fee.getAmount())) {
				continuePay = 0;
			} else {
				continuePay = 1;
			}
		}else if (fee.getType().equals("住宿费")) {//如果费用类型是住宿费
			int dou = (int)fee.getAmount();  //拿到交的住宿费
			Integer amount = Integer.valueOf(dou);
			num = amount/550;//算出交了几个月住宿费
		}		
		//所缴类型在fee_due_time是否有记录
		Integer i = feeDueTimeDao.feeDueExist(fee.getStudent().getId(),fee.getType());
		if (i == 0) {
			if (num == null) {
				feeDueTimeDao.saveTuition(fee.getType(),null, fee.getStudent().getId(),null);
			}else {
				Calendar cal = Calendar.getInstance();
				//下面的就是把当前日期加X个月
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
				cal.add(Calendar.MONTH, num);
				feeDueTimeDao.saveTuition(fee.getType(),cal.getTime(), fee.getStudent().getId(),null);
			}
		}else {
			
			if (num == null) {
				feeDueTimeDao.updateTuition(fee.getType(),null,fee.getStudent().getId(),continuePay);
			}else {
				feeDueTimeDao.updateTuition(fee.getType(),num,fee.getStudent().getId(),continuePay);
			}
			
		}
		feeDao.save(fee);
	}
	
	
	
	
	
	
	//王晓宇
	public List<Fee> select(Integer id) {
		
		return  feeDao.select(id);
	}
	@Override
	public Fee selectFee(int studentId) {
		return feeDao.selectFee(studentId);
	}


 
}
