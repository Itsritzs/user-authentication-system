package com.auth;

import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String sql = "SELECT * FROM users WHERE email = ?";

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setString(1, email);

            ResultSet result = statement.executeQuery();

            if (result.next()) {

                String hashedPassword = result.getString("password");

                if (BCrypt.checkpw(password, hashedPassword)) {

                    HttpSession session = request.getSession();

                    session.setAttribute("userName", result.getString("name"));
                    session.setAttribute("userEmail", result.getString("email"));

                    response.sendRedirect("dashboard.jsp");

                } else {

                    response.sendRedirect("login.jsp?error=invalid");

                }

            } else {

                response.sendRedirect("login.jsp?error=invalid");

            }

            result.close();
            statement.close();
            connection.close();

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect("login.jsp?error=server");

        }
    }
}