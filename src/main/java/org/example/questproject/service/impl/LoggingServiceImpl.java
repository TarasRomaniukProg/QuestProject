package org.example.questproject.service.impl;

import org.example.questproject.service.LoggingService;

import java.util.Map;

public class LoggingServiceImpl implements LoggingService {
    private static Map<String, String> logs;

    @Override
    public void log(String username, String description) {
        logs.put(username, description);
    }

    public static Map<String, String> getLogs() {
        return logs;
    }
}
