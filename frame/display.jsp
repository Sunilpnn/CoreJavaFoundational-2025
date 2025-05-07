
<%@ page session="true"%>
<html>
	<body>
		<style>
			background-size:cover;
		</style>
		<meta http-equiv="refresh" content="5">

	</body>
</html>




<%

String[]  messages  =  (String[])application.getAttribute("chat");


if(messages!=null)
{
for(int i=0;messages[i]!=null;i++){
%>

<p><%=messages[i] %> </p>
<%

}
}
%>