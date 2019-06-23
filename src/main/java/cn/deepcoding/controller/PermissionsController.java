package cn.deepcoding.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.deepcoding.model.Permissions;
import cn.deepcoding.service.PermissionsService;

@Controller
@RequestMapping("/permissions")
public class PermissionsController {
	@Autowired
	private PermissionsService permissionsService;
	// 去权限管理页面
	@RequiresPermissions("permissions:index")
	@RequestMapping("/index")
	public String index(){
		return "permission/permissions";
	}
	
	// 查询所有
	@RequestMapping("/getAll")
	@ResponseBody
	public List<Permissions> getAll(Permissions permissions){
		return permissionsService.getAll(permissions);
	}
	// 根据 id查询
	@RequestMapping("/getById")
	@ResponseBody
	public Permissions getById(Integer id){
		return permissionsService.getById(id);
	}
	// 修改
	@RequestMapping("/update")
	@ResponseBody
	public void update(Permissions permissions){
		permissionsService.update(permissions);
	}
	// 添加
	@RequestMapping("/addPermission")
	@ResponseBody
	public void addPermission(Permissions permissions){
		permissionsService.addPermission(permissions);
	}
	// 删除
	@RequestMapping("/del")
	@ResponseBody
	public void del(Integer id){
		permissionsService.del(id);
	}
		
}
