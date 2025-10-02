package org.example.questproject.servlets;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.questproject.model.QuestionRequest;
import org.example.questproject.model.QuestionResponse;
import org.example.questproject.service.QuestionService;
import org.example.questproject.service.impl.QuestionServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;

import static org.example.questproject.servlets.utils.Paths.*;

@WebServlet(name = "questServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private final Logger log = LoggerFactory.getLogger(HelloServlet.class);



    private final QuestionService questionService = new QuestionServiceImpl();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        QuestionResponse qResponse = questionService.getQuestion(session, request.getParameterNames().asIterator());

        if (qResponse.getResult() != null) {
            if (qResponse.getResult().equals("win")) {
                request.getRequestDispatcher(WINNER_PAGE).forward(request, response);
            } else if (qResponse.getResult().equals("lose")) {
                request.getRequestDispatcher(FAILURE_PAGE).forward(request, response);
            }
        }else {

            request.setAttribute("username", session.getAttribute("username"));
            request.setAttribute("ip", session.getAttribute("ip"));
            request.setAttribute("counter", session.getAttribute("counter"));
            request.setAttribute("questionName", qResponse.getContent());
            request.setAttribute("opt1", qResponse.getOption1());
            request.setAttribute("opt2", qResponse.getOption2());
            request.getRequestDispatcher(QUESTION_PAGE).forward(request, response);
        }

    }

}