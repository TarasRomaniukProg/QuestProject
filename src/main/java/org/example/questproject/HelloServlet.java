package org.example.questproject;


import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.questproject.model.Question;
import org.example.questproject.model.QuestionRequest;
import org.example.questproject.model.QuestionResponse;
import org.example.questproject.service.CsvService;
import org.example.questproject.service.QuestionService;
import org.example.questproject.service.impl.CsvServiceImpl;
import org.example.questproject.service.impl.QuestionServiceImpl;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

@WebServlet(name = "questServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {

    private final QuestionService questionService = new QuestionServiceImpl();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        if (session.getAttribute("questionId") == null) {
            session.setAttribute("questionId", "1");
        }

        Iterator<String> req = request.getParameterNames().asIterator();
        String opt = null;

        int questionId = Integer.parseInt((String) session.getAttribute("questionId"));

        if (req.hasNext()) {
            opt = req.next();
        }

        QuestionRequest questionRequest = new QuestionRequest(questionId, (opt == null) ? -1 : ((opt.equals("opt1")) ? 1 : 2));
        QuestionResponse qResponse = questionService.getQuestion(questionRequest, session);

        if (qResponse.getResult() != null) {
            if (qResponse.getResult().equals("win")) {
                request.getRequestDispatcher("winnerPage.jsp").forward(request, response);
            } else if (qResponse.getResult().equals("lose")) {
                request.getRequestDispatcher("failurePage.jsp").forward(request, response);
            }
        }else {
            request.setAttribute("questionName", qResponse.getContent());
            request.setAttribute("opt1", qResponse.getOption1());
            request.setAttribute("opt2", qResponse.getOption2());
            request.getRequestDispatcher("question.jsp").forward(request, response);
        }

    }

}