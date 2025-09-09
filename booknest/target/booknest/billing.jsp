<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Billing - Trendy Confirmation</title>
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
            font-size: 36px;
            color: #34495e;
            margin-bottom: 40px;
        }

        .container {
            max-width: 700px;
            margin: 0 auto;
            background: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        }

        .message {
            background: #3498db;
            padding: 20px;
            border-radius: 8px;
            font-size: 20px;
            color: #fff;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .message:hover {
            transform: translateY(-5px);
        }

        .btn {
            display: inline-block;
            padding: 12px 24px;
            background-color: #2ecc71;
            color: #fff;
            text-decoration: none;
            font-weight: bold;
            border-radius: 6px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease, transform 0.3s ease;
            margin-top: 20px;
        }

        .btn:hover {
            background-color: #27ae60;
            transform: translateY(-3px);
        }

        p {
            font-size: 18px;
            line-height: 1.5;
        }
    </style>
</head>
<body>

    <h2>Purchase Confirmation</h2>

    <div class="container">
    <%
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        int qty = Integer.parseInt(request.getParameter("qty"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore", "root", "root");

            PreparedStatement priceStmt = con.prepareStatement("SELECT title, price FROM books WHERE book_id = ?");
            priceStmt.setInt(1, bookId);
            ResultSet rs = priceStmt.executeQuery();

            if (rs.next()) {
                String title = rs.getString("title");
                double price = rs.getDouble("price");
                double total_price = price * qty;

                PreparedStatement insertStmt = con.prepareStatement(
                    "INSERT INTO bills (book_id, quantity, total_price) VALUES (?, ?, ?)");
                insertStmt.setInt(1, bookId);
                insertStmt.setInt(2, qty);
                insertStmt.setDouble(3, total_price);
                insertStmt.executeUpdate();

                out.println("<div class='message'>");
                out.println("<p><b>Book Title:</b> " + title + "</p>");
                out.println("<p><b>Quantity:</b> " + qty + "</p>");
                out.println("<p><b>Total Price:</b> $" + total_price + "</p>");
                out.println("</div>");
                out.println("<a href='buybook.jsp' class='btn'>View Purchased Bills</a>");
                out.println("<a href='Books.jsp' class='btn'>Back to Books</a>");

                insertStmt.close();
            } else {
                out.println("<p style='color:red;'>Book not found.</p>");
            }

            rs.close();
            priceStmt.close();
            con.close();
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        }
    %>
    </div>

</body>
</html>
