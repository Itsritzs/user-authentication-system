package com.auth;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {

        Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3306/user_authentication_system";
            String username = System.getenv("DB_USERNAME");
            String password = System.getenv("DB_PASSWORD");

            connection = DriverManager.getConnection(url, username, password);

            System.out.println("Database connected successfully!");

        } catch (Exception e) {
            e.printStackTrace();
        }

        return connection;
    }
}
