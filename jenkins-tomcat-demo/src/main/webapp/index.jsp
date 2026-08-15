<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DevOps Calculator</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #111827, #1f2937);
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
        }

        .container {
            width: 400px;
            padding: 30px;
            background: #ffffff;
            color: #111827;
            border-radius: 20px;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.35);
        }

        .header {
            text-align: center;
            margin-bottom: 25px;
        }

        .header h1 {
            margin: 0;
            font-size: 30px;
        }

        .header p {
            margin: 8px 0 0;
            color: #6b7280;
        }

        label {
            display: block;
            margin-bottom: 7px;
            font-weight: bold;
        }

        input,
        select,
        button {
            width: 100%;
            padding: 13px;
            border-radius: 10px;
            font-size: 16px;
        }

        input,
        select {
            border: 1px solid #d1d5db;
            margin-bottom: 18px;
        }

        button {
            border: none;
            background: #dc2626;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background: #b91c1c;
        }

        .result {
            margin-top: 20px;
            padding: 15px;
            border-radius: 10px;
            background: #f3f4f6;
            text-align: center;
        }

        .result strong {
            font-size: 24px;
        }

        .error {
            margin-top: 20px;
            padding: 12px;
            background: #fee2e2;
            color: #991b1b;
            border-radius: 10px;
            text-align: center;
        }

        .footer {
            text-align: center;
            margin-top: 22px;
            font-size: 12px;
            color: #9ca3af;
        }
    </style>
</head>

<body>

<div class="container">

    <div class="header">
        <h1>DevOps Calculator</h1>
        <p>Jenkins + Maven + Tomcat</p>
    </div>

    <form action="calculate" method="post">

        <label>First Number</label>
        <input
                type="number"
                name="a"
                step="any"
                placeholder="Enter first number"
                required>

        <label>Operation</label>
        <select name="operation">
            <option value="add">Addition (+)</option>
            <option value="subtract">Subtraction (-)</option>
            <option value="multiply">Multiplication (×)</option>
            <option value="divide">Division (÷)</option>
        </select>

        <label>Second Number</label>
        <input
                type="number"
                name="b"
                step="any"
                placeholder="Enter second number"
                required>

        <button type="submit">Calculate</button>

    </form>

    <% if (request.getAttribute("result") != null) { %>

        <div class="result">
            Result:
            <br>
            <strong>
                <%= request.getAttribute("result") %>
            </strong>
        </div>

    <% } %>

    <% if (request.getAttribute("error") != null) { %>

        <div class="error">
            <%= request.getAttribute("error") %>
        </div>

    <% } %>

    <div class="footer">
        Deployed automatically using Jenkins CI/CD
    </div>

</div>

</body>
</html>