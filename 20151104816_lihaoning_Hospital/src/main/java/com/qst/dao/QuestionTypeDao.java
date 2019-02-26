package com.qst.dao;

import com.qst.bean.QuestionType;

import java.util.List;

public interface QuestionTypeDao {

    List<QuestionType> getQuestionType();

    QuestionType getTypeById(int id);
}
