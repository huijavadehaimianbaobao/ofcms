package cn.deepcoding.service;

 
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.deepcoding.model.Fee;
import cn.deepcoding.model.Student;

public interface FeeService {

	//王晓宇
	public void save(Fee fee);
	
	//王晓宇
	public List<Fee> select(Integer id);

	 public Fee selectFee(int studentId);
 
	 
	 
	 
}
