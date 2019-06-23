package cn.deepcoding.controller.app;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.deepcoding.model.AppUsers;
import cn.deepcoding.model.AttenceCount;
import cn.deepcoding.model.Code;
import cn.deepcoding.model.Exam;
import cn.deepcoding.model.Fee;
import cn.deepcoding.model.Graduated;
import cn.deepcoding.model.GraduatedResult;
import cn.deepcoding.model.ProxyTeacher;
import cn.deepcoding.model.QueryVo2;
import cn.deepcoding.model.Student;
import cn.deepcoding.model.StudentConversation;
import cn.deepcoding.page.Page;
import cn.deepcoding.page.PageData;
import cn.deepcoding.service.AppService;
import cn.deepcoding.util.ConstUtils;
import cn.deepcoding.util.CookieUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

/*
 * app使用的 controller
 */
@Controller
@RequestMapping("/app")
@Api(value = "app接口",description="app模块的接口")
public class AppController {
	
	@Autowired
	private AppService appService;
	// 根据 招生老师 id 查询信息
	@RequestMapping("/getProxyTeacher")
	@ResponseBody
	@ApiOperation(value = "招生老师信息列表",httpMethod = "POST",notes = "根据招生老师 id 获取招生老师信息")
	@ApiImplicitParam(paramType="query", name = "id", value = "招生老师id", required = true, dataType = "Integer")
	public ProxyTeacher getProxyTeacher(Integer id){
		ProxyTeacher proxyTeacher = appService.getProxyTeacher(id);
		System.err.println(proxyTeacher);
		return proxyTeacher;
	}
	
	// 根据 招生老师 id 查询信息
	@RequestMapping("/getParentProxyTeacher")
	@ResponseBody
	@ApiOperation(value = "招生老师上级信息列表",httpMethod = "POST",notes = "根据招生老师 id 获取招生老师上级信息")
	@ApiImplicitParam(paramType="query", name = "id", value = "招生老师id", required = true, dataType = "Integer")
	public ProxyTeacher getParentProxyTeacher(Integer id){
		ProxyTeacher proxyTeacher = appService.getParentProxyTeacher(id);
		if(proxyTeacher != null ){
			return proxyTeacher;
		}else{
			return null;
		}
	}
	
	// 根据招生老师查询下级信息 和下级 招生的个数
	@RequestMapping("/getSublevelProxyTeacher")
	@ResponseBody
	@ApiOperation(value = "招生老师下级信息列表",httpMethod = "POST",notes = "根据招生老师 id 获取招生老师下级信息")
	@ApiImplicitParam(paramType="query", name = "id", value = "招生老师id", required = true, dataType = "Integer")
	public List<ProxyTeacher> getSublevelProxyTeacher(Integer id){
		List<ProxyTeacher> sublevelProxyTeacher = appService.getSublevelProxyTeacher(id);
		if(sublevelProxyTeacher != null){
			return sublevelProxyTeacher;
		}else{
			return null;
		}
	}
	// 根据招生老师 id 查询学生信息
	@RequestMapping("/getStudentByProxyTeacherId2")
	@ResponseBody
	@ApiOperation(value = "招生老师下的学生列表",httpMethod = "POST",notes = "根据招生老师 id 获取招生老师下的学生信息")
	@ApiImplicitParams({
		@ApiImplicitParam(paramType="query", name = "id", value = "招生老师id", required = true, dataType = "Integer"),
		@ApiImplicitParam(paramType = "query",name = "page", value = "当前页数",required = true,dataType = "Integer"),
		@ApiImplicitParam(paramType = "query",name = "rows", value = "每页个数",required = true,dataType = "Integer") , 
//		@ApiImplicitParam(paramType = "query",name = "start", value = "起始索引",required = true,dataType = "Integer")  

	})
	public PageData getStudentByProxyTeacherId2(Integer id,Page page){
		 PageData studentByProxyTeacherId2 = appService.getStudentByProxyTeacherId2(id,page);
		if(studentByProxyTeacherId2 != null){
			return studentByProxyTeacherId2;
		}else{
			return null;
		}
	}
	// 根据学生 id 查询学生信息
	@RequestMapping("/getStudentById3")
	@ResponseBody
	@ApiOperation(value = "学生信息列表",httpMethod = "POST",notes = "根据学生 id 获取学生信息")
	@ApiImplicitParam(paramType="query", name = "id", value = "学生id", required = true, dataType = "Integer")
	public Student getStudentById3(Integer id){
		Student studentById3 = appService.getStudentById3(id);
		if(studentById3 != null){
			return studentById3;
		}else{
			return null;
		}
		
	}
	// 根据学生 id 查询学生缴费信息
	@RequestMapping("/getFeeByStudentId2")
	@ResponseBody
	@ApiOperation(value = "学生缴费信息列表",httpMethod = "POST",notes = "根据学生 id 获取学生缴费信息")
	@ApiImplicitParams({
		@ApiImplicitParam(paramType="query", name = "id", value = "学生id", required = true, dataType = "Integer"),
		@ApiImplicitParam(paramType = "query",name = "page", value = "当前页数",required = true,dataType = "Integer"),
		@ApiImplicitParam(paramType = "query",name = "rows", value = "每页个数",required = true,dataType = "Integer") , 
	})
	public Object getFeeByStudentId2(Integer id,Integer page,Integer rows){
		 PageHelper.startPage(page,rows);
		 List<Fee> feeByStudentId2 = appService.getFeeByStudentId2(id);
		if(feeByStudentId2 != null){
			PageInfo<Fee> inif = new PageInfo<Fee>(feeByStudentId2);
			Map<String,Object> data = new HashMap<>();
			data.put("total", inif.getTotal());
			data.put("rows", feeByStudentId2);
			return data;
		}else{
			return null;
		}
	}
	
	// 根据学生 id 查询 钉钉唯一标识符并获取考勤信息
	@RequestMapping("/getAttenceByStudentId")
	@ResponseBody
	@ApiOperation(value = "学生考勤信息列表",httpMethod = "POST",notes = "根据学生 id 获取学生考勤信息")
	@ApiImplicitParam(paramType="query", name = "id", value = "学生id", required = true, dataType = "Integer")
	public List<QueryVo2> getAttenceByStudentId(Integer id) throws Exception{
		List<QueryVo2> attenceByStudentId1 = appService.getAttenceByStudentId1(id);
		if(attenceByStudentId1 != null){
			return attenceByStudentId1;
		}else{
			return null;
		}
	}

	// 根据学生id 查询 考勤记录查看最近一个月的明细表
	@RequestMapping("/getAttenceByStudent1")
	@ResponseBody
	@ApiOperation(value = "最近 一个月学生考勤明细表",httpMethod = "POST",notes = " 获取学生考勤明细表")
	@ApiImplicitParam(paramType="query", name = "id", value = "学生id", required = true, dataType = "Integer")
	public List<AttenceCount> getAttenceByStudent1(Integer id){
		List<AttenceCount> attenceByStudent1 = appService.getAttenceByStudent1(id);
		if(attenceByStudent1 != null){
			return attenceByStudent1;
		}else{
			return null;
		}
		
	}
	// 根据学生id 查询 考勤记录查看最近三个月的明细表
	@RequestMapping("/getAttenceByStudent2")
	@ResponseBody
	@ApiOperation(value = "最近 三个月学生考勤明细表",httpMethod = "POST",notes = " 获取学生考勤明细表")
	@ApiImplicitParam(paramType="query", name = "id", value = "学生id", required = true, dataType = "Integer")
	public List<AttenceCount> getAttenceByStudent2(Integer id){
		List<AttenceCount> attenceByStudent1 = appService.getAttenceByStudent2(id);
		if(attenceByStudent1 != null){
			return attenceByStudent1;
		}else{
			return null;
		}
	}
	// 根据学生id 查询 考勤记录查看最近六个月的明细表
	@RequestMapping("/getAttenceByStudent3")
	@ResponseBody
	@ApiOperation(value = "最近 六个月学生考勤明细表",httpMethod = "POST",notes = " 获取学生考勤明细表")
	@ApiImplicitParam(paramType="query", name = "id", value = "学生id", required = true, dataType = "Integer")
	public List<AttenceCount> getAttenceByStudent3(Integer id){
		List<AttenceCount> attenceByStudent1 = appService.getAttenceByStudent3(id);
		if(attenceByStudent1 != null){
			return attenceByStudent1;
		}else{
			return null;
		}
	}
	// 根据 学生id 查询考试记录
	@RequestMapping("/getExamByStudentId")
	@ResponseBody
	@ApiOperation(value = "学生考试记录",httpMethod = "POST",notes = "根据学生 id 获取学生考试记录")
	@ApiImplicitParams({
		@ApiImplicitParam(paramType="query", name = "id", value = "学生id", required = true, dataType = "Integer"),
		@ApiImplicitParam(paramType = "query",name = "page", value = "当前页数",required = true,dataType = "Integer"),
		@ApiImplicitParam(paramType = "query",name = "rows", value = "每页个数",required = true,dataType = "Integer") , 
	})
	public Object getExamByStudentId(Integer id,Integer page,Integer rows){
		PageHelper.startPage(page,rows);
		List<Exam> examByStudentId = appService.getExamByStudentId(id);
		if(examByStudentId != null){
			PageInfo<Exam> inif = new PageInfo<Exam>(examByStudentId);
			Map<String,Object> data = new HashMap<>();
			data.put("total", inif.getTotal());
			data.put("rows", examByStudentId);
			return data;
		}else{
			return null;
		}
		
	}
	// 根据学生id 查询 谈话记录
	@RequestMapping("/getStudentConversationById")
	@ResponseBody
	@ApiOperation(value = "学生谈话记录",httpMethod = "POST",notes = "根据学生 id 获取学生谈话记录")
	@ApiImplicitParams({
		@ApiImplicitParam(paramType="query", name = "id", value = "学生id", required = true, dataType = "Integer"),
		@ApiImplicitParam(paramType = "query",name = "page", value = "当前页数",required = true,dataType = "Integer"),
		@ApiImplicitParam(paramType = "query",name = "rows", value = "每页个数",required = true,dataType = "Integer") , 
	})
	public Object getStudentConversationById(Integer id,Integer page,Integer rows){
		PageHelper.startPage(page,rows);
		List<StudentConversation> studentConversationById = appService.getStudentConversationById(id);
//		System.err.println(studentConversationById);
		if(studentConversationById != null){
			PageInfo<StudentConversation> inif = new PageInfo<StudentConversation>(studentConversationById);
			Map<String,Object> data = new HashMap<>();
			data.put("total", inif.getTotal());
			data.put("rows", studentConversationById);
			return data;
		}else{
			return null;
		}
	}
	// 根据学生id 查询 谈话记录详细表（图片）
	@RequestMapping("/getStudentConversationPicById")
	@ResponseBody
	@ApiOperation(value = "学生谈话记录明细",httpMethod = "POST",notes = "根据学生 id 获取学生谈话记录明细")
	@ApiImplicitParam(paramType="query", name = "id", value = "学生id", required = true, dataType = "Integer")
	public String getStudentConversationPicById(Integer id,HttpServletResponse reponse){
		String url = appService.getStudentConversationPicById(id);
//		String string = ConstUtils.getString("image_url");
		return url;
	}
	// 根据省，市，县，学生姓名 查询 就业信息
	@RequestMapping("/getgraduatedbyaddress")
	@ResponseBody
	@ApiOperation(value = "根据省，市，县，学生姓名 查询 就业信息",httpMethod = "POST",notes = "根据省，市，县，学生姓名 查询 就业信息")
	public GraduatedResult getGraduatedByaddress(String keyword,int page,int rows){
		GraduatedResult graduatedResult=appService.getGraduatedByaddress(keyword,page,rows);
		return graduatedResult;
	}
	// 学生 就业信息详情
	@RequestMapping("/getgraduatedbyId")
	@ResponseBody
	@ApiOperation(value = "学生就业信息详情",httpMethod = "POST",notes = "学生就业信息详情")
	public Graduated getGraduatedById(Integer id){
		Graduated graduated=appService.getGraduatedById(id);
		return graduated;

	}
	// 查询所有的学生 就业信息详情
	@RequestMapping("/getallgraduated")
	@ResponseBody
	@ApiOperation(value = "所有学生就业信息根据时间倒序",httpMethod = "POST",notes = "所有学生就业信息根据时间倒序")
	public Object getallgraduated(Integer page,Integer rows){
		PageHelper.startPage(page,rows);
	    List<Graduated> graduateds= appService.getallgraduated();
		PageInfo<Graduated> inif = new PageInfo<Graduated>(graduateds);
		Map<String,Object> data = new HashMap<>();
		data.put("total", inif.getTotal());
		data.put("data", graduateds);
		return data;
	}
	// 查询就业精英信息
	@RequestMapping("/getElite")
	@ResponseBody
	@ApiOperation(value = "查询就业精英信息",httpMethod = "GET",notes = "查询就业精英信息")
	public List<Graduated> getElite(){
		List<Graduated> elite = appService.getElite();
		return elite;
	}
	// 我的资料
	@RequestMapping("/getProxyTeacher2")
	@ResponseBody
	@ApiOperation(value = "查看自己的资料",httpMethod = "POST",notes = "查看自己的资料")
	@ApiImplicitParam(paramType="query", name = "id", value = "招生老师id", required = true, dataType = "Integer")
	public ProxyTeacher getProxyTeacher2(Integer id){
		ProxyTeacher proxyTeacher = appService.getProxyTeacher(id);
		proxyTeacher.setHeadPortrait("/images/bankPic/7e639a14-9e53-4fc8-bc7f-6d05af317fbd.jpg");
		return proxyTeacher;
	}
	// 根据 就业精英的学生 的id 添加点击量
	@RequestMapping("/updateStudentpageView")
	@ResponseBody
	@ApiOperation(value = "根据 就业精英的学生 的id 添加点击量",httpMethod = "POST",notes = "根据 就业精英的学生 的id 添加点击量")
	@ApiImplicitParam(paramType="query", name = "id", value = "精英学生id", required = true, dataType = "Integer")
	public void updateStudentpageView(Integer id){
		appService.updateStudentpageView(id);
		
	}
	/**
	 * 每晚 两点定时更新 点击量
	 * 迫于生计  不得不写  写完心里好痛啊
	 * */ 
	@Scheduled(cron="0 0 2 * * ?")
	public void updateStudentpageView2(Graduated graduated){
		appService.updateStudentpageView2(graduated);
		
	}
	// app 用户登陆
	@RequestMapping("/appLogin")
	@ResponseBody
	@ApiOperation(value = "app 用户登陆",httpMethod = "POST",notes = "app 用户登陆")
	@ApiImplicitParams({
		@ApiImplicitParam(paramType = "query",name = "appTel", value = "app 手机号",required = true,dataType = "String"),
		@ApiImplicitParam(paramType = "query",name = "appPassword", value = "app 密码",required = true,dataType = "String") , 
		@ApiImplicitParam(paramType = "query",name = "token", value = "token",required = true,dataType = "String") , 

	})
	public Code appLogin(HttpServletRequest request,HttpServletResponse response,String appTel,String appPassword,String token){
		    Code byName= appService.getByName(appTel,appPassword,token);	    
		    try {
		    	token=(String) byName.getData();
			} catch (Exception e) {
				// TODO: handle exception
			}
		return byName;
		
		
	}
	// app 发送短信
	@RequestMapping("/appMseeage")
	@ResponseBody
	@ApiOperation(value = "发送短信获取验证码",httpMethod = "POST",notes = "根据手机号发送短信")
	@ApiImplicitParam(paramType="query", name = "appTel", value = "手机号码", required = true, dataType = "String")
	public Code getMessage(String appTel,HttpServletRequest request){
		Code message = appService.getMessage(appTel, request);
		return message;
		
	}
	// 修改密码
	@RequestMapping("/updatePassword")
	@ResponseBody
	@ApiOperation(value = "修改密码修改密码",httpMethod = "POST",notes = "修改密码")
	@ApiImplicitParam(paramType="query", name = "appTel", value = "手机号码", required = true, dataType = "String")
	public Code updatePassword(AppUsers appUsers,HttpServletRequest request){
		Code updatePassword = appService.updatePassword(appUsers, request);
		return updatePassword;
	}
	
}