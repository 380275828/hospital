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
 * �û�ע��
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
		int ress= JOptionPane.showConfirmDialog(null, "�Ƿ�ȷ���޸ģ�", "�Ƿ����", JOptionPane.YES_NO_OPTION);
		if(ress==JOptionPane.YES_OPTION){
			//System.out.println("ѡ���Ǻ�ִ�еĴ���");
			int res = registerService.updateUser(user);
			if(res != 0){
				request.getSession().setAttribute("user",user);
			}
			return "true";
		}else{
			//System.out.println("ѡ����ִ�еĴ���");    //������񡱺�ִ����������
			return "userDetail";
		}
		/*int res = registerService.updateUser(user);
		if(res != 0){
			request.getSession().setAttribute("user",user);
		}
		return "true";*/
	}
}
