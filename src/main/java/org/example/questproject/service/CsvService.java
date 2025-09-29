package org.example.questproject.service;

import org.example.questproject.model.Question;

import java.util.List;

public interface CsvService {
    List<Question> readAllQuestions();
}
