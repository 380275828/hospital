package com.qst.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.qst.bean.User;
import com.qst.service.UserLoginService;

/*
 * ÓÃ»§µÇÂ¼ 
 */

@Controller
public class UserLoginController {

	@Autowired
	private UserLoginService userLoginService;
	
	@RequestMapping(value="/LoginController",method=RequestMethod.POST)
	public String UserLogin(User userInfo,Model model){
		List<User> userInfoList = userLoginService.Login(userInfo);
		if(userInfoList.size()==0)
			System.out.println("0000000");
		else
			System.err.println("111111");
		return "index";
	}
}
