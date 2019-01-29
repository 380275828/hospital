package com.qst.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.qst.bean.User;
import com.qst.service.UserLoginService;

/*
 * �û���¼ 
 */

@Controller
public class UserLoginController {

	@Autowired
	private UserLoginService userLoginService;
	
	@RequestMapping(value="/LoginController",method=RequestMethod.POST)
	public String UserLogin(User userInfo,Model model,HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		String msg = null;
		PrintWriter out = response.getWriter();
		User user = userLoginService.Login(userInfo);
		if (userInfo == null) {
			out.flush();
			out.println("<script>");
			out.println("alert('�˺Ų�����');");
			out.println("history.back();");
			out.println("</script>");
			return "LoginAndRegister";
		} else {
			if (user.getPassword().equals(userInfo.getPassword())) {
				model.addAttribute("userName", user.getUserName());
				return "index";
			} else {
				out.flush();
				out.println("<script>");
				out.println("alert('�������');");
				out.println("history.back();");
				out.println("</script>");
				return "LoginAndRegister";
			}
		}
	}
	
}
