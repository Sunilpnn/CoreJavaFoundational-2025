<%@ page import="com.lxisoft.game.Player" %>

<!DOCTYPE html>
<html>
<head>
    <style>
        body {
			 background-image: url("https://images.hdqwalls.com/wallpapers/abstract-minimalism-hd-4k-io.jpg");
      
			
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
        }

        h3 {
            color: #28a745;
            font-size: 28px;
            margin-bottom: 20px;
            text-shadow: 1px 1px 2px #aaa;
        }

        .result-box {
            background-color: #fff;
            border: 2px solid #4CAF50;
            padding: 20px;
            border-radius: 15px;
            display: inline-block;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            font-size: 20px;
            color: #333;
        }
    </style>
</head>
<body>

<h3>*****THE WINNER IS ******</h3>

<div class="result-box">
<%
    Player p1 = (Player) application.getAttribute("playerOne");
    Player p2 = (Player) application.getAttribute("playerTwo");

    application.setAttribute("playerOne", p1);
    application.setAttribute("playerTwo", p2);

    if (p1.getScore() > p2.getScore()) {
        out.println("Win the Match " + p1.getName() + " | Score: " + p1.getScore());
    } else {
        out.println("Win the Match " + p2.getName() + " | Score: " + p2.getScore());
    }
%>
</div>

</body>
</html>

