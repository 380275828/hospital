package com.qst.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String Index(String userName,Model model){
		model.addAttribute("userName",userName);
		return "index";
	}
	
	/*
	 * ��ת�������Ϣ
	 */
	@RequestMapping("/About")
	public String About(String userName,Model model) {
		model.addAttribute("userName",userName);
		return "About";
	}

	/*
	 * ��ת��ҽ����Ա
	 */
	@RequestMapping("/staff")
	public String Staff(String userName,Model model) {
		model.addAttribute("userName",userName);
		return "staff";
	}
	
	/*
	 * ��ת����Ŀ
	 */
	@RequestMapping("/project")
	public String Project(String userName,Model model) {
		model.addAttribute("userName",userName);
		return "project";
	}
	
	/*
	 * ��ת����ϵ����
	 */
	@RequestMapping("/contact")
	public String Contact(String userName,Model model) {
		model.addAttribute("userName",userName);
		return "contact";
	}
	
	/*
	 * ��ת����ϵ����
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
