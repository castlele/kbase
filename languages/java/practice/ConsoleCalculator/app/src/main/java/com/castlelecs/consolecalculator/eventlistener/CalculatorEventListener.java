package com.castlelecs.consolecalculator.eventlistener;

import com.castlelecs.consolecalculator.interpreter.ConsoleInterpreter;

public class CalculatorEventListener {

    private ConsoleInterpreter interpreter = new ConsoleInterpreter(System.in);

    public void run() {
        try {
            int firstComponent = interpreter.waitForInt();
        } catch (Exception e) {
        }
    }
}
