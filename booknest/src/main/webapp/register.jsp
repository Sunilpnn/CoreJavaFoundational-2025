<%@ page import="java.sql.*" %>
<%@ include file="dbconnect.jsp" %>
<%
    String uname = request.getParameter("username");
    String password = request.getParameter("password");

    if(uname != null && password != null) {
        try {
            PreparedStatement check = con.prepareStatement("SELECT * FROM users WHERE username=?");
            check.setString(1, uname);
            ResultSet rs = check.executeQuery();

            if(rs.next()) {
                out.println("<h3>⚠ Username already exists! <a href='register.jsp'>Try Again</a></h3>");
            } else {
                PreparedStatement ps = con.prepareStatement("INSERT INTO users(username, password) VALUES(?, ?)");
                ps.setString(1, uname);
                ps.setString(2, password);
                int i = ps.executeUpdate();

                if(i > 0) {
                    out.println("<h3>✅ Registration successful! <a href='login.jsp'>Login here</a></h3>");
                }
                ps.close();
            }

            rs.close();
            check.close();
            con.close();
        } catch(Exception e) {
            out.println("Error: " + e.getMessage());
        }
    }
%>

<!-- Registration Form -->
<form method="post">
    Username: <input type="text" name="username" required><br><br>
    Password: <input type="password" name="password" required><br><br>
    <input type="submit" value="Register">
</form>
