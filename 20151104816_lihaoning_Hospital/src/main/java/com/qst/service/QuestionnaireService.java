package com.qst.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qst.bean.Question;
import com.qst.dao.QuestionDao;

@Service
public class QuestionnaireService {
	@Autowired
	private QuestionDao questionDao;
	
	public List<Question> select(Question question){
		return questionDao.getQuestionByBean(question);
	}

}
