package com.castlelecs.consolecalculator.interpreter;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Scanner;

public class ConsoleInterpreter {

    public List<String> stopSymbols = new ArrayList<>();

    private Scanner scanner;

    public ConsoleInterpreter(InputStream input) {
        this.scanner = new Scanner(input);
    }

    public ConsoleInterpreter(String input) {
        this.scanner = new Scanner(input);
    }

    public boolean hasNext() {
        return scanner.hasNext();
    }

    public String next() {
        return scanner.next();
    }

    public int waitForInt() throws Exception {
        while (scanner.hasNext()) {
            try {
                return scanner.nextInt();
            } catch (Exception e) {
                checkStopSymbols(scanner.next());
                System.out.println(e.getMessage());
            }
        }

        throw new InterpreterExceptions.NoIntInputException();
    }

    public String waitForCharIn(String[] awaitedChars) throws Exception {
        while (scanner.hasNext()) {
            try {
                String currentString = scanner.next();

                checkStopSymbols(currentString);

                if (isItemInArray(currentString, awaitedChars)) {
                    return currentString;
                } else {
                    continue;
                }
            } catch (InterpreterExceptions.StopCommandException e) {
                throw e;

            } catch (Exception e) {
                checkStopSymbols(scanner.next());
                System.out.println(e.getMessage());
            }
        }

        throw new InterpreterExceptions.NoCharInputException();
    }

    private void checkStopSymbols(String symbol) throws InterpreterExceptions.StopCommandException {
        if (stopSymbols.contains(symbol.toLowerCase())) {
            throw new InterpreterExceptions.StopCommandException(symbol);
        }

        return;
    }

    private <T> boolean isItemInArray(T itemToFind, T[] a) {
        for (T item : a) {
            if (Objects.equals(item, itemToFind)) {
                return true;
            }
        }

        return false;
    }
}
