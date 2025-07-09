<%@ page import="com.lxisoft.game.Player" %>

<meta http-equiv= "refresh" content= "5">

<%
Integer gameCounter = (Integer) application.getAttribute("gameCounter");

if (gameCounter != null && gameCounter >= 6) {
    request.getRequestDispatcher("winwin.jsp").forward(request, response);	
    return;
}

%>
<h1>SCORE BOARD</h1>

<h2>Game Counter: <%= gameCounter %></h2>



<%  
 
	
	
	
   
    Player p1 = (Player) application.getAttribute("playerOne");
    Player p2 = (Player) application.getAttribute("playerTwo");

    String p1Avatar = "", p1Name = "Unknown Player";
    String p2Avatar = "", p2Name = "Unknown Player";
	
	
    int p1Score = 0, p2Score = 0;

    if (p1 != null) {
        p1Avatar = p1.getAvatar();
        p1Name = p1.getName();
        p1Score = p1.getScore();
		
    }

    if (p2 != null) {
        p2Avatar = p2.getAvatar();
        p2Name = p2.getName();
        p2Score = p2.getScore();
    }
%>

<!DOCTYPE html>
<html>
<head>
    
    <style>
        body {
            background-color: yellow;
            color: white;
            margin: 0;
            font-family: Arial, sans-serif;
		 background-image: url("https://3.bp.blogspot.com/-tBU4LI6arYc/Un1DYGcE_VI/AAAAAAAABIc/QwYYWzE474k/s1600/wallpaper2.jpg")
        }

        h3 {
            padding: 10px;
            margin-left: 20px;
        }

        .player-container {
            display: flex;
            align-items: center;
            padding: 10px;
            margin: 20px;
            border-radius: 10px;
            background-color: #222;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.1);
        }

        .player-avatar {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 15px;
            border: 2px solid white;
        }

        .player-name {
			
            font-size: 18px;
            font-weight: bold;
        }
    </style>
</head>
<body>
  
    <% if (p1 != null) { %>
    <div class="player-container">
        <img src="<%= p1Avatar %>" class="player-avatar" alt="Player Avatar" />
        <div class="player-name"><%= p1Name %> - Score: <%= p1Score %></div>
    </div>
    <% } %>

    <% if (p2 != null) { %>
    <div class="player-container">
        <img src="<%= p2Avatar %>" class="player-avatar" alt="Player Avatar" />
        <div class="player-name"><%= p2Name %> - Scorez: <%= p2Score %></div>
    </div>
    <% } %>
	
	
</body>
</html>
