package com.qst.dao;

import java.util.List;

import com.qst.bean.Question;

public interface QuestionDao {

    List<Question> getQuestionByBean();

    List<Question> getAllQuestionByPage(Question page);

    int deleteQuestion(String id);

    int addQuestion(Question question);
}
