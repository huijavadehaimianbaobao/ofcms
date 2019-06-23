package cn.deepcoding.dao;

import java.util.List;

import cn.deepcoding.model.Roles;

public interface RolesDao {
	
	// 查询所有角色
	List<Roles> getAll(Roles roles);
	// 根据id 查询角色
	Roles getById(Integer id);
	// 修改角色
	void updateRole(Roles roles);
	// 添加角色
	void addRole(Roles roles);
	// 删除角色
	void deleteRole(Integer id);
	
}
