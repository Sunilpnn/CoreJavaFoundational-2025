<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String role = (String) session.getAttribute("role");
    String username = (String) session.getAttribute("username"); // Assuming username is stored in session
    if (role == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String searchQuery = request.getParameter("search");
%>
 
<html>
<head>
    <title>Books List - BookNest</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: #f0f2f5;
            color: #333;
            margin: 0;
            padding: 40px;
        }

        h2 {
            text-align: center;
            font-size: 32px;
            color: #34495e;
            margin-bottom: 30px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .user-icon {
            display: flex;
            align-items: center;
            font-size: 18px;
            color: #2c3e50;
        }

        .user-icon img {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.15);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #2c3e50;
            color: #fff;
        }

        .btn {
            padding: 8px 16px;
            background-color: #3498db;
            color: #fff;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            margin: 5px;
        }

        .btn.delete {
            background-color: #e74c3c;
        }

        .btn.buy {
            background-color: #e67e22;
        }

        .back-btn {
            display: inline-block;
            margin-bottom: 20px;
            padding: 10px 15px;
            background: #7f8c8d;
            color: #fff;
            text-decoration: none;
            border-radius: 6px;
        }

        .search-form {
            margin-bottom: 20px;
            text-align: center;
        }

        .search-input {
            padding: 8px;
            width: 300px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        .search-btn {
            padding: 8px 16px;
            border: none;
            background-color: #2ecc71;
            color: #fff;
            border-radius: 6px;
            cursor: pointer;
        }
    </style>
</head>

<body>

    <div class="header">
    <h2>Books List</h2>
    <div class="user-icon">
        <span style="font-size: 24px; margin-right: 10px;">👤</span>
        <span><%= (username != null) ? username : "User" %></span>
    </div>
</div>

    <a href="home.jsp" class="back-btn">⬅ Back to Home</a>

    <form class="search-form" method="get" action="books.jsp">
        <input type="text" name="search" class="search-input" placeholder="Search by title..." value="<%= (searchQuery != null) ? searchQuery : "" %>" />
        <button type="submit" class="search-btn">🔍 Search</button>
    </form>

    <% if ("admin".equals(role)) { %>
        <a href="addBook.jsp" class="btn">➕ Add New Book</a>
    <% } %>

    <div class="container">
        <table>
            <thead>
                <tr>
                    <th>Book ID</th>
                    <th>Title</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <% if ("admin".equals(role)) { %>
                        <th>Actions</th>
                    <% } %>
                    <th>Buy</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore", "root", "root");
                        Statement stmt = con.createStatement();
                        String query = "SELECT * FROM books";
                        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                            query += " WHERE title LIKE '%" + searchQuery.replace("'", "''") + "%'";
                        }
                        ResultSet rs = stmt.executeQuery(query);

                        while (rs.next()) {
                            int bookId = rs.getInt("book_id");
                            String title = rs.getString("title");
                            double price = rs.getDouble("price");
                            int quantity = rs.getInt("quantity");
                %>
                <tr>
                    <td><%= bookId %></td>
                    <td><%= title %></td>
                    <td>$<%= price %></td>
                    <td><%= quantity %></td>

                    <% if ("admin".equals(role)) { %>
                        <td>
                            <a href="editBook.jsp?id=<%= bookId %>" class="btn">Edit</a>
                            <a href="deleteBook.jsp?id=<%= bookId %>" class="btn delete">Delete</a>
                        </td>
                    <% } %>

                    <td>
                        <form method="post" action="buybook.jsp" style="display:inline-block;">
                            <input type="number" name="qty" value="1" min="1" max="<%= quantity %>" <%= (quantity == 0) ? "disabled" : "" %> />
                            <input type="hidden" name="bookId" value="<%= bookId %>" />
                            <button type="submit" class="btn buy" <%= (quantity == 0) ? "disabled" : "" %>>Buy</button>
                        </form>
                    </td>
                </tr>
                <%
                        }

                        rs.close();
                        stmt.close();
                        con.close();
                    } catch (Exception e) {
                %>
                <tr><td colspan="6" style="color:red;">Error: <%= e.getMessage() %></td></tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

</body>
</html>
