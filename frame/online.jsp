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


String[] users=(String[])application.getAttribute("users");

if(users!=null)
{
int i=0;
for(; users[i]!=null;i++){
%>
<p> <%= users[i]  %> </p>

<%
}
}
%>