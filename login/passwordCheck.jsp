<%
String name = request.getParameter("username");
String password = request.getParameter("password");


String user = "sunilpn";
String pass = "1234";


if (name != null && password !=null && name.equals(user)&&password.equals(pass)){


response.sendRedirect("dishAdd.html");

}
else{

    out.println("incorrect password or username ");
}
%>