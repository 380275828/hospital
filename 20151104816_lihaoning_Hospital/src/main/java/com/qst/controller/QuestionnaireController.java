package com.qst.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.qst.bean.Question;
import com.qst.service.QuestionnaireService;

@Controller
public class QuestionnaireController {

	@Autowired
	private QuestionnaireService questionnaireService;
	
	@RequestMapping(value="/Questionnaire")
	public String Questionnaire(Question question,Model model) {
		System.out.println("asdasdasd112233");
		List<Question> questionList = questionnaireService.select(question);
		
		model.addAttribute("questionList",questionList);
		return "Questionnaire";
		//∫ÛÃ®œ‘ æ
	}
	
	
}
