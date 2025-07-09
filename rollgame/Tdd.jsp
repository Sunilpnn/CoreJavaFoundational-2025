<%@page import="com.lxisoft.game.Player"%>
<%@page import="com.lxisoft.game.User"%>
<%@page import="com.lxisoft.game.Dice"%>
<%@page import="java.util.ArrayList"%>

<html>
<head>

<title>Player Scores</title>	
</head>
<body>

<%

ArrayList<User> users = (ArrayList<User>)application.getAttribute("users");

Player playUser = (Player)session.getAttribute("player");

if (users == null){
    users = new ArrayList<>();
}

User player1 = new User();
player1.setPlayUser(playUser);

Dice d = new Dice();
int score1 = d.roll();
player1.setScore(score1);

users.add(player1);

application.setAttribute("users",users); 
request.getRequestDispatcher("three.jsp").forward(request,response);

%>
 
</body>
</html>
