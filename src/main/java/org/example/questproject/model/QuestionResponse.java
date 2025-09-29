package org.example.questproject.model;

public class QuestionResponse {
    private String content;
    private String option1;
    private String option2;
    private String result;

    public QuestionResponse(String content, String option1, String option2, String result) {
        this.content = content;
        this.option1 = option1;
        this.option2 = option2;
        this.result = result;
    }

    public QuestionResponse() {
    }

    public String getContent() {
        return content;
    }

    public String getOption1() {
        return option1;
    }

    public String getOption2() {
        return option2;
    }

    public String getResult() {
        return result;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setOption1(String option1) {
        this.option1 = option1;
    }

    public void setOption2(String option2) {
        this.option2 = option2;
    }

    public void setResult(String result) {
        this.result = result;
    }

    @Override
    public String toString() {
        return "QuestionResponse{" +
                "content='" + content + '\'' +
                ", option1='" + option1 + '\'' +
                ", option2='" + option2 + '\'' +
                ", result='" + result + '\'' +
                '}';
    }
}