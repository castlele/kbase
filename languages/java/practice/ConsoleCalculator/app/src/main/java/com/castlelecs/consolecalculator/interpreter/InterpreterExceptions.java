package com.castlelecs.consolecalculator.interpreter;

public class InterpreterExceptions extends Exception {

    InterpreterExceptions(String message) {
        super(message);
    }

    public static class NoIntInputException extends InterpreterExceptions {

        // TODO: Create message
        private static String MESSAGE = "";

        NoIntInputException() {
            super(MESSAGE);
        }
    }
}
