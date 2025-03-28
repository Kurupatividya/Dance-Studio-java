<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%
    response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires","0");
	if(session == null || session.getAttribute("un") == null || session.getAttribute("pw") == null){
		response.sendRedirect("error.html");	
	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Profile</title>
<link rel='stylesheet' href='styles.css'>

</head>
<body>
<div class="topnav">
  <a href="lginadminsuccess.html">HOME</a>
  <a href="a_profile.jsp">PROFILE</a>
  
  <a href="logout" style="float:right">Log Out</a>
</div><br>
    
        <% 
 
		try {
			String  username = request.getParameter("uname");
			String email = request.getParameter("email");
			 String name = request.getParameter("name");
		     
		     String department = request.getParameter("department");
		     String phone = request.getParameter("phone");
		     String pass = request.getParameter("pass");
		     
		       
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			Connection conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe","system","190030757");
			
			String sql = "update admin set email = ?, name = ?,department =?,phone=?, password = ? where username = ?";
			
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, username);
			pstmt.setString(2, email);
			pstmt.setString(3, name);

			pstmt.setString(4, department);
			pstmt.setString(5, phone);
			pstmt.setString(5, pass);
			
	
			int count = pstmt.executeUpdate();
				
				if(count>0){
					out.println("<h3>Successfully updated Profile</h3>");
					out.println("<h3>Click <a href='a_profile.jsp'> here</a> to view profile</h3>");
				} else {
					out.println("<h3>update failed</h3>");
				}	
	
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		%>
</body>
</html>