package com.qst.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONObject;
import netscape.javascript.JSObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.qst.bean.User;
import com.qst.service.UserLoginService;


@Controller
public class UserLoginController {

	@Autowired
	private UserLoginService userLoginService;
	
	@RequestMapping(value="/LoginController",method=RequestMethod.POST)
	public String UserLogin(User userInfo, Model model, HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setCharacterEncoding("utf-8");
		String msg = null;
		PrintWriter out = response.getWriter();
		User user = userLoginService.Login(userInfo);
		if (user == null) {
			out.flush();
			out.println("<script>");
			out.println("alert('用户名错误，请重新登陆');");
			out.println("history.back();");
			out.println("</script>");
			return "LoginAndRegister";
		} else {
			if (user.getPassword().equals(userInfo.getPassword())) {
				HttpSession session = request.getSession();
				session.setAttribute("user",user);
				model.addAttribute("userName", user.getUserName());
				return "index";
			} else {
				out.flush();
				out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />");
				out.println("<script>");
				out.println("alert('密码错误，请重新登陆');");
				out.println("history.back();");
				out.println("</script>");
				return "LoginAndRegister";
			}
		}
	}

	@RequestMapping("/userLogin")
	public String userLogin(HttpServletRequest request){
		request.getSession().removeAttribute("user");
		return "index";
	}

	@RequestMapping(value="/LoginCheak" )
	public void LoginCheak(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String phone = request.getParameter("phoneNum");
		if(userLoginService.select(phone) != 0){
			response.getWriter().write("Flase");
		}else{
			response.getWriter().write("True");
		}
	}
}
