package com.qst.service;

import com.qst.bean.QuestionType;
import com.qst.dao.QuestionTypeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuestionTypeService {

    @Autowired
    private QuestionTypeDao questionTypeDao;

    public List<QuestionType> getQuestionType(){
        return questionTypeDao.getQuestionType();
    }

    public QuestionType getType(int id){
        return questionTypeDao.getTypeById(id);
    }
}
