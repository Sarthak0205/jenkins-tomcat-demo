package com.devops.demo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/calculate")
public class CalculatorServlet extends HttpServlet {

    private final Calculator calculator = new Calculator();

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        double a = Double.parseDouble(request.getParameter("a"));
        double b = Double.parseDouble(request.getParameter("b"));
        String operation = request.getParameter("operation");

        double result;

        try {
            switch (operation) {
                case "add":
                    result = calculator.add(a, b);
                    break;

                case "subtract":
                    result = calculator.subtract(a, b);
                    break;

                case "multiply":
                    result = calculator.multiply(a, b);
                    break;

                case "divide":
                    result = calculator.divide(a, b);
                    break;

                default:
                    throw new IllegalArgumentException("Invalid operation");
            }

            request.setAttribute("result", result);
            request.setAttribute("a", a);
            request.setAttribute("b", b);
            request.setAttribute("operation", operation);

        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
        }

        request.getRequestDispatcher("/index.jsp")
                .forward(request, response);
    }
}