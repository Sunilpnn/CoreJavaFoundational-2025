<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Get logged-in user from session
    String loggedUser = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BookNest - Home</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        /* Navbar */
        .navbar {
            background-color: #2c3e50;
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .navbar .logo {
            color: #fff;
            font-size: 22px;
            font-weight: bold;
            text-decoration: none;
        }
        .navbar ul {
            list-style: none;
            display: flex;
            margin: 0;
            padding: 0;
        }
        .navbar ul li {
            margin-left: 20px;
        }
        .navbar ul li a, .navbar ul li span {
            text-decoration: none;
            color: #fff;
            font-size: 16px;
        }
        .navbar ul li a:hover {
            color: #f39c12;
        }

        /* Banner */
        .banner {
            background: url(https://imgs.search.brave.com/y0Q08ag0rzuSS6Jcx4DmzpdL0eP6Z4ygZuI3yiIm50o/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzE0LzcxLzU0Lzk0/LzM2MF9GXzE0NzE1/NDk0NjJfblY3T2xz/cXRYdmIxa09yaGlN/aThMcDNya0tQdDNL/SDUuanBn) no-repeat center center/cover;
            height: 80vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: #fff;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.6);
        }
        .banner h1 {
            font-size: 50px;
            margin-bottom: 20px;
        }
        .banner p {
            font-size: 20px;
            margin-bottom: 30px;
        }
        .banner a {
            background-color: #f39c12;
            padding: 12px 25px;
            text-decoration: none;
            color: #fff;
            border-radius: 5px;
            font-size: 18px;
        }
        .banner a:hover {
            background-color: #e67e22;
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<div class="navbar">
    <a href="home.jsp" class="logo">📚 BookNest</a>
    <ul>
        <li><a href="home.jsp">Home</a></li>
        <li><a href="books.jsp">Books</a></li>
        <% if (loggedUser != null) { %>
            <li><span>👤 <%= loggedUser %></span></li>
            <li><a href="logout.jsp">Logout</a></li>
        <% } else { %>
            <li><a href="login.jsp">Login</a></li>
            <li><a href="register.jsp">Register</a></li>
        <% } %>
    </ul>
</div>

<!-- Banner Section -->
<div class="banner">
    <h1>Welcome to BookNest</h1>
    <p>Your one-stop destination for all your favorite books</p>
    <a href="books.jsp">📖 Browse Books</a>
</div>

</body>
</html>
