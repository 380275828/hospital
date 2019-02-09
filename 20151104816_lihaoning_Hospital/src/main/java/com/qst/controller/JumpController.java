package com.qst.controller;

import com.alibaba.fastjson.JSONObject;
import com.qst.bean.Question;
import com.qst.bean.QuestionPage;
import com.qst.dao.QuestionDao;
import com.qst.service.QuestionnaireService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

/*
 * ��ת������̨
 */

@Controller
public class JumpController {

    @Autowired
    QuestionnaireService questionnaireService;

    /*
     * ��ת����ҳ
     */
    @RequestMapping("/index")
    public String Index(String userName, Model model) {
        model.addAttribute("userName", userName);
        return "index";
    }

    /*
     * ��ת�������Ϣ
     */
    @RequestMapping("/About")
    public String About(String userName, Model model) {
        model.addAttribute("userName", userName);
        return "About";
    }

    /*
     * ��ת��ҽ����Ա
     */
    @RequestMapping("/staff")
    public String Staff(String userName, Model model) {
        model.addAttribute("userName", userName);
        return "staff";
    }

    /*
     * ��ת���
     */
    @RequestMapping("/project")
    public String Project(String userName, Model model) {
        if(userName == null || "".equals(userName)){
            return "redirect:LoginAndRegister";
        }
        List<Question> res = questionnaireService.select();
        List<QuestionPage> pageModel = new ArrayList<>();
        for (Question question : res) {
            QuestionPage questionPage = new QuestionPage();
            questionPage.setId(question.getId());
            questionPage.setqName(question.getqName());
            questionPage.setqAnswer(JSONObject.parseArray(question.getqAnswer(), Integer.class));
            pageModel.add(questionPage);
        }
        model.addAttribute("userName", userName);
        model.addAttribute("result", pageModel);
        return "project";
    }

    /*
     * ��ת����ϵ����
     */
    @RequestMapping("/contact")
    public String Contact(String userName, Model model) {
        if(userName == null || "".equals(userName)){
            return "redirect:LoginAndRegister";
        }
        model.addAttribute("userName", userName);
        return "contact";
    }

    /*
     * ��ת����ϵ����
     */
    @RequestMapping("/LoginAndRegister")
    public String LoginAndRegister(String userName, Model model) {
        model.addAttribute("userName", userName);
        return "LoginAndRegister";
    }
	/*@RequestMapping("/Questionnaire")
	public String Questionnaire(String userName,Model model){
		model.addAttribute("userName",userName);
		return "Questionnaire";
	}*/
}
