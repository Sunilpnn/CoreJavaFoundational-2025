<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

<h2>Books List</h2>
<a href="home.jsp" class="back-btn">⬅ Back to Home</a>

<div class="container">
    <table>
        <thead>
            <tr>
                <th>Book ID</th>
                <th>Title</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","root");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM books");

            while(rs.next()){
        %>
        <form action="buybook.jsp" method="post">
            <tr>
                <td><%= rs.getInt("book_id") %></td>
                <td><%= rs.getString("title") %></td>
                <td>$<%= rs.getDouble("price") %></td>
                <td>
                    <input type="number" name="qty" value="1" min="1"/>
                    <input type="hidden" name="bookId" value="<%= rs.getInt("book_id") %>"/>
                </td>
                <td><button type="submit" class="btn buy">Buy</button></td>
            </tr>
        </form>
        <%
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(Exception e) {
            out.println("<tr><td colspan='5' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
        }
        %>
        </tbody>
    </table>
</div>

</body>
</html>
