package org.example.questproject.model;

public class QuestionRequest {
    private int currQuestion;
    private int option;

    public QuestionRequest(int currQuestion, int option) {
        this.currQuestion = currQuestion;
        this.option = option;
    }

    public int getCurrQuestion() {
        return currQuestion;
    }

    public int getOption() {
        return option;
    }

    public void setCurrQuestion(int currQuestion) {
        this.currQuestion = currQuestion;
    }

    @Override
    public String toString() {
        return "QuestionRequest{" +
                "currQuestion=" + currQuestion +
                ", option=" + option +
                '}';
    }
}
