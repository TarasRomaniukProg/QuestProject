package org.example.questproject.model;

public class Question {
    private int id;
    private String content;

    private String opt1Text;
    private int opt1;

    private String opt2Text;
    private int opt2;

    public Question(int id, String content, String opt1Text, int opt1, String opt2Text, int opt2) {
        this.id = id;
        this.content = content;
        this.opt1Text = opt1Text;
        this.opt1 = opt1;
        this.opt2Text = opt2Text;
        this.opt2 = opt2;
    }

    public Question() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getOpt1() {
        return opt1;
    }

    public void setOpt1(int opt1) {
        this.opt1 = opt1;
    }

    public int getOpt2() {
        return opt2;
    }

    public void setOpt2(int opt2) {
        this.opt2 = opt2;
    }

    public String getOpt1Text() {
        return opt1Text;
    }

    public void setOpt1Text(String opt1Text) {
        this.opt1Text = opt1Text;
    }

    public String getOpt2Text() {
        return opt2Text;
    }

    public void setOpt2Text(String opt2Text) {
        this.opt2Text = opt2Text;
    }

    @Override
    public String toString() {
        return "Question{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", opt1Text='" + opt1Text + '\'' +
                ", opt1=" + opt1 +
                ", opt2Text='" + opt2Text + '\'' +
                ", opt2=" + opt2 +
                '}';
    }
}