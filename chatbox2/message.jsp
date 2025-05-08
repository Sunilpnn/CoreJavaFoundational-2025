<%@ page language="java" import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
  <style> 
    body { font-family: Arial; padding: 10px; }
    input[type="text"] {
      width: 70%;
      padding: 5px;
    }
    input[type="submit"] {
      padding: 5px 10px;
      background-color: #4CAF50;
      color: white;
      border: none;
      cursor: pointer;
    }
  </style>
</head>
<body>
  <form method="post">
    <input type="text" name="msg" placeholder="Enter your message" required />
    <input type="submit" value="Send" />
  </form>

  <%
    String msg = request.getParameter("msg");
    String user = (String) session.getAttribute("user");

    if (msg != null && !msg.trim().equals("")) {
      String path = application.getRealPath("/") + "messages.txt";
      BufferedWriter writer = new BufferedWriter(new FileWriter(path, true));
      writer.write(user + ": " + msg);
      writer.newLine();
      writer.close();
      response.sendRedirect("message.jsp");
    }
  %>
</body>
</html>