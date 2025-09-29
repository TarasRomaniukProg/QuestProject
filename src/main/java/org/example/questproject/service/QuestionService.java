package org.example.questproject.service;

import jakarta.servlet.http.HttpSession;
import org.example.questproject.model.QuestionRequest;
import org.example.questproject.model.QuestionResponse;

public interface QuestionService {
    QuestionResponse getQuestion(QuestionRequest request, HttpSession session);
}
