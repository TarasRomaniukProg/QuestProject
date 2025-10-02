package org.example.questproject.model.exception;

public class WrongPathException extends RuntimeException {
    public WrongPathException(String path) {
        super("You have provided a wrong path: '" + path + "'");
    }
}
