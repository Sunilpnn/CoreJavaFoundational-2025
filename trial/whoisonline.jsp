
<%@ page session="true" %>
<HTML>
<BODY>
<style>
    body {
		background-image: url("https://images.unsplash.com/photo-1559056961-1f4dbbf9d36a?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
        background-size: cover; 
            background-repeat: no-repeat;
            background-position: center;
			</style>
<H1 style="font-size:20px;">UserNames</H1>
<meta http-equiv="refresh" content="5">
</BODY>
</HTML>

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


