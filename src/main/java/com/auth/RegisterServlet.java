package com.auth;

import org.mindrot.jbcrypt.BCrypt;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLIntegrityConstraintViolationException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        

        String sql = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, hashedPassword);

            int result = statement.executeUpdate();

            if (result > 0) {

                response.sendRedirect("login.jsp?success=registered");

            } else {

                response.sendRedirect("register.jsp?error=failed");

            }

            statement.close();
            connection.close();

        } catch (SQLIntegrityConstraintViolationException e) {

            response.sendRedirect("register.jsp?error=duplicate");

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect("register.jsp?error=server");

        }
    }
}