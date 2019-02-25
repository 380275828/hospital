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
 * 跳转到控制台
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
     * 跳转到主页
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
     * 跳转到相关信息
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
     * 跳转到医务人员
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
     * 跳转答卷
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
     * 跳转到联系我们
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
            describe = "你的身体达到及格的分数";
        } else {
            describe = "你的身体没有达到及格的分数";
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
     * 跳转到联系我们
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
