package com.qst.controller;

import com.qst.bean.Admin;
import com.qst.bean.Question;
import com.qst.bean.QuestionType;
import com.qst.bean.User;
import com.qst.service.AdminService;
import com.qst.service.QuestionTypeService;
import com.qst.service.QuestionnaireService;
import com.qst.service.UserLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserLoginService userLoginService;

    @Autowired
    private AdminService adminService;

    @Autowired
    private QuestionnaireService questionnaireService;

    @Autowired
    private QuestionTypeService questionTypeService;


    @RequestMapping("/login")
    public String login(){
        return "adminLogin";
    }

    @RequestMapping("/loginOut")
    public String loginOut(HttpServletRequest request){
        request.getSession().removeAttribute("admin");
        return "adminLogin";
    }

    @RequestMapping("/logined")
    public String logined(Admin admin, Model model, HttpServletRequest request){
        Admin res = adminService.getAdminUser(admin);
        if (res != null && res.getUserName() != null && !"".equals(res.getUserName())) {
            HttpSession session = request.getSession();
            session.setAttribute("admin",res);
            model.addAttribute("userName", res.getUserName());
            return "forward:adminIndex";
        }else{
            return "redirect:login";
        }
    }

    @RequestMapping("/adminIndex")
    public String adminIndex(Model model,String currentPage){
        User page = new User();
        if(currentPage != null && !"".equals(currentPage)){
            int pageNum = Integer.parseInt(currentPage);
            if(pageNum < 1){
                page.getPage().setCurrentPage(pageNum);
            }else{
                page.getPage().setCurrentPage(pageNum);
            }

        }
        List<User> result = userLoginService.getAllUser(page);
        model.addAttribute("result",result);
        model.addAttribute("page",page);
        return "admin_index";
    }

    @RequestMapping("/doctor")
    public String doctor(Model model,String currentPage){
        Admin page = new Admin();
        if(currentPage != null && !"".equals(currentPage)){
            int pageNum = Integer.parseInt(currentPage);
            if(pageNum < 1){
                page.getPage().setCurrentPage(pageNum);
            }else{
                page.getPage().setCurrentPage(pageNum);
            }

        }
        List<Admin> result = adminService.getAllAdminByPage(page);
        model.addAttribute("result",result);
        model.addAttribute("page",page);
        return "admin_doctor";
    }

    @RequestMapping("/question")
    public String question(Model model,String currentPage){
        Question page = new Question();
        if(currentPage != null && !"".equals(currentPage)){
            int pageNum = Integer.parseInt(currentPage);
            if(pageNum < 1){
                page.getPage().setCurrentPage(pageNum);
            }else{
                page.getPage().setCurrentPage(pageNum);
            }
        }
        List<Question> result = questionnaireService.getAllQuestionByPage(page);
        List<QuestionType> types = questionTypeService.getQuestionType();
        model.addAttribute("result",result);
        model.addAttribute("page",page);
        model.addAttribute("types",types);
        return "admin_question";
    }

    @RequestMapping("/question_search")
    public String questionSearch(Model model,String qType){
        Question page = new Question();
        if(qType != null && !"".equals(qType)){
            page.setqType(Integer.parseInt(qType));
        }
        List<Question> result = questionnaireService.getAllQuestionByPage(page);
        List<QuestionType> types = questionTypeService.getQuestionType();
        model.addAttribute("result",result);
        model.addAttribute("page",page);
        model.addAttribute("types",types);
        model.addAttribute("qType",qType);
        return "admin_question";
    }

    @RequestMapping("/delete_user")
    public String delete_user(String id){
        userLoginService.deleteUser(id);
        return "forward:adminIndex";
    }

    @RequestMapping("/delete_doctor")
    public String deleteDoctor(String id){
        adminService.deleteDoctor(id);
        return "forward:doctor";
    }

    @RequestMapping("/delete_question")
    public String delete_question(String id){
        questionnaireService.deleteQuestion(id);
        return "forward:question";
    }

    @RequestMapping("/add_doctor")
    public String addDoctor(){
        return "add_doctor";
    }

    @RequestMapping("/add_doctor_success")
    @ResponseBody
    public String addDoctorSuccess(Admin admin){
        admin.setRole(1);
        int res = adminService.addDoctor(admin);
        return String.valueOf(res);
    }

    @RequestMapping("/chat1")
    public String chat(String userId, String doctorId, Model model,HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        /*if (user == null) {
            out.flush();
            out.println("<script>");
            out.println("alert('无用户登录');");
            out.println(" window.location.reload();");
            out.println("history.back();");
            out.println("</script>");
            return "redirect:LoginAndRegister";
        }*/
        model.addAttribute("userId",userId);
        model.addAttribute("doctorId",doctorId);
        return "chat";
    }

    @RequestMapping(value="/select" )
    public void select(HttpServletRequest request,HttpServletResponse response)throws Exception{
        String phone = request.getParameter("phoneNum");
        //response.setContentType("application/json");
        if(adminService.select(phone) != 0){

            response.getWriter().write("1");
        }else{
            response.getWriter().write("0");
        }
    }
}
