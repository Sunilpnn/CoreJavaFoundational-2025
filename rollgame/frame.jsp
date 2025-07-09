<%@page import="com.lxisoft.game.Player"%>
<%@ page import="java.io.*, jakarta.servlet.http.Part, jakarta.servlet.annotation.MultipartConfig" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 
<!DOCTYPE html>

<html>
<head>

<title>Welcom to the gamezzzzz</title>

<style>
    body {
      margin: 0;
      display: flex;
      height: 100vh;
      font-family: Arial, sans-serif;
      background-color: black;
    }

    #left {
      width: 20%;
      border-right: 1px solid #ddd;
      background-color:gray;
      box-shadow: 2px 0 5px rgba(0, 0, 0, 0.05);
    }

    #right {
      width: 80%;
      display: flex;
      flex-direction: column;
    }

    #top {
      height: 80%;
      border-bottom: 1px solid #ddd;
      background-color: white;
    }

    #bottom {
      height: 20%;
      background-color: blue;
    }

    iframe {
      width: 100%;
      height: 100%;
      border: none;
    }
</style>
</head>

<%! 



    // Method to extract file name from content-disposition header
    private String extractFileName(Part  part){
		
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s. indexOf('=') + 2, s.length() - 1);
            }
        }
        return ""; 
    }
%>

<% 
 
 
   String uploadPath = application.getRealPath("uploads");
   

    File uploadDir = new File(uploadPath);
	
	
	
    if (!uploadDir.exists()) {
        uploadDir.mkdirs();
    }

    String savePath = null ;
    String displayPath = null;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        for (Part part : request.getParts()) {
            if ("avatar".equals(part.getName())) {
                String fileName = extractFileName(part);
                if (!fileName.isEmpty()) {
                    savePath = uploadPath + File.separator + fileName;    // this is the save path and image 
                    displayPath = "uploads/" + fileName;  
                    
                    part.write(savePath);
                  
                }
            }
        }
    }

    
%> 

<html>
<head>
    
    <style>
        .player-container {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            transition: background-color 0.3s;
            padding: 10px;
            border-radius: 10px;
        }

        .player-container:hover {
            background-color: yellow;
        }

        .player-avatar {
            width: 75px;
            height: 75px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 15px;
            cursor: pointer;
            transition: transform 0.2s;
        }

        .player-avatar:hover {
            transform: scale(1.05);
        }

        .player-name {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            transition: color 0.3s;
        }

        .player-avatar:hover + .player-name {
            color: #007BFF;
        }
    </style>
</head>
<body>
     
<%
<<<<<<< HEAD

Player player = (Player) session.getAttribute("player");
=======

ArrayList<Player> players =(ArrayList<Player>)application.getAttribute("player"); 

if (players==null){
	players=new ArrayList<>();
}

String name = request.getParameter("playerName");
>>>>>>> 57f013954f02738398e1e5089377788318c331b0

if (player == null) {
    player = new Player();
    String name = request.getParameter("playerName");

    player.setName(name);
    player.setAvatar(displayPath);
    player.setActive(false);
    player.setScore(0);

<<<<<<< HEAD
    session.setAttribute("player", player);
    application.setAttribute("player", player);
	System.out.println("player check"+player);
	
    Player p1 = (Player) application.getAttribute("playerOne");
    Player p2 = (Player) application.getAttribute("playerTwo");

    if (p1 == null) {
        application.setAttribute("playerOne", player);
%>
      
<%
    } else if (p2 == null) {
        application.setAttribute("playerTwo", player);
%>
        
<%
    } else {
%>
       
<%
    }

=======
>>>>>>> 57f013954f02738398e1e5089377788318c331b0
%>
  
<%
} else {
%>
    
<%
}
%>




 
</body>
</html>




<body>
<div id="left"> 
<iframe src="online.jsp"></iframe>
</div>

<div id="right">
<div id="top">
<iframe src="scoreBoard.jsp"></iframe>
</div>
<div id="bottom">
<iframe src="diceSubmit.jsp"></iframe>
</div> 
</div>

</body>
</html>