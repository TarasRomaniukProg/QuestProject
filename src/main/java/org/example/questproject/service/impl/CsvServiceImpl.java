package org.example.questproject.service.impl;

import org.example.questproject.model.Question;
import org.example.questproject.model.exception.WrongPathException;
import org.example.questproject.service.CsvService;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class CsvServiceImpl implements CsvService {
    @Override
    public List<Question> readAllQuestions(String path) {
        List<Question> questions = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new InputStreamReader(Objects.requireNonNull(getClass().getClassLoader().getResourceAsStream(path))))) {
            String line;
            while((line = br.readLine()) != null) {
                String[] values = line.split(",");

                int id = Integer.parseInt(values[0]);
                String content = values[1];

                String opt1Text = values[2];
                int opt1 = Integer.parseInt(values[3]);

                String opt2Text = values[4];
                int opt2 = Integer.parseInt(values[5]);

                Question newQuestion = new Question(id, content, opt1Text, opt1, opt2Text, opt2);
                questions.add(newQuestion);
            }

        } catch (IOException e) {
            throw new WrongPathException(path);
        }
        return questions;
    }

}
