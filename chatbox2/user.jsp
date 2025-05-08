<%@ page import="java.util.*" %>
<%
    String uname = request.getParameter("user");
    if (uname != null ) {
        session.setAttribute("user", uname);

        List<String> users = (List<String>) application.getAttribute("onlineUsers");

        if (users == null) {
            users = new ArrayList<String>();
            application.setAttribute("onlineUsers", users);
        }

        if (!users.contains(uname)) {
            users.add(uname);
        }
    }

    response.sendRedirect("frame.html");
%>
