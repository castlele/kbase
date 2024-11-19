package com.castlelecs.consolecalculator;

import com.castlelecs.consolecalculator.eventlistener.CalculatorEventListener;

public class App {

    public static void main(String[] args) {
        CalculatorEventListener listener = new CalculatorEventListener();

        listener.run();
    }
}
