<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cart</title>
    <style>
        body { font-family: Arial; margin:20px; background:#f4f4f4; }
        .btn { padding:5px 10px; background:#3498db; color:#fff; border:none; border-radius:4px; cursor:pointer; margin-right:5px; }
        .btn:hover { opacity:0.9; }
        .back-btn { margin-bottom:15px; display:inline-block; text-decoration:none; color:#fff; background:#7f8c8d; padding:5px 10px; border-radius:4px; }
    </style>
</head>
<body>
<%
    int bookId = Integer.parseInt(request.getParameter("bookId"));
    int qty = Integer.parseInt(request.getParameter("qty"));

    // Get or create cart in session
    Map cart = (Map) session.getAttribute("cart");
    if(cart == null) cart = new HashMap();

    // Add or update item in cart
    Integer existingQty = (Integer) cart.get(bookId);
    if(existingQty == null) existingQty = 0;
    cart.put(bookId, existingQty + qty);

    session.setAttribute("cart", cart);
%>

<h3>Book ID <%= bookId %> added to cart successfully!</h3>

<a href="books.jsp" class="back-btn">⬅ Continue Shopping</a>
<a href="ViewCart.jsp" class="back-btn">View Cart</a>

</body>
</html>
