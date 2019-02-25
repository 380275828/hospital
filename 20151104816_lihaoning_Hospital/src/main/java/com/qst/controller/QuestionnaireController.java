package com.qst.controller;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.qst.bean.User;
import com.qst.dao.UserQuestionDao;
import com.qst.service.UserQuestionService;
import org.omg.CORBA.INTERNAL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.qst.bean.Question;
import com.qst.service.QuestionnaireService;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class QuestionnaireController {

	@Autowired
	private QuestionnaireService questionnaireService;
	@Autowired
	private UserQuestionService userQuestionService;
	
	@RequestMapping(value="/Questionnaire")
	public String Questionnaire(Question question,Model model) {
		System.out.println("asdasdasd112233");
		List<Question> questionList = questionnaireService.select();

		model.addAttribute("questionList",questionList);
		return "Questionnaire";
		//∫ÛÃ®œ‘ æ
	}

	@RequestMapping(value = "/addScore", method = RequestMethod.GET)
	@ResponseBody
	public String addScore(String score, HttpServletRequest request){
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Integer res = userQuestionService.insertUserQuestion(Integer.parseInt(score),user.getId());
		return res.toString();
	}

	@RequestMapping("/add_question")
	public String addQuestion(){
		return "add_question";
	}

	@RequestMapping("/add_question_success")
	@ResponseBody
	public String addQuestionSuccess(String qName){
		Question question = new Question();
		question.setqName(qName);
		List<Integer> score = new ArrayList<>();
		for(int i = 1; i <=5 ; i++){
			score.add(i);
		}
		question.setqAnswer(JSONArray.toJSONString(score));
		int res = questionnaireService.addQuestion(question);
		if(res != 0){
			return "true";
		}
		return "false";
	}
	
	
}
