<%@ page import="java.sql.*" %>
<%@ include file="dbconnect.jsp" %>
<%
    String uname = request.getParameter("username");
    String password = request.getParameter("password");

    if (uname != null && password != null) {
        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
            ps.setString(1, uname);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                session.setAttribute("username", uname);
                response.sendRedirect("books.jsp");
            } else {
                out.println("<div class='error'>⚠ Invalid username or password! <a href='login.jsp'>Try Again</a></div>");
            }

            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            out.println("<div class='error'>Error: " + e.getMessage() + "</div>");
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Login - BookNest</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-image: url(https://imgs.search.brave.com/bn5H5Lqy_GLe_QiLyTLGpYsWVJCLYm7dMqZloBTyxJg/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9jZG4u/ZHJpYmJibGUuY29t/L3VzZXJ1cGxvYWQv/MTczNzQ0NTAvZmls/ZS9vcmlnaW5hbC03/YjFmMjU3MDg0MGRj/NGE5N2Q3OGQ3Mjhj/OTc2YWVhMy5wbmc_/Zm9ybWF0PXdlYnAm/cmVzaXplPTQwMHgz/MDAmdmVydGljYWw9/Y2VudGVy);
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            width: 350px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 8px 0 20px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #007bff;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .error {
            background-color: #ffdddd;
            border-left: 6px solid #f44336;
            padding: 10px;
            margin-bottom: 15px;
            color: #a94442;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login to BookNest</h2>

        <form method="post">
            <label>Username</label>
            <input type="text" name="username" placeholder="Enter your username" required>

            <label>Password</label>
            <input type="password" name="password" placeholder="Enter your password" required>

            <input type="submit" value="Login">
        </form>
    </div>
</body>
</html>
