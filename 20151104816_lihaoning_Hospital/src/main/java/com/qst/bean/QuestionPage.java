package com.qst.bean;

import java.util.List;

public class QuestionPage {

    private int id;
    private String qName;
    private List<Integer> qAnswer;
    private int qType;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getqName() {
        return qName;
    }

    public void setqName(String qName) {
        this.qName = qName;
    }

    public List<Integer> getqAnswer() {
        return qAnswer;
    }

    public void setqAnswer(List<Integer> qAnswer) {
        this.qAnswer = qAnswer;
    }

    public int getqType() {
        return qType;
    }

    public void setqType(int qType) {
        this.qType = qType;
    }
}
