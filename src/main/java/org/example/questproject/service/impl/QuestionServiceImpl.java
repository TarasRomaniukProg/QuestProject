package org.example.questproject.service.impl;

import jakarta.servlet.http.HttpSession;
import org.example.questproject.model.Question;
import org.example.questproject.model.QuestionResponse;
import org.example.questproject.service.CsvService;
import org.example.questproject.service.QuestionService;
import org.example.questproject.servlets.LoginServlet;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Iterator;
import java.util.List;

public class QuestionServiceImpl implements QuestionService {
    private final Logger log = LoggerFactory.getLogger(LoginServlet.class);

    private final String QUEST_PATH = "questionList.csv";

    private final CsvService csv = new CsvServiceImpl();
    private final List<Question> questions = csv.readAllQuestions(QUEST_PATH);

    @Override
    public QuestionResponse getQuestion(HttpSession session, Iterator<String> req) {
        if (session.getAttribute("questionId") == null) {
            session.setAttribute("questionId", "1");
        }
        QuestionResponse response = new QuestionResponse();


        String opt = null;
        String username = (String) session.getAttribute("username");

        int questionId = Integer.parseInt((String) session.getAttribute("questionId"));
        log.info("User with username '{}' currently answers on question № {}", username, questionId );

        if (req.hasNext()) {
            opt = req.next();
        }

        if (opt == null || (!opt.equals("opt1") && !opt.equals("opt2"))) {
            log.info("User with username '{}' chosen nothing", username);

            response.setContent(questions.get(questionId-1).getContent());
            response.setOption1(questions.get(questionId-1).getOpt1Text());
            response.setOption2(questions.get(questionId-1).getOpt2Text());
        } else {
            int nextQuestion = opt.equals("opt1") ? questions.get(questionId-1).getOpt1() : questions.get(questionId-1).getOpt2();
            log.info("User with username '{}' chosen option {}", username, opt);
            if (nextQuestion == -1) { // -1 Means failure, according to questionList.csv
                log.info("According to option {} user with username '{}' will be redirected to failure page", opt, username);
                session.removeAttribute("questionId");
                response.setResult("lose");
                return response;
            } else if (nextQuestion == 0) {
                log.info("According to option {} user with username '{}' will be redirected to winner page", opt, username);
                session.removeAttribute("questionId");
                response.setResult("win");
                return response;
            } else {
                questionId = nextQuestion;

                log.info("User with username '{}' will be redirected to question number {}", username,questionId);
                response.setContent(questions.get(questionId-1).getContent());
                response.setOption1(questions.get(questionId-1).getOpt1Text());
                response.setOption2(questions.get(questionId-1).getOpt2Text());

                session.setAttribute("questionId", questionId + "");
            }
        }
        return response;
    }
}
