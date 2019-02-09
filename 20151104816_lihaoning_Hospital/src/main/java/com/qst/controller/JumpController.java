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
 * 跳转到控制台
 */

@Controller
public class JumpController {

    @Autowired
    QuestionnaireService questionnaireService;

    /*
     * 跳转到主页
     */
    @RequestMapping("/index")
    public String Index(String userName, Model model) {
        model.addAttribute("userName", userName);
        return "index";
    }

    /*
     * 跳转到相关信息
     */
    @RequestMapping("/About")
    public String About(String userName, Model model) {
        model.addAttribute("userName", userName);
        return "About";
    }

    /*
     * 跳转到医务人员
     */
    @RequestMapping("/staff")
    public String Staff(String userName, Model model) {
        model.addAttribute("userName", userName);
        return "staff";
    }

    /*
     * 跳转答卷
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
     * 跳转到联系我们
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
     * 跳转到联系我们
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
