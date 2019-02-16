package com.qst.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qst.bean.User;
import com.qst.dao.UserLoginDao;

@Service
public class UserLoginService {
	
	@Autowired
	private UserLoginDao userLoginDao;
	
	public User Login(User userInfo){
		List<User> userLoginByBean = userLoginDao.getUserLoginByBean(userInfo);
		if(userLoginByBean.size() != 0) {
			return userLoginByBean.get(0);
		}
		return null;
	}

}
