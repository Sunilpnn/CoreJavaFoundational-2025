<!DOCTYPE html>
<html>
<head>
  <title>Chatbox</title>
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
      background-color: teal;
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
      background-color: coral;
    }

    #bottom {
      height: 20%;
      background-color: ivory;
    }

    iframe {
      width: 100%;
      height: 100%;
      border: none;
    }
  </style>
</head>
<%
 String[] users=(String[])application.getAttribute("users");
 String name = request.getParameter("username") ;
 if ( users == null)
 {

users = new String[100] ;
users[0] = name ;
 }
 else
 {      int i =0 ;
for(; users[i] != null ; i++) ;
users[i] = name ;
 }
 
 
 application.setAttribute("users" , users) ;
 session.setAttribute("username", name ) ;
 %>
<body>
  <div id="left">
    <iframe src="online.jsp"></iframe>
  </div>
  <div id="right">
    <div id="top">
      <iframe src="display.jsp"></iframe>
    </div>
    <div id="bottom">
      <iframe src="text.jsp"></iframe>
    </div>
  </div>
</body>
</html>
