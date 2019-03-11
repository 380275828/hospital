package com.qst.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.qst.bean.User;
import com.qst.service.RegisterService;
import org.springframework.web.bind.annotation.ResponseBody;

/*
 * 用户注册
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
		int ress= JOptionPane.showConfirmDialog(null, "是否确认修改？", "是否继续", JOptionPane.YES_NO_OPTION);
		if(ress==JOptionPane.YES_OPTION){
			//System.out.println("选择是后执行的代码");
			int res = registerService.updateUser(user);
			if(res != 0){
				request.getSession().setAttribute("user",user);
			}
			return "true";
		}else{
			//System.out.println("选择否后执行的代码");    //点击“否”后执行这个代码块
			return "userDetail";
		}
		/*int res = registerService.updateUser(user);
		if(res != 0){
			request.getSession().setAttribute("user",user);
		}
		return "true";*/
	}
}
