<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    HttpSession userSession = request.getSession(false);

    if (userSession == null || userSession.getAttribute("userName") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String userName = (String) userSession.getAttribute("userName");
    String userEmail = (String) userSession.getAttribute("userEmail");
%>

<!DOCTYPE html>
<html>

<head>

    <title>Dashboard - User Authentication System</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f2f4f7;
            min-height: 100vh;
        }

        .navbar {
            background: #4a90e2;
            color: white;
            padding: 18px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar h2 {
            font-size: 21px;
        }

        .logout-btn {
            background: white;
            color: #4a90e2;
            text-decoration: none;
            padding: 9px 18px;
            border-radius: 6px;
            font-weight: bold;
            font-size: 14px;
        }

        .logout-btn:hover {
            background: #eaf2fb;
        }

        .dashboard-container {
            width: 500px;
            max-width: 90%;
            margin: 70px auto;
        }

        .welcome-card {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.12);
            text-align: center;
        }

        .welcome-card h1 {
            color: #222;
            margin-bottom: 10px;
        }

        .welcome-text {
            color: #777;
            margin-bottom: 30px;
        }

        .user-info {
            background: #f5f7fa;
            padding: 20px;
            border-radius: 8px;
            text-align: left;
        }

        .user-info p {
            margin-bottom: 12px;
            color: #444;
        }

        .user-info p:last-child {
            margin-bottom: 0;
        }

        .label {
            font-weight: bold;
            color: #222;
        }

    </style>

</head>

<body>

    <div class="navbar">

        <h2>User Authentication System</h2>

        <a href="logout" class="logout-btn">Logout</a>

    </div>


    <div class="dashboard-container">

        <div class="welcome-card">

            <h1>Welcome, <%= userName %>! </h1>

            <p class="welcome-text">
                You are successfully logged in.
            </p>

            <div class="user-info">

                <p>
                    <span class="label">Name:</span>
                    <%= userName %>
                </p>

                <p>
                    <span class="label">Email:</span>
                    <%= userEmail %>
                </p>

            </div>

        </div>

    </div>

</body>

</html>