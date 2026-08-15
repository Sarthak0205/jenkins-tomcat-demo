package com.devops.demo;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class CalculatorTest {

    Calculator calculator = new Calculator();

    @Test
    void testAddition() {
        assertEquals(10, calculator.add(4, 6));
    }

    @Test
    void testMultiplication() {
        assertEquals(24, calculator.multiply(4, 6));
    }
}