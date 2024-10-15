package com.castlelecs.consolecalculator.interpreter;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

import org.junit.jupiter.api.function.Executable;

import org.junit.jupiter.api.Test;

public class ConsoleInterpreterTests {

    private static String INPUT_OF_INTS = "1 2 3 4 5 6";
    private static String INPUT_OF_CHARS = "a b c d e ";

    @Test
    void waitForIntReturnsFirstIntInTheInput() {
        ConsoleInterpreter sut = createInterpreter(INPUT_OF_INTS);

        assertNotThrows(() -> {
            int result = sut.waitForInt();

            assertEquals(toInt(INPUT_OF_INTS.charAt(0)), result);
        });
    }

    @Test
    void waitForIntIgnoresAllWrongSymbols() {
        ConsoleInterpreter sut = createInterpreter(INPUT_OF_CHARS + INPUT_OF_INTS);

        assertNotThrows(() -> {
            int result = sut.waitForInt();

            assertEquals(toInt(INPUT_OF_INTS.charAt(0)), result);
        });
    }

    private ConsoleInterpreter createInterpreter(String input) {
        return new ConsoleInterpreter(input);
    }

    private void assertNotThrows(Executable executable) {
        try {
            executable.execute();
        } catch (Throwable e) {
            fail("No Error is expected, but got one with message: " + e.getMessage());
        }
    }

    private int toInt(char c) {
        return c - '0';
    }
}
