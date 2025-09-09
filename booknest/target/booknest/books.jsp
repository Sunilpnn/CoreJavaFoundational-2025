<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Books List</title>
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

        .container {
            max-width: 900px;
            margin: 0 auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.15);
        }

        .search-form {
            margin-bottom: 20px;
            display: flex;
            justify-content: center;
            gap: 15px;
        }

        .search-form input {
            padding: 10px;
            font-size: 16px;
            width: 250px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .search-form button {
            padding: 10px 20px;
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .search-form button:hover {
            background-color: #2980b9;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: #ffffff;
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
            background-color: #2ecc71;
            color: #fff;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
            cursor: pointer;
            margin: 5px;
        }

        .btn.buy {
            background-color: #e67e22;
        }

        .user-info {
            position: absolute;
            top: 20px;
            right: 20px;
            display: flex;
            align-items: center;
            background: #fff;
            padding: 10px 15px;
            border-radius: 25px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.15);
        }

        .user-info img {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .user-info span {
            font-weight: bold;
            color: #333;
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
    </style>
</head>
<body>

<%
    String username = (String) session.getAttribute("username");
    if (username != null) {
%>
    <div class="user-info">
        <img src="https://cdn-icons-png.flaticon.com/512/149/149071.png" alt="User Icon">
        <span><%= username %></span>
    </div>
<%
    }
%>

<h2>Books List</h2>

<a href="home.jsp" class="back-btn">⬅ Back to Home</a>

<div class="container">
    <!-- Search Form -->
    <form method="get" class="search-form">
        <input type="text" name="searchId" placeholder="Search by Book ID" value="<%= request.getParameter("searchId") != null ? request.getParameter("searchId") : "" %>">
        <input type="text" name="searchTerm" placeholder="Search by Author or Title" value="<%= request.getParameter("searchTerm") != null ? request.getParameter("searchTerm") : "" %>">
        <button type="submit">Search</button>
    </form>

    <table>
        <thead>
            <tr>
                <th>Book ID</th><th>Title</th><th>Author</th><th>Category</th><th>Price</th><th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                String searchTerm = request.getParameter("searchTerm");
                String searchId = request.getParameter("searchId");

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","root");

                    String query = "SELECT * FROM books WHERE 1=1";

                    if (searchId != null && !searchId.trim().isEmpty()) {
                        query += " AND book_id = ?";
                    }

                    if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                        query += " AND (title LIKE ? OR author LIKE ?)";
                    }

                    PreparedStatement pstmt = con.prepareStatement(query);

                    int paramIndex = 1;
                    if (searchId != null && !searchId.trim().isEmpty()) {
                        pstmt.setInt(paramIndex++, Integer.parseInt(searchId));
                    }

                    if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                        String pattern = "%" + searchTerm + "%";
                        pstmt.setString(paramIndex++, pattern);
                        pstmt.setString(paramIndex++, pattern);
                    }

                    ResultSet rs = pstmt.executeQuery();
                    while(rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("book_id") %></td>
                <td><%= rs.getString("title") %></td>
                <td><%= rs.getString("author") %></td>
                <td><%= rs.getString("category") != null ? rs.getString("category") : "N/A" %></td>
                <td>$<%= rs.getDouble("price") %></td>
                <td>
                    <form action="Cart.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="bookId" value="<%= rs.getInt("book_id") %>">
                        <input type="hidden" name="qty" value="1">
                        <button type="submit" class="btn">Add to Cart</button>
                    </form>

                    <form action="billing.jsp" method="get" style="display:inline;">
                        <input type="hidden" name="bookId" value="<%= rs.getInt("book_id") %>">
                        <input type="hidden" name="qty" value="1">
                        <button type="submit" class="btn buy">Buy</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                    rs.close();
                    pstmt.close();
                    con.close();
                } catch(Exception e) {
                    out.println("<tr><td colspan='6' style='color:red;'>Error: "+e.getMessage()+"</td></tr>");
                }
            %>
        </tbody>
    </table>
</div>

</body>
</html>
