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
 * ”√ªßµ«¬º 
 */

@Controller
public class UserLoginController {

	@Autowired
	private UserLoginService userLoginService;
	
	@RequestMapping(value="/LoginController",method=RequestMethod.POST)
	public String UserLogin(User userInfo,Model model,HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		String msg=null;
		PrintWriter out = response.getWriter();
		System.out.println(userInfo.getUser_Iphone());
		List<User> userInfoList = userLoginService.Login(userInfo);
		if(userInfoList.size()==0){
			out.flush();
			out.println("<script>");
			out.println("alert('’À∫≈≤ª¥Ê‘⁄');");
			out.println("history.back();");
			out.println("</script>");
			return "LoginAndRegister";
		}else {
			for (User user : userInfoList) {
				if (user.getUser_Password().equals(userInfo.getUser_Password())) {
					model.addAttribute("userName", user.getUser_Name());
					return "index";
				} else {
					out.flush();
					out.println("<script>");
					out.println("alert('√‹¬Î¥ÌŒÛ');");
					out.println("history.back();");
					out.println("</script>");
					return "LoginAndRegister";
				}
			}
		}
		return msg;
	}
	
}
