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
	
	public List<Question> select(){
		return questionDao.getQuestionByBean();
	}

	public List<Question> getAllQuestionByPage(Question page){
		return questionDao.getAllQuestionByPage(page);
	}

	public int deleteQuestion(String id){
		return questionDao.deleteQuestion(id);
	}

	public int addQuestion(Question question){
		return questionDao.addQuestion(question);
	}

}
