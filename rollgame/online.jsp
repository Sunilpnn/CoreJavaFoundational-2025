<%@ page import="com.lxisoft.game.Player" %>


<%

    Player p1 = (Player) application.getAttribute("playerOne");
    Player p2 = (Player) application.getAttribute("playerTwo");
    
	
	
    String p1Avatar = "", p1Name = "Unknown Player";
    String p2Avatar = "", p2Name = "Unknown Player";

    if (p1 != null){  
		
        p1Avatar = p1.getAvatar();
        p1Name = p1.getName();
    }

    if (p2 != null) {
        p2Avatar = p2.getAvatar();
        p2Name = p2.getName();
    }
%>
<meta http-equiv="refresh" content="5">
<!DOCTYPE html>
<html>
<head>
    <title>Online Players</title>
    <style>
        body{
      background-image: url("https://th.bing.com/th/id/R.e6de83094fb3e7f26266468e4a46e644?rik=Yl4Pc5vrQmn7oQ&riu=http%3a%2f%2ffreedesignfile.com%2fupload%2f2016%2f06%2fLight-blue-abstract-background-vector.jpg&ehk=EMZqhAiA%2fmR%2b4A40ic25ajH7cDxfgnxnNzLqzl9JyEM%3d&risl=&pid=ImgRaw&r=0");
      
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
            background-color: yellow;
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
    <h3>ONLINE PLAYERS</h3>

    <% if (p1 != null) { %>
    <div class="player-container">
        <img src="<%= p1Avatar %>" class="player-avatar" alt="Player Avatar" />
        <div class="player-name"><%= p1Name %></div>
    </div>
    <%
	} 
	%>

    <% if (p2 != null) { %>
    <div class="player-container">
        <img src="<%= p2Avatar %>" class="player-avatar" alt="Player Avatar" />
        <div class="player-name"><%= p2Name %></div>
    </div>
    <% 
	} 
	%>
</body>
</html>