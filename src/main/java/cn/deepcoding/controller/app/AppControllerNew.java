package cn.deepcoding.controller.app;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.github.pagehelper.PageHelper;
import cn.deepcoding.model.Graduated;
import cn.deepcoding.model.GraduatedResult;
import cn.deepcoding.page.Page;
import cn.deepcoding.service.AppServiceNew;
import cn.deepcoding.util.ServerResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

/*
 * app使用的 controller
 * 
 * 
 * 
 * V1.2版本  使用全新逻辑
 * 
 */
@Controller
@RequestMapping("/appNew")
@Api(value = "newApp接口", description = "app模块的接口")
public class AppControllerNew {

	@Autowired
	private AppServiceNew appServicenew;

	// 根据 招生老师 id 查询信息
	@RequestMapping("/getProxyTeacher")
	@ResponseBody
	@ApiOperation(value = "招生老师信息列表", httpMethod = "POST", notes = "根据招生老师 id 获取招生老师信息")
	@ApiImplicitParam(paramType = "query", name = "token", value = "TOKEN", required = true, dataType = "String")
	public ServerResponse getProxyTeacher(HttpServletRequest request) {
		return appServicenew.getProxyTeacher(WebUtils.toHttp(request).getHeader("Authorization"));
	}

	// 根据 招生老师 id 查询信息
	@RequestMapping("/getParentProxyTeacher")
	@ResponseBody
	@ApiOperation(value = "招生老师上级信息列表", httpMethod = "POST", notes = "根据招生老师 id 获取招生老师上级信息")
	@ApiImplicitParam(paramType = "query", name = "token", value = "TOKEN", required = true, dataType = "String")
	public ServerResponse getParentProxyTeacher(HttpServletRequest request) {
		return appServicenew.getParentProxyTeacher(WebUtils.toHttp(request).getHeader("Authorization"));
	}

	// 根据招生老师查询下级信息 和下级 招生的个数
	@RequestMapping("/getSublevelProxyTeacher")
	@ResponseBody
	@ApiOperation(value = "招生老师下级信息列表", httpMethod = "POST", notes = "根据招生老师 id 获取招生老师下级信息")
	@ApiImplicitParam(paramType = "query", name = "token", value = "TOKEN", required = true, dataType = "String")
	public ServerResponse getSublevelProxyTeacher(HttpServletRequest request,Integer id) {
		System.err.println("token信息："+WebUtils.toHttp(request).getHeader("Authorization"));
		return appServicenew.getSublevelProxyTeacher(WebUtils.toHttp(request).getHeader("Authorization"));
	}

	// 根据招生老师 id 查询学生信息
	@RequestMapping("/getStudentByProxyTeacherId2")
	@ResponseBody
	@ApiOperation(value = "招生老师下的学生列表", httpMethod = "POST", notes = "根据招生老师 id 获取招生老师下的学生信息")
	@ApiImplicitParams({
		@ApiImplicitParam(paramType="query", name = "id", value = "招生老师id", required = false, dataType = "Integer"),
		@ApiImplicitParam(paramType="query", name = "token", value = "TOKEN", required = true, dataType = "String"),
		@ApiImplicitParam(paramType = "query",name = "page", value = "当前页数",required = true,dataType = "Integer"),
		@ApiImplicitParam(paramType = "query",name = "rows", value = "每页个数",required = true,dataType = "Integer") , 
	})			
	public ServerResponse getStudentByProxyTeacherId2(Integer id,Page page, HttpServletRequest request) {
		// 从请求头中获取token
		return appServicenew.getStudentByProxyTeacherId2(id,WebUtils.toHttp(request).getHeader("Authorization"), page);
	}

	// 根据学生 id 查询学生信息
	@RequestMapping("/getStudentById3")
	@ResponseBody
	@ApiOperation(value = "学生信息列表", httpMethod = "POST", notes = "根据学生 id 获取学生信息")
	@ApiImplicitParams({
			@ApiImplicitParam(paramType = "query", name = "token", value = "TOKEN", required = true, dataType = "String"),
			@ApiImplicitParam(paramType = "query", name = "id", value = "学生id", required = true, dataType = "Integer") })
	public ServerResponse getStudentById3(Integer id, HttpServletRequest request) {
		return appServicenew.getStudentById3(id, WebUtils.toHttp(request).getHeader("Authorization"));

	}

	// 根据学生 id 查询学生缴费信息
	@RequestMapping("/getFeeByStudentId2")
	@ResponseBody
	@ApiOperation(value = "学生缴费信息列表", httpMethod = "POST", notes = "根据学生 id 获取学生缴费信息")
	@ApiImplicitParams({
			@ApiImplicitParam(paramType = "query", name = "token", value = "TOKEN", required = true, dataType = "String"),
			@ApiImplicitParam(paramType = "query", name = "id", value = "学生id", required = true, dataType = "Integer"),
			@ApiImplicitParam(paramType = "query", name = "page", value = "当前页数", required = true, dataType = "Integer"),
			@ApiImplicitParam(paramType = "query", name = "rows", value = "每页个数", required = true, dataType = "Integer"), })
	public ServerResponse getFeeByStudentId2(Integer id, Integer page, Integer rows, HttpServletRequest request) {
		PageHelper.startPage(page, rows);
		return appServicenew.getFeeByStudentId2(id, WebUtils.toHttp(request).getHeader("Authorization"));
	}

	// 根据学生 id 查询 钉钉唯一标识符并获取考勤信息
	@RequestMapping("/getAttenceByStudentId")
	@ResponseBody
	@ApiOperation(value = "学生考勤信息列表", httpMethod = "POST", notes = "根据学生 id 获取学生考勤信息")
	@ApiImplicitParams({
			@ApiImplicitParam(paramType = "query", name = "token", value = "TOKEN", required = true, dataType = "String"),
			@ApiImplicitParam(paramType = "query", name = "id", value = "学生id", required = true, dataType = "Integer") })
	public ServerResponse getAttenceByStudentId(Integer id,  HttpServletRequest request) throws Exception {
		return appServicenew.getAttenceByStudentId1(id,  WebUtils.toHttp(request).getHeader("Authorization"));

	}

	// 根据学生id 查询 考勤记录查看最近一个月的明细表
	@RequestMapping("/getAttenceByStudent1")
	@ResponseBody
	@ApiOperation(value = "最近 一个月学生考勤明细表", httpMethod = "POST", notes = " 获取学生考勤明细表")
	@ApiImplicitParams({
			@ApiImplicitParam(paramType = "query", name = "id", value = "学生id", required = true, dataType = "Integer"),
			@ApiImplicitParam(paramType = "query", name = "token", value = "Token", required = true, dataType = "String"), })
	public ServerResponse getAttenceByStudent1(Integer id,  HttpServletRequest request) {
		return appServicenew.getAttenceByStudent1(id, WebUtils.toHttp(request).getHeader("Authorization"));

	}

	// 根据学生id 查询 考勤记录查看最近三个月的明细表
	@RequestMapping("/getAttenceByStudent2")
	@ResponseBody
	@ApiOperation(value = "最近 三个月学生考勤明细表", httpMethod = "POST", notes = " 获取学生考勤明细表")
	@ApiImplicitParams({
			@ApiImplicitParam(paramType = "query", name = "id", value = "学生id", required = true, dataType = "Integer"),
			@ApiImplicitParam(paramType = "query", name = "token", value = "Token", required = true, dataType = "String"), })
	public ServerResponse getAttenceByStudent2(Integer id, HttpServletRequest request) {
		return appServicenew.getAttenceByStudent2(id, WebUtils.toHttp(request).getHeader("Authorization"));
	}

	// 根据学生id 查询 考勤记录查看最近六个月的明细表
	@RequestMapping("/getAttenceByStudent3")
	@ResponseBody
	@ApiOperation(value = "最近 六个月学生考勤明细表", httpMethod = "POST", notes = " 获取学生考勤明细表")
	@ApiImplicitParams({
			@ApiImplicitParam(paramType = "query", name = "id", value = "学生id", required = true, dataType = "Integer"),
			@ApiImplicitParam(paramType = "query", name = "token", value = "Token", required = true, dataType = "String"), })
	public ServerResponse getAttenceByStudent3(Integer id, HttpServletRequest request) {
		return appServicenew.getAttenceByStudent3(id, WebUtils.toHttp(request).getHeader("Authorization"));
	}

	// 根据 学生id 查询考试记录
	@RequestMapping("/getExamByStudentId")
	@ResponseBody
	@ApiOperation(value = "学生考试记录", httpMethod = "POST", notes = "根据学生 id 获取学生考试记录")
	@ApiImplicitParams({
			@ApiImplicitParam(paramType = "query", name = "id", value = "学生id", required = true, dataType = "Integer"),
			@ApiImplicitParam(paramType = "query", name = "page", value = "当前页数", required = true, dataType = "Integer"),
			@ApiImplicitParam(paramType = "query", name = "rows", value = "每页个数", required = true, dataType = "Integer"),
			@ApiImplicitParam(paramType = "query", name = "token", value = "Token", required = true, dataType = "String"), })
	public ServerResponse getExamByStudentId(Integer id, Integer page, Integer rows, HttpServletRequest request) {
		PageHelper.startPage(page, rows);
		return appServicenew.getExamByStudentId(id, WebUtils.toHttp(request).getHeader("Authorization"));
	}

	// 根据学生id 查询 谈话记录
	@RequestMapping("/getStudentConversationById")
	@ResponseBody
	@ApiOperation(value = "学生谈话记录", httpMethod = "POST", notes = "根据学生 id 获取学生谈话记录")
	@ApiImplicitParams({
			@ApiImplicitParam(paramType = "query", name = "id", value = "学生id", required = true, dataType = "Integer"),
			@ApiImplicitParam(paramType = "query", name = "page", value = "当前页数", required = true, dataType = "Integer"),
			@ApiImplicitParam(paramType = "query", name = "rows", value = "每页个数", required = true, dataType = "Integer"),
			@ApiImplicitParam(paramType = "query", name = "token", value = "Token", required = true, dataType = "String"), })
	public ServerResponse getStudentConversationById(Integer id, Integer page, Integer rows, HttpServletRequest request) {
		PageHelper.startPage(page, rows);
		return appServicenew.getStudentConversationById(id, WebUtils.toHttp(request).getHeader("Authorization"));
	}

	// 根据id 查询 谈话记录详细表（图片）
	@RequestMapping("/getStudentConversationPicById")
	@ResponseBody
	@ApiOperation(value = "学生谈话记录明细", httpMethod = "POST", notes = "根据 id 获取学生谈话记录明细")
	@ApiImplicitParams({
			@ApiImplicitParam(paramType = "query", name = "id", value = "id", required = true, dataType = "Integer"),
			@ApiImplicitParam(paramType = "query", name = "token", value = "Token", required = true, dataType = "String"), })
	public ServerResponse getStudentConversationPicById(Integer id, HttpServletRequest request) {
		return appServicenew.getStudentConversationPicById(id, WebUtils.toHttp(request).getHeader("Authorization"));
	}

	// 根据省，市，县，学生姓名 查询 就业信息
	@RequestMapping("/getgraduatedbyaddress")
	@ResponseBody
	@ApiOperation(value = "根据省，市，县，学生姓名 查询 就业信息", httpMethod = "POST", notes = "根据省，市，县，学生姓名 查询 就业信息")
	public ServerResponse getGraduatedByaddress(String keyword, int page, int rows) {
		GraduatedResult graduatedResult = appServicenew.getGraduatedByaddress(keyword, page, rows);
		return ServerResponse.getSuccess("SUCCESS", graduatedResult);
	}

	// 学生 就业信息详情
	@RequestMapping("/getgraduatedbyId")
	@ResponseBody
	@ApiOperation(value = "学生就业信息详情", httpMethod = "POST", notes = "学生就业信息详情")
	@ApiImplicitParam(paramType = "query", name = "id", value = "学生id", required = true, dataType = "Integer")
	public ServerResponse getGraduatedById(Integer id) {
		return appServicenew.getGraduatedById(id);

	}

	// 查询所有的学生 就业信息详情
	@RequestMapping("/getallgraduated")
	@ResponseBody
	@ApiOperation(value = "所有学生就业信息根据时间倒序", httpMethod = "POST", notes = "所有学生就业信息根据时间倒序")
	public ServerResponse getallgraduated(Integer page, Integer rows) {
		PageHelper.startPage(page, rows);
		return appServicenew.getallgraduated();
	}

	// 查询就业精英信息
	@RequestMapping("/getElite")
	@ResponseBody
	@ApiOperation(value = "查询就业精英信息", httpMethod = "GET", notes = "查询就业精英信息")
	public ServerResponse getElite() {
		return appServicenew.getElite();

	}

	// 我的资料
	@RequestMapping("/getProxyTeacher2")
	@ResponseBody
	@ApiOperation(value = "查看自己的资料", httpMethod = "POST", notes = "查看自己的资料")
	@ApiImplicitParams({
			@ApiImplicitParam(paramType = "query", name = "token", value = "Token", required = true, dataType = "String"), })
	public ServerResponse getProxyTeacher2(HttpServletRequest request) {
		return appServicenew.getProxyTeacher(WebUtils.toHttp(request).getHeader("Authorization"));
	}

	/*
	 * // 根据 就业精英的学生 的id 添加点击量
	 * 
	 * @RequestMapping("/updateStudentpageView")
	 * 
	 * @ResponseBody
	 * 
	 * @ApiOperation(value = "根据 就业精英的学生 的id 添加点击量",httpMethod = "POST",notes =
	 * "根据 就业精英的学生 的id 添加点击量")
	 * 
	 * @ApiImplicitParam(paramType="query", name = "id", value = "精英学生id",
	 * required = true, dataType = "Integer") public void
	 * updateStudentpageView(Integer id){
	 * appServicenew.updateStudentpageView(id);
	 * 
	 * }
	 */
	/**
	 * 每晚 两点定时更新 点击量 迫于生计 不得不写 写完心里好痛啊
	 */
	@Scheduled(cron = "0 0 2 * * ?")
	public void updateStudentpageView2(Graduated graduated) {
		appServicenew.updateStudentpageView2(graduated);

	}

	// app 用户登陆
	@RequestMapping("/appLogin")
	@ResponseBody
	@ApiOperation(value = "app 用户登陆", httpMethod = "POST", notes = "app 用户登陆")
	@ApiImplicitParams({
			@ApiImplicitParam(paramType = "query", name = "appTel", value = "app 手机号", required = true, dataType = "String"),
			@ApiImplicitParam(paramType = "query", name = "appPassword", value = "app 密码", required = true, dataType = "String"), })
	public ServerResponse appLogin(HttpServletRequest request, HttpServletResponse response, String appTel,
			String appPassword) {
		return appServicenew.getByName(appTel, appPassword);

	}

	// app 发送短信
	@RequestMapping("/appMseeage")
	@ResponseBody
	@ApiOperation(value = "发送短信获取验证码", httpMethod = "POST", notes = "根据手机号发送短信")
	@ApiImplicitParam(paramType = "query", name = "appTel", value = "手机号码", required = true, dataType = "String")
	public ServerResponse getMessage(String appTel) {
		return appServicenew.getMessage(appTel);

	}

	// 修改密码
	@RequestMapping("/updatePassword")
	@ResponseBody
	@ApiOperation(value = "修改密码", httpMethod = "POST", notes = "修改密码")
	@ApiImplicitParams({
			@ApiImplicitParam(paramType = "query", name = "appTel", value = "手机号", required = true, dataType = "String"),
			@ApiImplicitParam(paramType = "query", name = "code", value = "验证码", required = true, dataType = "String"),
			@ApiImplicitParam(paramType = "query", name = "password", value = "新密码", required = true, dataType = "String"), })
	public ServerResponse updatePassword(String code, String appTel, String password) {
		return appServicenew.updatePassword(code, appTel, password);
	}

}