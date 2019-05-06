package com.qst.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.qst.bean.*;
import com.qst.dao.QuestionDao;
import com.qst.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import javax.servlet.http.HttpServletRequest;

import java.io.PrintWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Iterator;

import static com.alibaba.fastjson.JSON.parseObject;
import static com.alibaba.fastjson.JSON.setDefaultTypeKey;

/*
 * ??????????
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
     * ????????
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
     * ???????????
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
     * ???????????
     */
    @RequestMapping("/staff")
    public String Staff(String userName, Model model, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        /*if (user == null) {
            return "redirect:LoginAndRegister";
        }*/
        if (user != null) {
            model.addAttribute("userName", user.getUserName());
            model.addAttribute("userId",user.getId());
        }
        List<Admin> result = adminService.getAllDoctor();
        model.addAttribute("result",result);
        return "staff";
    }

    /*
     * ??????
     */
    @RequestMapping("/project")
    public String Project(String userName, Model model, HttpServletRequest request,HttpServletResponse response)throws IOException {
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            return "redirect:LoginAndRegister";
        }
        UserQuestion userQuestion = userQuestionService.selectUserByUserId(user.getId());
        if (userQuestion != null) {
            //System.out.println(user.getUserName());
           /* int ress=JOptionPane.showConfirmDialog(null, "是否重新填写问卷", "重新填写", JOptionPane.YES_NO_OPTION);
            if(ress==JOptionPane.YES_OPTION){
                userQuestionService.deleteUserById(user.getId());
                return "forward:/repetition";

            }else{
                return "forward:/contact";
            }
            //return "forward:/contact";*/
            out.flush();
            out.println("<script>");
            out.println("alert('您已填写过问卷，请查看体质');");
            //out.println("history.back();");
            out.println("</script>");
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
     * ?????д???????
     */
    @RequestMapping("/repetition")
    public String Repetition(){
        return "forward:/project";
    }
    /*
     * 体质测评转
     * 化分数=[（原始分-条目数）/（条目数×4）] ×100%；
     */
    @RequestMapping("/contact")
    public String Contact(String userName, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            return "redirect:LoginAndRegister";
        }
        UserQuestion userQuestion = userQuestionService.selectUserByUserId(user.getId());{

        if(userQuestion == null) {
            /*int ress=JOptionPane.showConfirmDialog(null, "您未填写问卷，是否填写？", "填写问卷", JOptionPane.YES_NO_OPTION);
            if(ress==JOptionPane.YES_OPTION){
                return "forward:/project";

            }else{
                out.flush();
                out.println("<script>");
                out.println(" window.location.reload();;");
                out.println("history.back();");
                out.println("</script>");
            }*/
            out.flush();
            out.println("<script>");
            out.println("alert('您未填写问卷，请填写问卷');");
            //out.println("history.back();");
            out.println("</script>");
            return "forward:/project";
            }
        }
        Map<Integer,Integer> map = (Map)JSONArray.parseObject(userQuestion.getUserScore());
        model.addAttribute("userName", user.getUserName());
        model.addAttribute("score", userQuestion.getUserScore());
        StringBuffer describe = new StringBuffer();
        boolean ph = false;//?????
        boolean pp = false;//???????
        int[] p = new int[10];//???????
        int[] w = new int[10];//????????
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
        StringBuffer suggest = new StringBuffer();
        Properties properties = new Properties();
        // 使用ClassLoader加载properties配置文件生成对应的输入流
        InputStream in = JumpController.class.getClassLoader().getResourceAsStream("suggest.properties");
        // 使用properties对象加载输入流
        properties.load(new InputStreamReader(in,"utf-8"));
        //获取key对应的value值
//        properties.getProperty();
        if(pp){
            describe.append("确认为偏颇体质，具体情况为");
            for(int i : p){
                if(i != 0){
                    QuestionType questionType = questionTypeService.getType(i);
                    describe.append(questionType.getType() + " ");
                    suggest.append(properties.get(questionType.getId()+"") + "\r\n");
                }
            }
        }
        if(ph){
            describe.append("确认为平和体质");
            suggest.append(properties.get("1"));
            if(wIndex != 0){
                describe.append(",疑似体质可能为");
                for(int i : w){
                    if(i != 0){
                        QuestionType questionType = questionTypeService.getType(i);
                        describe.append(questionType.getType() + " ");
                    }
                }
            }
        }
        model.addAttribute("describe", describe.toString());
        model.addAttribute("suggest",suggest.toString());
        return "contact";
    }

    @RequestMapping("/userDetail")
    public String userDetail(HttpServletRequest request,Model model){
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            return "redirect:LoginAndRegister";
        }
       // model.addAttribute("user",user);
        model.addAttribute("userName", user.getUserName());
        model.addAttribute("userId",user.getId());
        return "userDetail";
    }

    /*
     * ????????????
     */
    @RequestMapping("/LoginAndRegister")
    public String LoginAndRegister(String userName, Model model) {
        model.addAttribute("userName", userName);
        return "LoginAndRegister";
    }

    @RequestMapping("/chat")
    public String chat(String userId, String doctorId, Model model,HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
         if (user == null) {
            return "redirect:LoginAndRegister";
        }
        model.addAttribute("userId",userId);
        model.addAttribute("doctorId",doctorId);
        return "chat";
    }

    @RequestMapping("/DelUser1")
    public String DelUser1(String userName,HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        UserQuestion userQuestion = userQuestionService.selectUserByUserId(user.getId());
        userQuestionService.deleteUserById(user.getId());
        return "forward:/project";
    }
}
