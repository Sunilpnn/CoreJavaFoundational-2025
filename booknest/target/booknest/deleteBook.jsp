<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String role = (String) session.getAttribute("role");
    if (!"admin".equals(role)) {
        response.sendRedirect("login.jsp");
        return;
    }

    int bookId = Integer.parseInt(request.getParameter("id"));

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore", "root", "root");

        // 1️⃣ Delete related records in 'bills'
        PreparedStatement deleteBills = con.prepareStatement("DELETE FROM bills WHERE book_id = ?");
        deleteBills.setInt(1, bookId);
        deleteBills.executeUpdate();
        deleteBills.close();

        // 2️⃣ Delete related records in 'buy'
        PreparedStatement deleteBuys = con.prepareStatement("DELETE FROM buy WHERE book_id = ?");
        deleteBuys.setInt(1, bookId);
        deleteBuys.executeUpdate();
        deleteBuys.close();

        // 3️⃣ Delete the book itself
        PreparedStatement deleteBook = con.prepareStatement("DELETE FROM books WHERE book_id = ?");
        deleteBook.setInt(1, bookId);
        int deleted = deleteBook.executeUpdate();
        deleteBook.close();

        if (deleted > 0) {
            out.println("<h2 style='color:green;'>Book deleted successfully ✅</h2>");
        } else {
            out.println("<h2 style='color:red;'>Failed to delete book ❌</h2>");
        }

        con.close();
    } catch (Exception e) {
        out.println("<h2 style='color:red;'>Error: " + e.getMessage() + "</h2>");
    }
%>

<a href="books.jsp">⬅ Back to Books List</a>
