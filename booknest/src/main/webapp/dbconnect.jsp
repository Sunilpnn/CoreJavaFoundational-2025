<%@ page import="java.sql.*" %>
<%
    Connection con = null;
    try {
       
        Class.forName("com.mysql.cj.jdbc.Driver");

        String url = "jdbc:mysql://localhost:3306/bookstore?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        String user = "root";       
        String pass = "root";  

        con = DriverManager.getConnection(url, user, pass);

        application.setAttribute("DBConnection", con);

        out.println("✅ Database connected successfully!<br>");
    } catch (Exception e) {
        out.println("❌ Database Connection Error: " + e.getMessage());
    }
%>
