package cn.deepcoding.dao;

import java.util.List;

import cn.deepcoding.model.Permissions;

public interface PermissionsDao {
	
	// 查询所有
	List<Permissions> getAll(Permissions permissions);
	// 根据 id查询
	Permissions getById(Integer id);
	// 修改
	void update(Permissions permissions);
	// 添加
	void addPermission(Permissions permissions);
	// 删除
	void del(Integer id);
}
