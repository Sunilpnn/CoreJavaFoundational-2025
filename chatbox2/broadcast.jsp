<%@ page import="java.io.*" %>
<%
  String action = request.getParameter("action");
  String path = application.getRealPath("/") + "messages.txt";

  if ("clear".equals(action)) {
    File file = new File(path);
    if (file.exists()) file.delete();  
    file.createNewFile();              
  }
%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="refresh" content="7">
  <style>
    body { 
	background-image:url("https://cdn.pixabay.com/animation/2022/11/16/11/48/11-48-15-802_512.gif");
	background-size:cover;
	background-repeat:no-repeat;
	background-position:center;
	font-family: Arial; padding: 10px; }
    #chat-box {
      max-height: 400px;
      overflow-y: auto;
      border: 1px solid #ccc;
      padding: 10px;
    }
  </style>
</head>
<body>
  <h3>Recent Messages</h3>
  <form method="get"  action="broadcast.jsp">
    <input type="hidden" name="action" value="clear" />
    <input type="submit" value="Clear Chat" style="background-color:red; color:white; border:none; padding:5px;">
  </form>
  <div id="chat-box">
    <%
      File file = new File(path);
      if (file.exists()) {
        BufferedReader reader = new BufferedReader(new FileReader(file));
        String line;
        while ((line = reader.readLine()) != null) {
          out.println("<p>" + line + "</p>");
        }
        reader.close();
      } else {
        out.println("<p>No messages yet.</p>");
      }
    %>
  </div>
</body>
</html>