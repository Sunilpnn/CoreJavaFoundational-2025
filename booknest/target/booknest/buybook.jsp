<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Purchased Bills</title>
    <style>
        body { font-family: Arial; margin:20px; background:#f4f4f4; }
        table { width:100%; border-collapse: collapse; background:#fff; }
        th, td { border:1px solid #ccc; padding:8px; text-align:left; }
        th { background:#f39c12; color:#fff; text-align:center; }
        .btn { padding:5px 10px; background:#3498db; color:#fff; border:none; border-radius:4px; text-decoration:none; }
        .back-btn { margin-bottom:15px; display:inline-block; text-decoration:none; color:#fff; background:#7f8c8d; padding:5px 10px; border-radius:4px; }
    </style>
</head>
<body>

<h2>Purchased Bills</h2>
<a href="books.jsp" class="back-btn">⬅ Back to Books</a>

<table>
    <thead>
        <tr>
            <th>Bill ID</th>
            <th>Book ID</th>
            <th>Book Title</th>
            <th>Quantity</th>
            <th>Total Price</th>
        </tr>
    </thead>
    <tbody>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/bookstore", "root", "root");

                Statement stmt = con.createStatement();
                
                // Order by bill_id DESC to show latest bills first
                String query = "SELECT bills.bill_id, bills.book_id, bills.quantity, total_price, books.title " +
                               "FROM bills INNER JOIN books ON bills.book_id = books.book_id " +
                               "ORDER BY bills.bill_id DESC";

                ResultSet rs = stmt.executeQuery(query);

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("bill_id") %></td>
            <td><%= rs.getInt("book_id") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getInt("quantity") %></td>
            <td>$<%= rs.getDouble("total_price") %></td>
        </tr>
        <%
                }

                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='5' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
    </tbody>
</table>

</body>
</html>
