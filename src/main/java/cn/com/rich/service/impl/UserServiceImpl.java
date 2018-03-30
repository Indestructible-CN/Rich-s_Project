package cn.com.rich.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import cn.com.rich.dao.Et_AdminMapper;
import cn.com.rich.entity.Et_Admin;
import cn.com.rich.service.UserService;

public class UserServiceImpl implements UserService {

	
	@Autowired
	private Et_AdminMapper adminMapper;
	@Override
	public Et_Admin Login(Et_Admin admin) {
		return adminMapper.login(admin);
	}

}
