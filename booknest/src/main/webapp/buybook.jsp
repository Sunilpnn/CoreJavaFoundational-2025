<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Purchase Confirmation</title>
    <style>
        body { font-family: Arial; margin:20px; background:#f4f4f4; }
        table { width:100%; border-collapse: collapse; background:#fff; }
        th, td { border:1px solid #ccc; padding:8px; text-align:left; }
        th { background:#f39c12; color:#fff; text-align:center; }
        .back-btn { margin-bottom:15px; display:inline-block; text-decoration:none; color:#fff; background:#7f8c8d; padding:5px 10px; border-radius:4px; }
    </style>
</head>
<body>
<h2>Purchase Confirmation</h2>
<a href="books.jsp" class="back-btn">⬅ Back to Books</a>

<table>
    <thead>
        <tr>
            <th>Book ID</th>
            <th>Book Title</th>
            <th>Quantity</th>
            <th>Total Price</th>
            <th>Purchase Date & Time</th>
        </tr>
    </thead>
    <tbody>
<%
String bookIdStr = request.getParameter("bookId"); 
String qtyStr = request.getParameter("qty");

if (bookIdStr != null && qtyStr != null && !qtyStr.isEmpty()) {
    int bookId = Integer.parseInt(bookIdStr);
    int qty = Integer.parseInt(qtyStr);

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","root");

        // Get book details
        PreparedStatement psBook = con.prepareStatement("SELECT title, price FROM books WHERE book_id = ?");
        psBook.setInt(1, bookId);
        ResultSet rsBook = psBook.executeQuery();

        if (rsBook.next()) {
            String title = rsBook.getString("title");
            double price = rsBook.getDouble("price");
            double totalPrice = price * qty;

            // Get current date and time
            LocalDateTime now = LocalDateTime.now ();
            String formattedDateTime = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

            // Insert into buy table (including purchase_datetime)
            PreparedStatement psInsert = con.prepareStatement(
                "INSERT INTO buy (book_id, quantity, total_price, purchase_datetime) VALUES (?, ?, ?, ?)");
            psInsert.setInt(1, bookId);
            psInsert.setInt(2, qty);
            psInsert.setDouble(3, totalPrice);
            psInsert.setString(4, formattedDateTime);
            psInsert.executeUpdate();
            psInsert.close();

            // Display only current purchase
%>
            <tr>
                <td><%= bookId %></td>
                <td><%= title %></td>
                <td><%= qty %></td>
                <td>$<%= totalPrice %></td>
                <td><%= formattedDateTime %></td>
            </tr>
<%
        } else {
%>
            <tr><td colspan="5" style="color:red;">Book not found.</td></tr>
<%
        }

        rsBook.close();
        psBook.close();
        con.close();
    } catch(Exception e){
%>
        <tr><td colspan="5" style="color:red;">Error: <%= e.getMessage() %></td></tr>
<%
    }
} else {
%>
    <tr><td colspan="5" style="color:red;">Invalid request. Book ID or Quantity missing.</td></tr>
<%
}
%>
    </tbody>
</table>

</body>
</html>
