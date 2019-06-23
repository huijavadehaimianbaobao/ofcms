package cn.deepcoding.service;

import java.util.List;

import cn.deepcoding.model.Users;
import cn.deepcoding.model.UsersRoles;

public interface UsersRolesService {
	// 关联表查询
	List<UsersRoles> getRoles(Users users);

}
