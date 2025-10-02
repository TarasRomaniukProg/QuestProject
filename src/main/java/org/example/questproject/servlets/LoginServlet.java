package org.example.questproject.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.Enumeration;

import static org.example.questproject.servlets.utils.Paths.QUESTION_PAGE;


@WebServlet(name = "login", value = "/login-servlet")
public class LoginServlet extends HttpServlet {
    private final Logger log = LoggerFactory.getLogger(LoginServlet.class);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String username = req.getParameter("username");

        session.setAttribute("username", username);
        session.setAttribute("counter", "0");
        session.setAttribute("ip", req.getRemoteAddr());



        log.info("User with username '{}' started quest", username);


        req.getRequestDispatcher("/hello-servlet").forward(req, resp);
    }
}
