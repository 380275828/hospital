package com.qst.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.qst.bean.User;
import com.qst.service.RegisterService;
import org.springframework.web.bind.annotation.ResponseBody;

/*
 * ÓÃ»§×¢²á
 */
@Controller
public class RegisterController {

	@Autowired
	private RegisterService registerService;

	@RequestMapping(value = "/RegisterController", method = RequestMethod.POST)
	@ResponseBody
	public String Register(User userInfo,HttpServletResponse response) throws IOException {
		if (registerService.Register(userInfo) == 1){
			return "true";
		}
		else{
			return "false";
		}
	}

	@RequestMapping("/updateUser")
	@ResponseBody
	public String updateUser(User user, HttpServletRequest request){
		int res = registerService.updateUser(user);
		if(res != 0){
			request.getSession().setAttribute("user",user);
		}
		return "true";
	}
}
