<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Ensure only admin can access
    String role = (String) session.getAttribute("role");
    if (!"admin".equals(role)) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Add New Book</title>
    <style>
        body { font-family: 'Roboto', sans-serif; padding: 40px; background-color: #f4f4f4; }
        input, button { padding: 10px; margin: 10px 0; width: 300px; }
        button { background-color: #3498db; color: #fff; border: none; cursor: pointer; }
        p { font-weight: bold; }
    </style>
</head>
<body>

<h2>Add New Book</h2>

<form method="post" action="addBook.jsp">
    Title: <input type="text" name="title" required /><br>
    Price: <input type="number" step="0.01" name="price" required /><br>
    Quantity: <input type="number" name="quantity" required /><br>
    <button type="submit">Add Book</button>
</form>

<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    String title = request.getParameter("title");
    double price = Double.parseDouble(request.getParameter("price"));
    int quantity = Integer.parseInt(request.getParameter("quantity"));

    Connection con = null;
    PreparedStatement pst = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore", "root", "root");
        pst = con.prepareStatement("INSERT INTO books (title, price, quantity) VALUES (?, ?, ?)");
        pst.setString(1, title);
        pst.setDouble(2, price);
        pst.setInt(3, quantity);

        int result = pst.executeUpdate();
        if (result > 0) {
            out.println("<p style='color:green;'>✅ Book added successfully.</p>");
        } else {
            out.println("<p style='color:red;'>❌ Failed to add book.</p>");
        }

    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    } finally {
        try { if (pst != null) pst.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }
}
%>

<br>
<a href="books.jsp">Back to Books List</a>

</body>
</html>
