package org.example.questproject.service.impl;

import org.example.questproject.model.Question;
import org.example.questproject.service.CsvService;

import java.io.*;
import java.sql.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class CsvServiceImpl implements CsvService {
    @Override
    public List<Question> readAllQuestions() {
        List<Question> questions = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader("/Users/user/IdeaProjects/projects/QuestProject/src/main/resources/questionList.csv"))) {
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
            throw new RuntimeException(e);
        }
        return questions;
    }

}
