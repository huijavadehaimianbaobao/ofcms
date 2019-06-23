package cn.deepcoding.service;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;
import org.apache.ibatis.annotations.Param;
import cn.deepcoding.model.Classroom;
import cn.deepcoding.model.Major;
import cn.deepcoding.model.Student;
import cn.deepcoding.page.Page;
import cn.deepcoding.page.PageData;
import cn.deepcoding.model.StudyTime;
import cn.deepcoding.model.Tuition;

public interface StudentService {

	Student getById(Integer id);

	public void save(Student student, String[] cname, String[] ctel, String[] crelation);

	public Student getByName(String name);

	public List<Student> getByClassId(int id);

	List<Student> getByClassId(Page page, Integer classId);

	List<Student> getByClassIdMaId(Integer classId, Integer majorId, String studentName);

	public void update(Student student);

	// 模糊查询姓名
	public Object listAll(Page page, String stuName, String stuIdCard);

	// 獲取所有學生信息
	public List<Student> getStudent(Student Student);

	public List<Student> getClassStudents(Integer id);

	public void updateTestClassId(Integer testClassId, Integer[] studentIds);

	// 获取所有的模拟班级Id
	List<Integer> listTestClassroomId();

	// 通过模拟班级Id获取学生
	Object getByTestClassId(Page page, Integer testClassId);

	// 移除模拟班级Id
	void deleteTestClassId(Integer id);

	void updateClassId(Integer testClassId, Integer[] studentIds);

	// 通过姓名电话查到dingId 考勤需要，勿动
	String getDingId(String name, String tel);

	// 通过学生姓名以及电话添加学生Dingid信息
	void updateDingIdByNameTel(String userId, String name, String tel);

	// 查询没有DingId的学生
	List<Student> getNameTel();

	// 获取学生信息
	public List<Student> getName(Integer id);

	List<Student> getTelByName(String name);

	public List<Student> select(String name, String sex, String idcard);

	// 通过学生姓名模糊查询和班级id查询
	PageData getSomeStudents(Student student, String examName, Page page);

	// 王晓宇
	public Object getAll(Page page, String stuName, String idCard);

	// 判断身份证号是否存在
	Boolean idcardisNo(String idCard);

	// 删除学生
	String deleteStudent(Student student);

}
