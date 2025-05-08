<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%
    String userName = request.getParameter("user");
    if (userName != null && !userName.trim().isEmpty()) {
    session.setAttribute("user", userName);

	  

    List<String> nameList = (List<String>) application.getAttribute("nameList");
    if (nameList == null) {
        nameList = new ArrayList<>();
		application.setAttribute("nameList",nameList);
    }
	if(!nameList.contains(userName)){
        nameList.add(userName);
    }
	}
	response.sendRedirect("frame.html");
%>
