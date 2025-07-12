<%@ page import="java.sql.*" %>

<%

String name = request.getParameter("name");
String vehicleNumber =request.getParameter("vehicleNumber");
int numberOfSeats = Integer.parseInt(request.getParameter("numberOfSeats"));
String driverName = request.getParameter("DriverName");
String startDestination = request.getParameter("startDestination");
String startTime =request.getParameter("startTime");
String endingBusDestination = request.getParameter("endingBusDestination");
String endTime =request.getParameter("endTime");

Connection conn =null;
PreparedStatement pstmt = null;

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
     conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mybusapp","root","root");
	 
	String sql ="INSERT INTO bus_info(name,vehicleNumber,numberOfSeats,DriverName,startDestination,startTime,endingBusDestination,endTime)VALUES (?,?,?,?,?,?,?,?)";
	pstmt =conn.prepareStatement(sql);
	pstmt.setString(1,name);
	pstmt.setString(2,vehicleNumber);
	pstmt.setInt(3, numberOfSeats);
	pstmt.setString(4,driverName);
	pstmt.setString(5,startDestination);
	pstmt.setString(6,startTime);
	pstmt.setString(7,endingBusDestination);
	pstmt.setString(8,endTime);
	
	int rows = pstmt.executeUpdate();
	if(rows >0){
		out.println("Bus info saved successfully!<br>");
		out.println("<a herf='viewbuses.jsp'>View All buses</a>");
		
	}
	else {
            out.println(" Failed to save bus info.");
        }
		
		
		} 
		catch(Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    }
	  
	request.getRequestDispatcher("viewbus.jsp").forward(request,response);
%>