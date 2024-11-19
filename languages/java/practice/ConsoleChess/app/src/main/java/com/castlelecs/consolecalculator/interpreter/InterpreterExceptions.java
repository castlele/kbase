package com.castlelecs.consolecalculator.interpreter;

public class InterpreterExceptions extends Exception {

    InterpreterExceptions(String message) {
        super(message);
    }

    public static class NoIntInputException extends InterpreterExceptions {

        private static String MESSAGE = "No input was got, but int was awaited!";

        NoIntInputException() {
            super(MESSAGE);
        }

    }

    public static class NoCharInputException extends InterpreterExceptions {

        private static String MESSAGE = "No input was got, but char was awaited!";

        NoCharInputException() {
            super(MESSAGE);
        }
    }

    public static class StopCommandException extends InterpreterExceptions {

        public String command;

        private static String MESSAGE = "Stop command has been reached!";

        StopCommandException(String command) {
            super(MESSAGE);

            this.command = command;
        }
    }
}
