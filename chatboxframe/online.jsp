<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%
    List<String> nameList = (List<String>) application.getAttribute("nameList");
%>
<!DOCTYPE html>
<html>
<meta http-equiv="refresh" content="5">
<body>
    <h2>Logged In Users:</h2>
    <%
        if (nameList != null && !nameList.isEmpty()) {
            for (String user : nameList) {
    %>
                <p><%= user %></p>
    <%
            }
        } else {
    %>
            <p>No users are currently logged in.</p>
    <%
        }
    %>
</body>
</html>