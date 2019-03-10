package com.qst.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.qst.bean.QuestionType;
import com.qst.bean.User;
import com.qst.dao.UserQuestionDao;
import com.qst.service.QuestionTypeService;
import com.qst.service.UserQuestionService;
import org.apache.ibatis.annotations.Param;
import org.omg.CORBA.INTERNAL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.qst.bean.Question;
import com.qst.service.QuestionnaireService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class QuestionnaireController {

	@Autowired
	private QuestionnaireService questionnaireService;
	@Autowired
	private UserQuestionService userQuestionService;
	@Autowired
	private QuestionTypeService questionTypeService;


	@RequestMapping(value="/Questionnaire")
	public String Questionnaire(Question question,Model model) {
		System.out.println("asdasdasd112233");
		List<Question> questionList = questionnaireService.select();

		model.addAttribute("questionList",questionList);
		return "Questionnaire";
		//∫ÛÃ®œ‘ æ
	}

	@RequestMapping(value = "/addScore")
	@ResponseBody
	public String addScore(@RequestParam(value = "score[]") String[] score, @RequestParam(value = "qType[]") String[] qType, HttpServletRequest request){
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Map<String,Integer> scoreMap = new HashMap<>();
		List<QuestionType> result = questionTypeService.getQuestionType();
		int[] qNum = new int[result.size()];
		for(int i = 0 ; i < qType.length; i ++){
			String qtype = qType[i];
			if(scoreMap.containsKey(qtype)){
				int value = scoreMap.get(qtype);
				value += Integer.parseInt(score[i]);
				scoreMap.put(qtype,value);
			}else {
				scoreMap.put(qtype,Integer.parseInt(score[i]));
			}
			qNum[Integer.parseInt(qtype)]++;
		}
		Map<Integer,Integer> zMap = new HashMap<>();
		for(Map.Entry entry : scoreMap.entrySet()){
			int qScore = Integer.parseInt(entry.getValue().toString());
			int num = qNum[Integer.parseInt(entry.getKey().toString())];
			double zScore = ((qScore-num) / (num * 4.0))*100;
			zMap.put(Integer.parseInt(entry.getKey().toString()),(int)zScore);
		}
		Integer res = userQuestionService.insertUserQuestion(JSONArray.toJSON(zMap).toString(),user.getId());
		return res.toString();
	}

	@RequestMapping("/add_question")
	public String addQuestion(Model model){
		List<QuestionType> result = questionTypeService.getQuestionType();
		model.addAttribute("result",result);
		return "add_question";
	}

	@RequestMapping("/add_question_success")
	@ResponseBody
	public String addQuestionSuccess(String qName,String qType){
		Question question = new Question();
		question.setqName(qName);
		question.setqType(Integer.parseInt(qType));
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
