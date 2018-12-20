package com.qst.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 * ��ת������̨
 */

@Controller
public class JumpController {
	/*
	 * ��ת����ҳ
	 */
	@RequestMapping("/index")
	public String Index(){
		return "index";
	}
	
	/*
	 * ��ת�������Ϣ
	 */
	@RequestMapping("/About")
	public String About() {
		return "About";
	}

	/*
	 * ��ת��ҽ����Ա
	 */
	@RequestMapping("/staff")
	public String Staff() {
		return "staff";
	}
	
	/*
	 * ��ת����Ŀ
	 */
	@RequestMapping("/project")
	public String Project() {
		return "project";
	}
	
	/*
	 * ��ת����ϵ����
	 */
	@RequestMapping("/contact")
	public String Contact() {
		return "contact";
	}
	
	/*
	 * ��ת����ϵ����
	 */
	@RequestMapping("/LoginAndRegister")
	public String LoginAndRegister() {
		return "LoginAndRegister";
	}
}
