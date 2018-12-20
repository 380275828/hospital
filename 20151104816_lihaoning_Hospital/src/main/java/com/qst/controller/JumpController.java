package com.qst.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 * 跳转到控制台
 */

@Controller
public class JumpController {
	/*
	 * 跳转到主页
	 */
	@RequestMapping("/index")
	public String Index(){
		return "index";
	}
	
	/*
	 * 跳转到相关信息
	 */
	@RequestMapping("/About")
	public String About() {
		return "About";
	}

	/*
	 * 跳转到医务人员
	 */
	@RequestMapping("/staff")
	public String Staff() {
		return "staff";
	}
	
	/*
	 * 跳转到项目
	 */
	@RequestMapping("/project")
	public String Project() {
		return "project";
	}
	
	/*
	 * 跳转到联系我们
	 */
	@RequestMapping("/contact")
	public String Contact() {
		return "contact";
	}
	
	/*
	 * 跳转到联系我们
	 */
	@RequestMapping("/LoginAndRegister")
	public String LoginAndRegister() {
		return "LoginAndRegister";
	}
}
