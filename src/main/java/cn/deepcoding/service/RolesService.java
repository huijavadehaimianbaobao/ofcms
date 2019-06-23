package cn.deepcoding.service;

import java.util.List;

import cn.deepcoding.model.Permissions;
import cn.deepcoding.model.Roles;

public interface RolesService {
	
	// 查询所有角色
		List<Roles> getAll(Roles roles);
		// 根据id 查询角色
		Roles getById(Integer id);
		// 根据id 查询关联权限
		List<Permissions> getById2(Integer id);
		// 修改角色
		void updateRole(Roles roles);
		// 添加角色
		void addRole(Roles roles);
		// 添加关联权限
		void addRole3(Integer id,int [] permissionId);
		// 删除角色
		void deleteRole(Integer id);
		// 查询所有权限
		List<Permissions> getAllPermission(Permissions permissions);
		// 根据 角色 id ，权限 id 删除关联信息
		void deleteByRoleIdPermissionId(Integer permissionId, Integer roleId);
}
