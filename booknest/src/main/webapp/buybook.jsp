<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Purchased Bill</title>
    <style>
        body { font-family: Arial; margin:20px; background:#f4f4f4; }
        table { width:100%; border-collapse: collapse; background:#fff; }
        th, td { border:1px solid #ccc; padding:8px; text-align:left; }
        th { background:#f39c12; color:#fff; text-align:center; }
        .back-btn { margin-bottom:15px; display:inline-block; text-decoration:none; color:#fff; background:#7f8c8d; padding:5px 10px; border-radius:4px; }
    </style>
</head>
<body>
<h2>Purchased Bill</h2>
<a href="books.jsp" class="back-btn">⬅ Back to Books</a>
<table>
    <thead>
        <tr>
            <th>Book ID</th>
            <th>Book Title</th>
            <th>Quantity</th>
            <th>Total Price</th>
        </tr>
    </thead>
    <tbody>
<%
String bookIdStr = request.getParameter("bookId");
String qtyStr = request.getParameter("qty");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","root");

    // Insert purchase if POST parameters exist
    if(bookIdStr != null && qtyStr != null && !qtyStr.isEmpty()) {
        int bookId = Integer.parseInt(bookIdStr);
        int qty = Integer.parseInt(qtyStr);

        PreparedStatement ps = con.prepareStatement("SELECT price FROM books WHERE book_id=?");
        ps.setInt(1, bookId);
        ResultSet rsPrice = ps.executeQuery();
        if(rsPrice.next()){
            double price = rsPrice.getDouble("price");
            double totalPrice = price * qty;

            PreparedStatement psInsert = con.prepareStatement(
                "INSERT INTO buy(book_id, quantity, total_price) VALUES(?,?,?)");
            psInsert.setInt(1, bookId);
            psInsert.setInt(2, qty);
            psInsert.setDouble(3, totalPrice);
            psInsert.executeUpdate();
            psInsert.close();
        }
        rsPrice.close();
        ps.close();
    }

    // Display all purchases
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(
        "SELECT b.book_id, bk.title, b.quantity, b.total_price " +
        "FROM buy b JOIN books bk ON b.book_id = bk.book_id"
    );

    boolean hasData = false;
    while(rs.next()){
        hasData = true;
%>
        <tr>
            <td><%= rs.getInt("book_id") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getInt("quantity") %></td>
            <td>$<%= rs.getDouble("total_price") %></td>
        </tr>
<%
    }
    if(!hasData){
%>
        <tr><td colspan="4" style="color:red;">No purchases yet.</td></tr>
<%
    }
    rs.close();
    stmt.close();
    con.close();
} catch(Exception e){
%>
        <tr><td colspan="4" style="color:red;">Error: <%= e.getMessage() %></td></tr>
<%
}
%>
    </tbody>
</table>
</body>
</html>
