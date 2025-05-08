<%@ page import="java.io.*" %>
<%
    String message = request.getParameter("message");
    String user = (String) session.getAttribute("user");
    String path = application.getRealPath("/") + "messages.txt";

    if (message != null && !message.trim().isEmpty()) {
        BufferedWriter writer = new BufferedWriter(new FileWriter(path, true));
        if (user != null) {
            writer.write(user + ": " + message.trim());
        } else {
            writer.write("Anonymous: " + message.trim());
        }
        writer.newLine();
        writer.close();
    }
%>

<form method="post" action="message.jsp">
  <input type="text" name="message" placeholder="Enter your message here" required>
  <input type="submit" value="Send">
  <input type="reset" value="Clear">
</form>
