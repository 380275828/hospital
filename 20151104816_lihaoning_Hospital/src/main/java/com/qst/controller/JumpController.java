package com.qst.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.qst.bean.*;
import com.qst.dao.QuestionDao;
import com.qst.service.AdminService;
import com.qst.service.QuestionTypeService;
import com.qst.service.QuestionnaireService;
import com.qst.service.UserQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static com.alibaba.fastjson.JSON.parseObject;

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

    @Autowired
    private QuestionTypeService questionTypeService;

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
            questionPage.setqType(question.getqType());
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
        Map<Integer,Integer> map = (Map)JSONArray.parseObject(userQuestion.getUserScore());
        model.addAttribute("userName", user.getUserName());
        model.addAttribute("score", userQuestion.getUserScore());
        StringBuffer describe = new StringBuffer();
        boolean ph = false;//ƽ����
        boolean pp = false;//ƫ������
        int[] p = new int[10];//ƫ������
        int[] w = new int[10];//��������
        int wIndex = 0;
        int pIndex = 0;
        if(Integer.parseInt(map.get("1").toString()) > 60){
            ph = true;
        }
        for(Map.Entry entry : map.entrySet()){
            if(entry.getKey() == "1"){
                continue;
            }
            if(Double.valueOf(entry.getValue().toString()) > 40){
                pp = true;
                p[pIndex++] = Integer.parseInt(entry.getKey().toString());
            }
            if(Double.valueOf(entry.getValue().toString()) >= 30 && Double.valueOf(entry.getValue().toString()) <= 39){
                w[wIndex++] = Integer.parseInt(entry.getKey().toString());
            }
        }
        if(pp){
            describe.append("ȷ��Ϊƫ�����ʣ��������Ϊ");
            for(int i : p){
                if(i != 0){
                    QuestionType questionType = questionTypeService.getType(i);
                    describe.append(questionType.getType() + " ");
                }
            }
        }
        if(ph){
            describe.append("ȷ��Ϊƫ������");
            if(w.length != 0){
                describe.append(",�������ʿ���Ϊ");
                for(int i : w){
                    if(i != 0){
                        QuestionType questionType = questionTypeService.getType(i);
                        describe.append(questionType.getType() + " ");
                    }
                }
            }
        }
        model.addAttribute("describe", describe.toString());
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
