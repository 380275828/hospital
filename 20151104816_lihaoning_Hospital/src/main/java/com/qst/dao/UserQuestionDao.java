package com.qst.dao;

import com.qst.bean.UserQuestion;

public interface UserQuestionDao {

    int insertUserQuestion(UserQuestion userQuestion);

    UserQuestion selectUserById(String userId);

    void deleteUserById(String userId);
}
