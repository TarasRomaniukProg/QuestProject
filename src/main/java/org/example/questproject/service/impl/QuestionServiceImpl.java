package org.example.questproject.service.impl;

import jakarta.servlet.http.HttpSession;
import org.example.questproject.model.Question;
import org.example.questproject.model.QuestionRequest;
import org.example.questproject.model.QuestionResponse;
import org.example.questproject.service.CsvService;
import org.example.questproject.service.QuestionService;

import java.util.List;

public class QuestionServiceImpl implements QuestionService {
    private final CsvService csv = new CsvServiceImpl();
    private final List<Question> questions = csv.readAllQuestions();

    @Override
    public QuestionResponse getQuestion(QuestionRequest request, HttpSession session) {
        QuestionResponse response = new QuestionResponse();
        if (request.getOption() == -1) {
            response.setContent(questions.get(request.getCurrQuestion()-1).getContent());
            response.setOption1(questions.get(request.getCurrQuestion()-1).getOpt1Text());
            response.setOption2(questions.get(request.getCurrQuestion()-1).getOpt2Text());
        } else {
            int nextQuestion = request.getOption() == 1 ? questions.get(request.getCurrQuestion()-1).getOpt1() : questions.get(request.getCurrQuestion()-1).getOpt2();
            if (nextQuestion == -1) {
                session.removeAttribute("questionId");
                response.setResult("lose");
                return response;
            } else if (nextQuestion == 0) {
                session.removeAttribute("questionId");
                response.setResult("win");
                return response;
            } else {
                request.setCurrQuestion(nextQuestion);
                response.setContent(questions.get(request.getCurrQuestion()-1).getContent());
                response.setOption1(questions.get(request.getCurrQuestion()-1).getOpt1Text());
                response.setOption2(questions.get(request.getCurrQuestion()-1).getOpt2Text());

                session.setAttribute("questionId", String.valueOf(request.getCurrQuestion()));
            }
        }
        return response;
    }
}
