<%@ page import="java.util.*, model.Food" %>

<html>


<head>
<meta charset="UTF-8">
    <style>
body {
    font-family: Arial, sans-serif;
    background: #f9f9f9;
    margin: 0;
    padding: 0;
    text-align: center;
}

h1 {
    background: #ff5722;
    color: white;
    padding: 20px;
    margin: 0;
    font-size: 28px;
    letter-spacing: 2px;
    border-radius: 0 0 20px 20px;
}

form {
    background: white;
    display: inline-block;
    text-align: left;
    padding: 25px 40px;
    margin-top: 30px;
    border-radius: 15px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
}

form p {
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 15px;
    color: #333;
}

input[type="checkbox"] {
    transform: scale(1.2);
    margin-right: 10px;
}

label {
    font-size: 18px;
    color: #444;
    margin-bottom: 8px;
    display: inline-block;
}

input[type="submit"] {
    margin-top: 20px;
    background: #ff5722;
    color: white;
    font-size: 18px;
    padding: 10px 20px;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    transition: background 0.3s;
}

input[type="submit"]:hover {
    background: #e64a19;


    </style>

</head>

<body>
<h1>WELCOME TO HOTEL SFC CHICKENS</h1>  


   <form method = "post" >
    <p>Select Items</p>

<%
   List<Food> foods = (List<Food>) application.getAttribute("foods");

   if (foods != null) {
       for (Food f : foods) {
          %>
        <input type="checkbox" name="food" value="<%= f.getName() %>">

        <%= f.getName()%> &#8377 <%= f.getPrice() %><br>
        <%
       }
   } 
%>

    <input type = "submit" value = "TOTAL BILL" formaction="totalbill.jsp" />

    <input type="submit" value="login to add dish" formaction="login.html" /><br> <br> <br> <br> 
   
    
     
     </form>



</body>
</html> 