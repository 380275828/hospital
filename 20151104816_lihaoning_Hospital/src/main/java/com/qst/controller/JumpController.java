package com.qst.controller;

import com.alibaba.fastjson.JSONObject;
import com.qst.bean.*;
import com.qst.dao.QuestionDao;
import com.qst.service.AdminService;
import com.qst.service.QuestionnaireService;
import com.qst.service.UserQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/*
 * ��ת������̨
 */

@Controller
public class JumpController {

    @Autowired
    private QuestionnaireService questionnaireService;

    @Autowired
    private UserQuestionService userQuestionService;

    @Autowired
    private AdminService adminService;

    /*
     * ��ת����ҳ
     */
    @RequestMapping("/index")
    public String Index(Model model, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            model.addAttribute("userName", user.getUserName());
        }
        return "index";
    }

    /*
     * ��ת�������Ϣ
     */
    @RequestMapping("/About")
    public String About(String userName, Model model,HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            model.addAttribute("userName", user.getUserName());
        }
        return "About";
    }

    /*
     * ��ת��ҽ����Ա
     */
    @RequestMapping("/staff")
    public String Staff(String userName, Model model, HttpServletRequest request) {
        List<Admin> result = adminService.getAllDoctor();
        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            model.addAttribute("userName", user.getUserName());
        }
        model.addAttribute("result",result);
        return "staff";
    }

    /*
     * ��ת���
     */
    @RequestMapping("/project")
    public String Project(String userName, Model model, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            return "redirect:LoginAndRegister";
        }
        UserQuestion userQuestion = userQuestionService.selectUserByUserId(user.getId());
        if (userQuestion != null) {
            return "forward:/contact";
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
        model.addAttribute("userName", user.getUserName());
        model.addAttribute("result", pageModel);
        return "project";
    }

    /*
     * ��ת����ϵ����
     */
    @RequestMapping("/contact")
    public String Contact(String userName, Model model, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            return "redirect:LoginAndRegister";
        }
        UserQuestion userQuestion = userQuestionService.selectUserByUserId(user.getId());
        if(userQuestion == null){
            return "forward:/project";
        }
        model.addAttribute("userName", user.getUserName());
        model.addAttribute("score", userQuestion.getUserScore());
        String describe = "";
        if (userQuestion.getUserScore() > 18) {
            describe = "�������ﵽ����ķ���";
        } else {
            describe = "�������û�дﵽ����ķ���";
        }
        model.addAttribute("describe", describe);
        return "contact";
    }

    @RequestMapping("/userDetail")
    public String userDetail(HttpServletRequest request,Model model){
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            return "redirect:LoginAndRegister";
        }
        model.addAttribute("user",user);
        return "userDetail";
    }

    /*
     * ��ת����ϵ����
     */
    @RequestMapping("/LoginAndRegister")
    public String LoginAndRegister(String userName, Model model) {
        model.addAttribute("userName", userName);
        return "LoginAndRegister";
    }

    @RequestMapping("/chat")
    public String chat(){
        return "chat";
    }
	/*@RequestMapping("/Questionnaire")
	public String Questionnaire(String userName,Model model){
		model.addAttribute("userName",userName);
		return "Questionnaire";
	}*/
}
