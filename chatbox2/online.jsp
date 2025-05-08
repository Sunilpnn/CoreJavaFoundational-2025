<%@ page import="java.util.*" %>
<%
  List<String> users = (List<String>) application.getAttribute("onlineUsers");
%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="refresh" content="7">
  <style>
    body {
		background-image:url("https://i.imgur.com/W9p55pS.gif");
	background-size:cover;
	background-position:center;
		font-family: Arial; padding: 10px; }
  </style>
</head>
<body>
  <h3>Online Users</h3>
  <ul>
    <%
      if (users != null && !users.isEmpty()) {
        for (String u : users)  {
          out.println("<li>" + u + "</li>");
        }
      } else {
        out.println("<li>No users online</li>");
      }
    %>
  </ul>
</body>
</html>