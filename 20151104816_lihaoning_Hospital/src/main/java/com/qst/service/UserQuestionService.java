package com.qst.service;

import com.qst.bean.UserQuestion;
import com.qst.dao.UserQuestionDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserQuestionService {

    @Autowired
    private UserQuestionDao userQuestionDao;

    public int insertUserQuestion(String score, Integer userId){
        UserQuestion userQuestion = new UserQuestion();
        userQuestion.setUserScore(score);
        userQuestion.setUserId(userId);
        int i = userQuestionDao.insertUserQuestion(userQuestion);
        return i;
    }

    public UserQuestion selectUserByUserId(Integer userId){
        UserQuestion userQuestion = userQuestionDao.selectUserById(userId.toString());
        if(userQuestion != null){
            return userQuestion;
        }
        return userQuestion;
    }
}
