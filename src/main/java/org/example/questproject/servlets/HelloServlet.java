package org.example.questproject.servlets;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.questproject.model.QuestionRequest;
import org.example.questproject.model.QuestionResponse;
import org.example.questproject.service.QuestionService;
import org.example.questproject.service.impl.QuestionServiceImpl;

import java.io.IOException;

@WebServlet(name = "questServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {

    private final QuestionService questionService = new QuestionServiceImpl();
    private final String QUESTION_PAGE = "question.jsp";
    private final String WINNER_PAGE = "winnerPage.jsp";
    private final String FAILURE_PAGE = "failurePage.jsp";

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        QuestionResponse qResponse = questionService.getQuestion(request.getSession(), request.getParameterNames().asIterator());

        if (qResponse.getResult() != null) {
            if (qResponse.getResult().equals("win")) {
                request.getRequestDispatcher(WINNER_PAGE).forward(request, response);
            } else if (qResponse.getResult().equals("lose")) {
                request.getRequestDispatcher(FAILURE_PAGE).forward(request, response);
            }
        }else {
            request.setAttribute("questionName", qResponse.getContent());
            request.setAttribute("opt1", qResponse.getOption1());
            request.setAttribute("opt2", qResponse.getOption2());
            request.getRequestDispatcher(QUESTION_PAGE).forward(request, response);
        }

    }

}