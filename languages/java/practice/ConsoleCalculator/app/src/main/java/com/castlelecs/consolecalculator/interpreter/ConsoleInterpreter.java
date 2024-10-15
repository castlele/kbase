package com.castlelecs.consolecalculator.interpreter;

import java.io.InputStream;
import java.util.Scanner;

public class ConsoleInterpreter {

    private Scanner scanner;

    public ConsoleInterpreter(InputStream input) {
        this.scanner = new Scanner(input);
    }

    public ConsoleInterpreter(String input) {
        this.scanner = new Scanner(input);
    }

    public int waitForInt() throws Exception {
        while (scanner.hasNext()) {
            try {
                return scanner.nextInt();
            } catch (Exception e) {
                scanner.next();
                System.out.println(e.getMessage());
            }
        }

        throw new InterpreterExceptions.NoIntInputException();
    }
}
