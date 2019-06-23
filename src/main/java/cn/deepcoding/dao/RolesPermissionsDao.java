package cn.deepcoding.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.deepcoding.model.RolesPermissions;

public interface RolesPermissionsDao {
	
	// 添加 角色权限关联表
	void addByRoleId(@Param("id")Integer id,@Param("permissionId")Integer permissionId);
	// 根据 角色 id 查询所属权限
	List<RolesPermissions> getPermissionByRolesId(Integer id);
	// 查询所有信息
	List<RolesPermissions> getAll();
	
	// 根据角色 id 删除关联信息
	void deleteByRoleId(Integer id);
	// 根据权限 id 删除关联信息
	void deleteByPermissionId(Integer id);
	// 根据 角色 id ，权限 id 删除关联信息
	void deleteByRoleIdPermissionId(@Param("roleId")Integer roleId,@Param("permissionId")Integer permissionId);
}
