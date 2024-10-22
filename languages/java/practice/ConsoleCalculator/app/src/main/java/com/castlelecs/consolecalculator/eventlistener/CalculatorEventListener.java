package com.castlelecs.consolecalculator.eventlistener;

import java.util.Objects;

import com.castlelecs.consolecalculator.interpreter.ConsoleInterpreter;
import com.castlelecs.consolecalculator.interpreter.InterpreterExceptions;

public class CalculatorEventListener {

    private static String STOP_MESSAGE = "The program is stopped!";
    private static String INPUT_CLEAR_MESSAGE = "Input is cleared!";

    private final static String STOP_OPERATOR = "s";
    private final static String CLEAR_OPERATOR = "c";
    private static String[] OPERATORS = {"+", "*", "/", "-"};
    private ConsoleInterpreter interpreter;

    public CalculatorEventListener() {
        this(new ConsoleInterpreter(System.in));
    }

    public CalculatorEventListener(ConsoleInterpreter interpreter) {
        this.interpreter = interpreter;

        this.interpreter.stopSymbols.add(STOP_OPERATOR);
        this.interpreter.stopSymbols.add(CLEAR_OPERATOR);
    }

    public void run() {
        boolean isStop = false;
        double result = 0;
        boolean isPastResult = false;

        do {
            try {
                result = listenForIntput(isPastResult, result);

                isPastResult = true;
            } catch (InterpreterExceptions.StopCommandException e) {
                switch (e.command.toLowerCase()) {
                    case STOP_OPERATOR:
                        System.out.println(STOP_MESSAGE);
                        isStop = true;
                        break;
                    case CLEAR_OPERATOR:
                        System.out.println(INPUT_CLEAR_MESSAGE);
                        isPastResult = false;
                        break;
                    default:
                        System.out.println(e.getLocalizedMessage());
                        isStop = true;
                        break;
                }

            } catch (Exception e) {
                System.out.println(e.getLocalizedMessage());
                isStop = true;
                break;
            }

        } while (!isStop);
    }

    private double listenForIntput(boolean isPastResult, double pastResult) throws Exception {
        double firstOperand;

        if (isPastResult) {
            firstOperand = pastResult;
        } else {
            System.out.print("Waiting for the first operand: ");
            firstOperand = interpreter.waitForInt();
        }

        System.out.print("Waiting for the operator {-, /, +, *}: ");
        String operator = interpreter.waitForCharIn(OPERATORS);

        System.out.print("Waiting for the first second: ");
        int secondOperand = interpreter.waitForInt();

        double result = executeCommand(firstOperand, secondOperand, operator);
        System.out.println("Result is: " + result);

        return result;
    }

    private double executeCommand(
        double lhs,
        double rhs,
        String operator
    ) throws IllegalArgumentException {
        double result = 0;

        switch (operator) {
            case "+":
                result = lhs + rhs;
                break;
            case "-":
                result = lhs - rhs;
                break;
            case "*":
                result = lhs * rhs;
                break;
            case "/":
                if (rhs == 0) throw new IllegalArgumentException("Division by zero!");
                result = lhs / rhs;
                break;

            default:
                throw new IllegalArgumentException("Unknown operator: " + operator);
        }

        return result;
    }

    private void logResults() {
    }
}
