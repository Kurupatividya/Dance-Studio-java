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
<title>Batch3-S10</title>
        <link rel="stylesheet" href="style.css">
        
    </head>

    <body>
        <header>
            <img src="
            https://pngimage.net/wp-content/uploads/2018/06/namaskar-images-png-6.png" class="profile-img">
            <nav>
                <ul>
                    <li><a href="loginsuccess.html">Home</a></li>
                    <li><a href="profile.jsp">profile</a></li>
                    
                    
                </ul>
            </nav>
        </header>
</div><br>
    
        <h2> Profile</h2>
        
        <table>
        <% 
 
		try {
			String  username = (String)session.getAttribute("un");
		     String password = (String)session.getAttribute("pw");
		       
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			Connection conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe","system","190030757");
			
			String sql = "select * from userlogin1 where username = ?";
			
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, (String)session.getAttribute("un"));
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
		%>
        	
			<tr>
					<th>Username</th>
					<td><%= rs.getString(1) %></td>
			</tr>
			<tr>
				<th>Email</th>
				<td><%= rs.getString(2) %></td>
			</tr>
			<tr>
					<th>Gender</th>
					<td><%= rs.getString(3) %></td>
			</tr>
			<tr>
					<th>Phone</th>
					<td><%= rs.getString(4) %></td>
			</tr>
			
			
		<%	
			break;
			}	
	
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		%>
	</table>
		<a href='updateProfile.jsp'><button>Update Profile</button></a>

</body>
</html>