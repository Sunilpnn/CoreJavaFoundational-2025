<%@ page import="com.lxisoft.game.Player" %>
 
<meta http-equiv="refresh" content="4">
<%
    Player sessionPlayer = (Player) session.getAttribute("player");

    
    Integer gameCounter = (Integer) application.getAttribute("gameCounter");
    Player p1 = (Player) application.getAttribute("playerOne");
    Player p2 = (Player) application.getAttribute("playerTwo");
	
	
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


boolean isMyTurn = false;
    if (currentPlayer != null && sessionPlayer != null) {
        isMyTurn = currentPlayer.getName().equals(sessionPlayer.getName());
    }

%>

<form action="Rollgame.jsp" method="post">
    <label>PLAY GAME:</label>
    <input type="submit" name="rollDice" value="Roll Dice" <%= isMyTurn ? "" : "disabled" %> />
</form>
<p>Welcome :<%=sessionPlayer.getName()%></p>