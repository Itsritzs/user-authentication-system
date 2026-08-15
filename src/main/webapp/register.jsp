<%
    String error = request.getParameter("error");
    String success = request.getParameter("success");
    
    if (session.getAttribute("userName") != null) {
        response.sendRedirect("dashboard.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <title>Register - User Authentication System</title>

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

        .register-container {
            background: white;
            width: 400px;
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

        .login-link {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }

        .login-link a {
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

        .success-message {
            background: #e6f4ea;
            color: #188038;
            padding: 10px;
            border-radius: 6px;
            text-align: center;
            margin-bottom: 18px;
            font-size: 14px;
        }

    </style>

</head>

<body>

    <div class="register-container">

        <h2>Create Account</h2>

        <p class="subtitle">
            Register to get started
        </p>


        <%
            if ("duplicate".equals(error)) {
        %>

            <div class="error-message">
                An account with this email already exists!
            </div>

        <%
            } else if ("failed".equals(error)) {
        %>

            <div class="error-message">
                Registration failed. Please try again.
            </div>

        <%
            } else if ("server".equals(error)) {
        %>

            <div class="error-message">
                Something went wrong. Please try again later.
            </div>

        <%
            } else if ("registered".equals(success)) {
        %>

            <div class="success-message">
                Registration successful! You can now login.
            </div>

        <%
            }
        %>


        <form action="register" method="post">

            <label>Name</label>

            <input
                type="text"
                name="name"
                placeholder="Enter your name"
                required
            >


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
                placeholder="Create a password"
                required
            >


            <button type="submit">
                Create Account
            </button>

        </form>


        <p class="login-link">

            Already have an account?

            <a href="login.jsp">
                Login
            </a>

        </p>

    </div>

</body>

</html>