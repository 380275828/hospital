package com.qst.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String Index(String userName,Model model){
		model.addAttribute("userName",userName);
		return "index";
	}
	
	/*
	 * 跳转到相关信息
	 */
	@RequestMapping("/About")
	public String About(String userName,Model model) {
		model.addAttribute("userName",userName);
		return "About";
	}

	/*
	 * 跳转到医务人员
	 */
	@RequestMapping("/staff")
	public String Staff(String userName,Model model) {
		model.addAttribute("userName",userName);
		return "staff";
	}
	
	/*
	 * 跳转到项目
	 */
	@RequestMapping("/project")
	public String Project(String userName,Model model) {
		model.addAttribute("userName",userName);
		return "project";
	}
	
	/*
	 * 跳转到联系我们
	 */
	@RequestMapping("/contact")
	public String Contact(String userName,Model model) {
		model.addAttribute("userName",userName);
		return "contact";
	}
	
	/*
	 * 跳转到联系我们
	 */
	@RequestMapping("/LoginAndRegister")
	public String LoginAndRegister(String userName,Model model) {
		model.addAttribute("userName",userName);
		return "LoginAndRegister";
	}
	/*@RequestMapping("/Questionnaire")
	public String Questionnaire(String userName,Model model){
		model.addAttribute("userName",userName);
		return "Questionnaire";
	}*/
}
