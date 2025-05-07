<%@ page session="true" %>
<HTML>
<BODY>
<STYLE>
 body {
		background-image: url("https://camo.githubusercontent.com/f3d1844ae6b25ed2014a4cc0c2c06e43791ef47db2f99aa3cc76279d0c4c80e2/68747470733a2f2f6469676974616c65646765746563682e696e2f696d616765732f42616e6e65725f30325f6e65772e676966");
            background-size: cover; 
            background-repeat: no-repeat;
            background-position: center;
			font-family: Arial, sans-serif;
            color: white;
            height: 100vh;
            margin: 0;
</STYLE>
<H1>Messages</H1>
<meta http-equiv="refresh" content="5">



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



</BODY>
</HTML>

