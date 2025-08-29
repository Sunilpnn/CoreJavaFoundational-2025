<%@page import="java.sql.*"%>
<%
    String teamname = request.getParameter("name");

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/football", "root", "root");

        String sql = "SELECT player_name FROM team_details WHERE Teame_Name=?";
        ps = conn.prepareStatement(sql);
        ps.setString(1, teamname);
        rs = ps.executeQuery();
%>
<html>
    <body>
        <div class="container">
<h1>Team Name: <%= teamname %></h1>
<style>
    body {
        font-family: Arial, sans-serif;
        background: url('https://platform.vox.com/wp-content/uploads/sites/2/chorus/assets/4587811/2014-06-09_12_38_31.gif');
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
    }

    
    .container {
        background-color: transparent;
        padding: 40px 50px;
        border-radius: 15px;
        box-shadow: 0 8px 20px rgba(22, 238, 220, 0.2);
        text-align: center;
        max-width: 600px;
        width: 90%;
         margin: 50px auto; /* centers the container horizontally */
    text-align: center;
     backdrop-filter: blur(10px);
    }

    .container h1 {
        font-family: 'Oswald', sans-serif; /* stylish font */
        font-size: 36px;
        font-weight: 600;
        color: #007BFF;
        margin-bottom: 30px;
    }

    table {
        border-collapse: collapse;
        width: 30%;
        margin: 0 auto;
        font-family: Arial, sans-serif;
    }

    table, th, td {
        border: 1px solid #ccc;
    }

    th, td {
        padding: 12px;
    }

    th {
        background-color: #007BFF;
        color: white;
    }

    tbody tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tbody tr:hover {
        background-color: #d1ecf1;
    }

</style>
<table border="1">
<thead>
<tr>
 <th> Player_Name</th>
</tr>
</thead>
<tbody>    
<%
while(rs.next())
{
%>
<tr>
<td><%=rs.getString("Player_Name")%></td>
</tr>
<%
}
%>
</tbody>
</thead>
</body>
</table>
</html>


<!-- Back Button -->
<div class="flex justify-center my-4">
    <a href="search.html" class="back-btn">
        &#8592; Back
    </a>
</div>

<style>
/* 3D style Back button */
.back-btn {
    padding: 10px 25px;
    text-decoration: none;
    color: #fff;
    background: linear-gradient(145deg, #1e40af, #3b82f6);
    border: none;
    border-radius: 12px;
    box-shadow: 0 6px 0 #1e3a8a, 0 6px 15px rgba(0, 0, 0, 0.2);
    transition: all 0.4s ease;
    font-weight: bold;
    font-size: 1rem;
}

/* Hover effect: lift and rotate slightly */
.back-btn:hover {
    transform: rotateY(15deg) translateY(-4px);
    box-shadow: 0 12px 0 #1e3a8a, 0 12px 20px rgba(0, 0, 0, 0.3);
    background: linear-gradient(145deg, #2563eb, #60a5fa);
}
</style>





      <%  
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception e) {}
        if (ps != null) try { ps.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }
%>
