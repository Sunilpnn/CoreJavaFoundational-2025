<%@ page session="true" %>
<%

String[] messages =(String[])application.getAttribute("chat");
String message = request.getParameter("chat") ;
String name = (String) session.getAttribute("username") ;


if(messages==null)
{
	messages=new String[100];
	messages[0]=name+";"+message;
}
else
{
	int i=0;
	for(; messages[i]!=null;i++){}
	messages[i]=name+":"+message;
}
application.setAttribute("chat",messages);
request.getRequestDispatcher("typemsg.jsp").forward(request, response) ;

%>