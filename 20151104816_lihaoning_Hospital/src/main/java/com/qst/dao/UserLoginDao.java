package com.qst.dao;

import java.util.List;

import com.qst.bean.User;

/*
 * �û���¼
 */
public interface UserLoginDao {

	public List<User> getUserLoginByBean(User userInfo);

	public List<User> getAllUserByPage(User page);

	int deleteuUser(String id);
	
}
