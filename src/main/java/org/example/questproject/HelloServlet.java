package org.example.questproject;


import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.questproject.model.Question;
import org.example.questproject.service.CsvService;
import org.example.questproject.service.impl.CsvServiceImpl;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

@WebServlet(name = "questServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {

    private final CsvService csv = new CsvServiceImpl();
    private final List<Question> questions = csv.readAllQuestions();

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

        String questionContent = "";
        String opt1Text = "";
        String opt2Text = "";

        if (opt == null) {
            questionContent = questions.get(questionId-1).getContent();
            opt1Text = questions.get(questionId-1).getOpt1Text();
            opt2Text = questions.get(questionId-1).getOpt2Text();
        } else {
            int nextQuestion = opt.equals("opt1") ? questions.get(questionId-1).getOpt1() : questions.get(questionId-1).getOpt2();
            if (nextQuestion == -1) {
                session.removeAttribute("questionId");
                request.getRequestDispatcher("failurePage.jsp").forward(request, response);
                return;
            } else if (nextQuestion == 0) {
                session.removeAttribute("questionId");
                request.getRequestDispatcher("winnerPage.jsp").forward(request, response);
                return;
            } else {
                questionId = nextQuestion;
                questionContent = questions.get(questionId-1).getContent();
                opt1Text = questions.get(questionId-1).getOpt1Text();
                opt2Text = questions.get(questionId-1).getOpt2Text();

                session.setAttribute("questionId", String.valueOf(questionId));
            }
        }

        request.setAttribute("questionName", questionContent);
        request.setAttribute("opt1", opt1Text);
        request.setAttribute("opt2", opt2Text);
        request.getRequestDispatcher("question.jsp").forward(request, response);
    }

}