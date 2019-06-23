package cn.deepcoding.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.deepcoding.model.Student;
import org.springframework.web.multipart.MultipartFile;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import cn.deepcoding.page.Page;
import cn.deepcoding.page.PageData;
import cn.deepcoding.service.StudentService;

@Controller
@RequestMapping("student")
public class StudentController {

	@Autowired
	private StudentService studentService;
	@Autowired
	private HttpServletRequest request;

	@RequiresPermissions("student:index")
	@RequestMapping("/index")
	public String index() {

		return "student/student";
	}

	@RequestMapping("/save")
	public String save(Student student, @RequestParam("cname") String[] cname, @RequestParam("ctel") String[] ctel,
			@RequestParam("crelation") String[] crelation) {
		studentService.save(student, cname, ctel, crelation);
		return "student/student";
	}

	@RequestMapping("/savePic")
	@ResponseBody
	public String savePic(@RequestParam(value = "file") MultipartFile file) {
		if (!file.isEmpty()) {
			try {
				// 文件保存路径
				String path = request.getSession().getServletContext().getRealPath("");
				System.err.println(path);
				path = path.replaceAll("proxy_manage", "");
				System.err.println(path);
				path = path.substring(0, path.length() - 1);
				System.out.println(path);
				File newFile = new File(path + "images/student/");
				if (!newFile.exists())
					newFile.mkdirs();
				String name = file.getOriginalFilename();
				String wei = name.substring(name.lastIndexOf("."), name.length());
				String uuid = UUID.randomUUID().toString();
				String filePath = path + "images/student/" + uuid + wei;
				// 转存文件
				file.transferTo(new File(filePath));
				// // img路径
				// String imgUrl = ImagUtils.imgUrl();
				return "/student/" + uuid + wei;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "err";
	}

	@RequestMapping("/update")
	@ResponseBody
	public void update(Student student) {
		studentService.update(student);
	}

	@RequiresPermissions("student:indexfind")
	@RequestMapping("/indexfind")
	public String indexfind() {

		return "studentfind/studentfind";
	}

	// 通过班级id获取该班学生
	@RequestMapping("/getByClassId")
	@ResponseBody
	public List<Student> getByClassId(Integer classId) {
		return studentService.getByClassId(classId);
	}

	// 通过班级id,专业，名字获取学生
	@RequestMapping("/getByClassIdMaId")
	@ResponseBody
	public List<Student> getByClassIdMaId(Integer classId, Integer majorId, String studentName) {
		return studentService.getByClassIdMaId(classId, majorId, studentName);
	}

	// 通过学生id获取一个学生对象
	@RequestMapping("/getById")
	@ResponseBody
	public Student getById(Integer id) {
		return studentService.getById(id);
	}

	@RequestMapping("/listAll")
	@ResponseBody
	public Object listAll(Page page, String name, String idCard) {
		return studentService.listAll(page, name, idCard);

	}

	// 姓名模糊查询
	@RequestMapping("/getStudent")
	@ResponseBody
	public List<Student> getStudent(Student student) {
		System.out.println(student);
		return studentService.getStudent(student);
	}

	// 获取该班级学生，按照专业排名
	@RequestMapping("/getClassStudents")
	@ResponseBody
	public List<Student> getClassStudents(Integer id) {
		return studentService.getClassStudents(id);
	}

	// 设置模拟班级id
	@RequestMapping("/updateTestClassId")
	@ResponseBody
	public void updateTestClassId(Integer testClassId, Integer[] studentIds) {
		studentService.updateTestClassId(testClassId, studentIds);
	}

	// 获取学生信息
	@RequestMapping("/getName")
	@ResponseBody

	public List<Student> getName(Integer id) {

		return studentService.getName(id);
	}

	// 获取所有模拟班级Id
	@RequestMapping("/listTestClassroomId")
	@ResponseBody
	public List<Integer> listTestClassroomId() {
		return studentService.listTestClassroomId();
	}

	// 通过模拟班级Id获取学生
	@RequestMapping("/getByTestClassId")
	@ResponseBody
	public Object getByTestClassId(Page page, Integer testClassId) {
		return studentService.getByTestClassId(page, testClassId);
	}

	@RequestMapping("/select")
	@ResponseBody
	public List<Student> select(String name, String sex, String idcard) {
		List<Student> students = studentService.select(name, sex, idcard);

		return students;
	}

	@RequestMapping("/getSomeStudents")
	@ResponseBody
	public PageData getSoneStudents(Student student, String examName, Page page) {
		return studentService.getSomeStudents(student, examName, page);
	}

	// 移除模拟班级Id
	@RequestMapping("/deleteTestClassId")
	@ResponseBody
	public void deleteTestClassId(Integer id) {
		studentService.deleteTestClassId(id);
	}

	// 将模拟班级设置为实际班级
	@RequestMapping("/updateClassId")
	@ResponseBody
	public void updateClassId(Integer testClassId, Integer[] studentIds) {
		studentService.updateClassId(testClassId, studentIds);
	}

	// 王晓宇
	@RequestMapping("/getAll")
	@ResponseBody

	public Object getAll(Page page, String stuName, String idCard) {

		return studentService.getAll(page, stuName, idCard);

	}

	// 根据身份证号判断是否重复录入

	// 王晓宇
	@RequestMapping("/IdcardisNo")
	@ResponseBody
	public Boolean idcardisNo(String idCard) {

		System.err.println(idCard);

		return studentService.idcardisNo(idCard);
	}

	// 删除学生
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(Student student) {
		return studentService.deleteStudent(student);
	}

}
