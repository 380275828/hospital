package com.qst.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.qst.bean.User;
import com.qst.service.RegisterService;

/*
 * ÓÃ»§×¢²á
 */
@Controller
public class RegisterController {

	@Autowired
	private RegisterService registerService;

	@RequestMapping(value = "/RegisterController", method = RequestMethod.POST)
	public String Register(User userInfo,HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		if (registerService.Register(userInfo) == 1)
			return "index";
		else{
			out.flush();
			out.println("<script>");
			out.println("alert('×¢²áÊ§°Ü£¬ÇëÖØÐÂ×¢²á');");
			out.println("history.back();");
			out.println("</script>");
			return "LoginAndRegister";
		}
	}
}
