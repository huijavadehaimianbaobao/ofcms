package cn.deepcoding.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.deepcoding.dao.PermissionsDao;
import cn.deepcoding.dao.RolesPermissionsDao;
import cn.deepcoding.model.Permissions;
import cn.deepcoding.service.PermissionsService;
@Service
public class PermissionsServiceImpl implements PermissionsService {
	
	@Autowired
	private PermissionsDao permissionsDao;
	@Autowired
	private RolesPermissionsDao rolesPermissionsDao;
	// 查询所有
	@Override
	public List<Permissions> getAll(Permissions permissions) {
	
		return permissionsDao.getAll(permissions);
	}
	// 根据 id 查询
	@Override
	public Permissions getById(Integer id) {
	
		return permissionsDao.getById(id);
	}
	// 修改
	@Override
	public void update(Permissions permissions) {
		permissionsDao.update(permissions);

	}
	// 添加
	@Override
	public void addPermission(Permissions permissions) {
		permissionsDao.addPermission(permissions);

	}
	// 删除
	@Override
	public void del(Integer id) {
		rolesPermissionsDao.deleteByPermissionId(id);
		permissionsDao.del(id);

	}

}
