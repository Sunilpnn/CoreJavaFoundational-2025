<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int bookId = Integer.parseInt(request.getParameter("bookId"));
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","root");
        PreparedStatement pstmt = con.prepareStatement("SELECT * FROM books WHERE book_id=?");
        pstmt.setInt(1, bookId);
        ResultSet rs = pstmt.executeQuery();
        if(rs.next()){
%>
<h2>Book Details</h2>
<p><b>Title:</b> <%= rs.getString("title") %></p>
<p><b>Author:</b> <%= rs.getString("author") %></p>
<p><b>Category:</b> <%= rs.getString("category") %></p>
<p><b>Price:</b> $<%= rs.getDouble("price") %></p>
<a href="Books.jsp">Back to Books</a>
<%
        } else {
            out.println("Book not found.");
        }
        rs.close(); pstmt.close(); con.close();
    } catch(Exception e){ out.println("Error: "+e.getMessage()); }
%>
