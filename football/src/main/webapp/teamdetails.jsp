<%@page import="java.sql.*"%>
<%
    int currentPage=1;
    int totalpages=17;
    int limit =30;
    String pagee=request.getParameter("page");

   if(pagee!=null)
    {
    try
    {
    currentPage=Integer.parseInt(pagee);
    }
    catch(NumberFormatException e)
    {
    currentPage=1;
    }
    }
    
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try 
    {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/football", "root", "root");
        int offset=(currentPage-1)*30;

        String sql = "SELECT * FROM team_details LIMIT ? OFFSET ? ";

        ps = conn.prepareStatement(sql);
        ps.setInt(1,limit);
        ps.setInt(2,offset);
        rs = ps.executeQuery();
        
%>
<html>
<body>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@3.3.3/dist/tailwind.min.css" rel="stylesheet">
    <style>
    * {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
    background: url('https://img.freepik.com/free-photo/night-football-game_23-2151952487.jpg') no-repeat center center/cover;
    color: #f4f4f4;
    padding: 20px;
    min-height: 100vh;
}

/* Container */
.container {
    max-width: 1000px;
    margin: 0 auto;
    background-color: rgba(0, 0, 0, 0.65);
    padding: 30px;
    border-radius: 16px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.5);
}

/* Header */
header {
    text-align: center;
    margin-bottom: 25px;
    border-bottom: 1px solid rgba(255, 255, 255, 0.2);
    padding-bottom: 15px;
}
h1 {
    color: #ffffff;
    font-size: 2rem;
    font-weight: 600;
}
.subtitle {
    color: #d1d5db;
    font-size: 1rem;
    margin-top: 5px;
}

/* Table */
.table-container {
    overflow-x: auto;
    margin: 20px 0;
    border-radius: 10px;
}
table {
    width: 100%;
    border-collapse: collapse;
    background: rgba(255, 255, 255, 0.05);
    border-radius: 10px;
    overflow: hidden;
}
th, td {
    padding: 14px;
    text-align: center;
}
th {
    background-color: rgba(59, 130, 246, 0.9);
    color: #fff;
    text-transform: uppercase;
    font-size: 0.9rem;
    letter-spacing: 0.5px;
}
tr {
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}
tr:nth-child(even) {
    background-color: rgba(255, 255, 255, 0.03);
}
tr:hover {
    background-color: rgba(59, 130, 246, 0.2);
    transition: 0.3s ease-in-out;
}

/* Pagination */
.pagination-container {
    display: flex;
    justify-content: center;
    margin-top: 25px;
}
.pagination {
    display: flex;
    list-style: none;
    gap: 8px;
}
.pagination a, 
.pagination span {
    padding: 10px 18px;
    border-radius: 8px;
    text-decoration: none;
    color: #fff;
    font-weight: 500;
    background: #2563eb;
    transition: 0.3s;
}
.pagination a:hover {
    background: #1d4ed8;
}
.pagination .current-page {
    background: #1e40af;
    font-weight: 600;
}

/* Footer */
footer {
    text-align: center;
    margin-top: 20px;
    color: #d1d5db;
    font-size: 0.85rem;
}

/* Responsive */
@media (max-width: 768px) {
    .container {
        padding: 20px;
    }
    th, td {
        padding: 10px;
        font-size: 0.9rem;
    }
    h1 {
        font-size: 1.5rem;
    }
}

    </style>
    </head>
    <table>
    <div class="table-container overflow-x-auto">
    <table class="min-w-full">

        <tr>
    <th><a href="teamdetails.jsp">id</a></th>
    <th><a href="teamdetails.jsp">TEAM NAME</a></th>>
    <th><a href="teamdetails.jsp">PLAYER NAME</a></th>
    <th><a href="teamdetails.jsp">RANKING</a></th> 
    <th><a href="teamdetails.jsp">SALARY</a></th>
    </tr>

    <%
    while(rs.next())
    {
    %>
<tr>
    <td><%=rs.getString("id")%></td>
    <td><%=rs.getString("Teame_Name")%></td>
    <td><%=rs.getString("Player_Name")%></td>
    <td><%=rs.getString("Player_Rank")%></td>
    <td><%=rs.getString("Salary")%></td>
</tr>
    <%
    }
    %>
</table>
</div>



<!-- Pagination at bottom center -->
<div class="pagination-container mt-6">
<ul class="pagination flex justify-center space-x-2">
    <%
    for(int i=1;i<=totalpages;i++)
    {
        if(i == currentPage) {
    %>
     <li><span class="current-page px-4 py-2 rounded bg-blue-600 text-white font-semibold"><%=i%></span></li>
    <%
     } else {
     %>
     <li><a href="teamdetails.jsp?page=<%=i%>"><%=i%></a></li>
    <%
    }}
    %>
</div>




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

    </body>
</html>
    
<%
    } catch (Exception e) 
    {
        out.println("Error: " + e.getMessage());
    }
     finally 
     {
        if (rs != null)rs.close();
        if (ps != null)ps.close(); 
        if (conn != null)conn.close();
    }
%>

