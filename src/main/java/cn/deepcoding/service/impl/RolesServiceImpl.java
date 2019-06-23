package cn.deepcoding.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.deepcoding.dao.PermissionsDao;
import cn.deepcoding.dao.RolesDao;
import cn.deepcoding.dao.RolesPermissionsDao;
import cn.deepcoding.dao.UsersRolesDao;
import cn.deepcoding.model.Permissions;
import cn.deepcoding.model.Roles;
import cn.deepcoding.model.RolesPermissions;
import cn.deepcoding.service.RolesService;
@Service
public class RolesServiceImpl implements RolesService {
	
	@Autowired
	private RolesDao rolesDao;
	@Autowired
	private UsersRolesDao usersRolesDao;
	@Autowired
	private PermissionsDao permissionsDao;
	@Autowired
	private RolesPermissionsDao rolesPermissionsDao;
	
	// 查询所有角色
	@Override
	public List<Roles> getAll(Roles roles) {
		
		return rolesDao.getAll(roles);
	}
	// 查询所有权限
	@Override
	public List<Permissions> getAllPermission(Permissions permissions) {
		List<Permissions> all = permissionsDao.getAll(permissions);
		return all;
	}
	
	// 根据 id 查询
	@Override
	public Roles getById(Integer id) {
		
		return rolesDao.getById(id);
	}
	// 修改角色
	@Override
	public void updateRole(Roles roles) {
		rolesDao.updateRole(roles);

	}
	// 添加角色
	@Override
	public void addRole(Roles roles) {
		rolesDao.addRole(roles);

	}
	// 添加关联权限
	@Override
	public void addRole3(Integer id,int [] permissionId) {
		for (int i : permissionId) {
			System.err.println("id:"+id+"   "+"permissionId:"+i);
			rolesPermissionsDao.addByRoleId(id,i);
		}	
	}
	// 删除角色
	@Override
	public void deleteRole(Integer id) {
		usersRolesDao.deleteByRoleId(id);
		rolesPermissionsDao.deleteByRoleId(id);
		rolesDao.deleteRole(id);

	}
	// 根据 角色 id ，权限 id 删除关联信息
	@Override
	public void deleteByRoleIdPermissionId(Integer permissionId,Integer roleId) {
		rolesPermissionsDao.deleteByRoleIdPermissionId(roleId, permissionId);
		
	}
	// 根据 角色 id 查匈关联权限
	@Override
	public List<Permissions> getById2(Integer id) {
		Roles byId = rolesDao.getById(id);
		List<Permissions> permission = new ArrayList<Permissions>();
		List<RolesPermissions> rolesPermissions = byId.getRolesPermissions();
		for (RolesPermissions rolesPermissions2 : rolesPermissions) {
			Permissions permissions2 = rolesPermissions2.getPermissions();
			permission.add(permissions2);
		}
		return permission;
	}
}
