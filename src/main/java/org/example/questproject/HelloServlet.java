package org.example.questproject;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "questServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        System.out.println();
        request.setAttribute("questionName","Would you mind to accept ufo ...?");
        request.getRequestDispatcher("question.jsp").forward(request, response);
    }
}