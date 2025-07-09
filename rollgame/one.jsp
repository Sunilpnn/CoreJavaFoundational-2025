<%@page  import="com.lxisoft.game.Player"%>
<%@page import="java.util.ArrayList"%>

<html>
<head>
  <title>One Page</title>
</head>
<body>
<meta http-equiv="refresh" content="5">

  <h3>ONLINE PLAYERS</h3>
</body>
</html>

<%
ArrayList<Player> players =(ArrayList<Player>)application.getAttribute("player"); 
if(players !=null){
 for(int i=0;i<players.size(); i++){
	 Player player = players.get(i);
	 
	 %>
	<img src="<%=player.getAvatar()%>" alt="PlayerImageEmty" width=75 height=80 />
	<p><%=player.getName()%></p>
   

<%	 

 }
}

%>