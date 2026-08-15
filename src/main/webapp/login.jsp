<%
    String error = request.getParameter("error");
    if (session.getAttribute("userName") != null) {
    response.sendRedirect("dashboard.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>

    <title>Login - User Authentication System</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f2f4f7;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .login-container {
            background: white;
            width: 380px;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 10px;
            color: #222;
        }

        .subtitle {
            text-align: center;
            color: #777;
            margin-bottom: 25px;
            font-size: 14px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            color: #333;
        }

        input {
            width: 100%;
            padding: 11px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        input:focus {
            outline: none;
            border-color: #4a90e2;
        }

        button {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 6px;
            background: #4a90e2;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background: #357abd;
        }

        .register-link {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }

        .register-link a {
            color: #4a90e2;
            text-decoration: none;
            font-weight: bold;
        }

        .error-message {
            background: #ffe6e6;
            color: #d93025;
            padding: 10px;
            border-radius: 6px;
            text-align: center;
            margin-bottom: 18px;
            font-size: 14px;
        }

    </style>

</head>

<body>

    <div class="login-container">

        <h2>Welcome Back</h2>

        <p class="subtitle">Login to your account</p>

        <%
            if ("invalid".equals(error)) {
        %>

            <div class="error-message">
                Invalid email or password!
            </div>

        <%
            } else if ("server".equals(error)) {
        %>

            <div class="error-message">
                Something went wrong. Please try again.
            </div>

        <%
            }
        %>

        <form action="login" method="post">

            <label>Email</label>

            <input
                type="email"
                name="email"
                placeholder="Enter your email"
                required
            >

            <label>Password</label>

            <input
                type="password"
                name="password"
                placeholder="Enter your password"
                required
            >

            <button type="submit">Login</button>

        </form>

        <p class="register-link">
            Don't have an account?
            <a href="register.jsp">Create one</a>
        </p>

    </div>

</body>
</html>