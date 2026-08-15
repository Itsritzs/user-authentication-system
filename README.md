# User Authentication System

A Java-based user authentication system built using Jakarta Servlets, JSP, MySQL, and BCrypt password hashing.

## Features

- User registration
- User login
- BCrypt password hashing
- Secure password verification
- Session-based authentication
- Protected dashboard
- Logout functionality
- Prevents logged-in users from accessing login/register pages
- MySQL database integration
- Environment variables for database credentials

## Technologies Used

- Java
- Jakarta Servlets
- JSP
- MySQL
- JDBC
- BCrypt
- Apache Tomcat
- HTML
- CSS
- Eclipse

## Project Structure

UserAuthenticationSystem
│
├── src/main/java/com/auth
│   ├── DBConnection.java
│   ├── LoginServlet.java
│   ├── LogoutServlet.java
│   └── RegisterServlet.java
│
└── src/main/webapp
    ├── dashboard.jsp
    ├── login.jsp
    ├── register.jsp
    │
    └── WEB-INF
        └── lib
            ├── jbcrypt-0.4.jar
            └── mysql-connector-j-9.7.0.jar

## Authentication Flow

### Registration

1. User enters their name, email, and password.
2. The password is hashed using BCrypt.
3. The hashed password is stored in MySQL.
4. The user can then log in using their original password.

### Login

1. User enters their email and password.
2. The application retrieves the stored password hash from MySQL.
3. BCrypt verifies the entered password against the stored hash.
4. A session is created after successful authentication.
5. The user is redirected to the dashboard.

### Logout

The user's session is invalidated and they are redirected to the login page.

## Security

- Passwords are never stored as plain text.
- BCrypt is used for password hashing and verification.
- Database credentials are stored using environment variables instead of being hard-coded in the source code.
- Session authentication protects the dashboard from unauthorized access.

## Database

The application uses MySQL for storing user information.

Example user table:

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

## Configuration

Set the following environment variables on your system:

DB_USERNAME=your_mysql_username
DB_PASSWORD=your_mysql_password

The application reads these values using:

System.getenv("DB_USERNAME");
System.getenv("DB_PASSWORD");

## How to Run

1. Install Java and Apache Tomcat.
2. Install MySQL.
3. Create the user_authentication_system database.
4. Configure the users table.
5. Set the DB_USERNAME and DB_PASSWORD environment variables.
6. Import the project into Eclipse.
7. Add the project to Apache Tomcat.
8. Start the Tomcat server.
9. Open the application in a browser.

## Future Improvements

- Email verification
- Forgot password functionality
- Password reset
- Remember-me authentication
- Input validation improvements
- Role-based authentication
- User profile management

## Author

Ritesh Sharanagat

GitHub: @Itsritzs