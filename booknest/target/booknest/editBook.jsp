<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String role = (String) session.getAttribute("role");
    if (!"admin".equals(role)) {
        response.sendRedirect("login.jsp");
        return;
    }

    int bookId = Integer.parseInt(request.getParameter("id"));

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore", "root", "root");

    if (request.getMethod().equalsIgnoreCase("POST")) {
        String title = request.getParameter("title");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        PreparedStatement pst = con.prepareStatement("UPDATE books SET title=?, price=?, quantity=? WHERE book_id=?");
        pst.setString(1, title);
        pst.setDouble(2, price);
        pst.setInt(3, quantity);
        pst.setInt(4, bookId);
        int updated = pst.executeUpdate();
        if (updated > 0) {
            out.println("<p style='color:green;'>Book updated successfully ✅</p>");
        } else {
            out.println("<p style='color:red;'>Failed to update book ❌</p>");
        }
        pst.close();
    }

    PreparedStatement pstSelect = con.prepareStatement("SELECT * FROM books WHERE book_id = ?");
    pstSelect.setInt(1, bookId);
    ResultSet rs = pstSelect.executeQuery();
    if (rs.next()) {
%>

<html>
<head><title>Edit Book</title></head>
<body>

<h2>Edit Book</h2>

<form method="post" action="editBook.jsp?id=<%= bookId %>">
    Title: <input type="text" name="title" value="<%= rs.getString("title") %>" required /><br>
    Price: <input type="number" step="0.01" name="price" value="<%= rs.getDouble("price") %>" required /><br>
    Quantity: <input type="number" name="quantity" value="<%= rs.getInt("quantity") %>" required /><br>
    <button type="submit">Update Book</button>
</form>

<a href="books.jsp">Back to Books List</a>

</body>
</html>

<%
    } else {
        out.println("<p style='color:red;'>Book not found ❌</p>");
    }

    rs.close();
    pstSelect.close();
    con.close();
%>
