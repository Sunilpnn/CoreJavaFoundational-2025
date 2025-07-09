<%@ page import="com.lxisoft.game.Player" %>
<%@ page import="com.lxisoft.game.Dice" %>

<meta http-equiv="refresh" content="4">
<%
Player sessionPlayer = (Player) session.getAttribute("player");
Player p1 = (Player) application.getAttribute("playerOne");
Player p2 = (Player) application.getAttribute("playerTwo");

Integer gameCounter = (Integer) application.getAttribute("gameCounter");
if (gameCounter == null) {
    gameCounter = 1;
    application.setAttribute("gameCounter", gameCounter);
}

Player currentPlayer;

if (gameCounter % 2 == 0) {
    currentPlayer = p2;
} else {
    currentPlayer = p1;
}

Dice d = new Dice();

if (request.getParameter("rollDice") != null) {
    if (currentPlayer != null && sessionPlayer != null &&
        currentPlayer.getName().equals(sessionPlayer.getName())) {

        int previousScore = sessionPlayer.getScore();
        int newScore = previousScore + d.roll();

        currentPlayer.setScore(newScore);
        sessionPlayer.setScore(newScore);
    }

  
    gameCounter++;
    application.setAttribute("gameCounter", gameCounter);
	
}

request.getRequestDispatcher("diceSubmit.jsp").forward(request, response);
%>
