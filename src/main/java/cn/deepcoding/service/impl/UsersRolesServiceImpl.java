package cn.deepcoding.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.deepcoding.dao.UsersRolesDao;
import cn.deepcoding.model.Users;
import cn.deepcoding.model.UsersRoles;
import cn.deepcoding.service.UsersRolesService;

@Service
@Transactional
public class UsersRolesServiceImpl implements UsersRolesService {
	@Autowired
	private UsersRolesDao userrolesdao;

	@Override
	public List<UsersRoles> getRoles(Users users) {
		// TODO Auto-generated method stub
		return userrolesdao.getRoleByUserId(users.getId());
	}

}
