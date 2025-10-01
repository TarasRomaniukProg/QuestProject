package org.example.questproject.service;

import jakarta.servlet.http.HttpSession;
import org.example.questproject.model.QuestionResponse;

import java.util.Iterator;

public interface QuestionService {
    QuestionResponse getQuestion(HttpSession session, Iterator<String> params);
}
