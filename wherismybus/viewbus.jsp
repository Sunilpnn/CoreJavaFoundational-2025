<%@ page import="java.sql.*" %>
<html>
<body>
<h3>ALL BUS INFORMATIONS HERE</h3>

<table border="1" cellpadding="8">

<tr>
<th>ID</th>
<th>Bus Name</th>
<th>VehicleNumber</th>
<th>Number of Seats</th>
<th>Driver Name</th>
<th>startDestination</th>
<th>Start Time</th>
<th>endingBusDestination</th>
<th>End Time</th>
</tr>

<%
  Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;


	Class.forName("com.mysql.cj.jdbc.Driver");
	conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/mybusapp","root","root");
	
	String query="SELECT *FROM bus_info";
	
	stmt = conn.createStatement();
	rs =stmt.executeQuery(query);
	
	while(rs.next()){
		System.out.println("sunil"+rs.getString("name"));
		
%>	

<tr>

<td><%=rs.getInt("id")%></td>
<td><%=rs.getString("name")%></td>
<td><%=rs.getString("vehicleNumber")%></td>
<td><%=rs.getInt("numberOfSeats")%></td>
<td><%=rs.getString("driverName")%></td>
<td><%=rs.getString("startDestination")%></td>
<td><%=rs.getString("startTime")%></td>
<td><%=rs.getString("endingBusDestination")%></td>
<td><%=rs.getString("endTime")%></td>
</tr>
<%
	}

    rs.close();
    stmt.close();
    conn.close();
%>

</table>
</body>
</html>