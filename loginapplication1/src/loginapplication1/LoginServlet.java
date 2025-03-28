package loginapplication1;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String uname = request.getParameter("uname");    
		    String pass = request.getParameter("pass");
		    Connection con = null;
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	  System.out.println("Driver Class Loaded");
        	  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sdp","root","190030757");
            System.out.println(con);
			System.out.println("Connected to User database");
			 Statement st = con.createStatement();
			 
			 String sql = "select * from userlogin1 where username = ? and pass = ?";
			 PreparedStatement pst = con.prepareStatement(sql);
			   
			    pst.setString(1, uname);
			    pst.setString(2, pass);
			    ResultSet resultSet = pst.executeQuery();
			    if(resultSet.next()) {
			    	HttpSession  session = request.getSession(true);
			    	session.setAttribute("un", uname);
					session.setAttribute("pw", pass);
			    	RequestDispatcher rd = request.getRequestDispatcher("loginsuccess.html");
			    	rd.forward(request, response);
			    }else {
			    	RequestDispatcher rd = request.getRequestDispatcher("loginfail.html");
			    	rd.forward(request, response);
			    }
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
}

private PreparedStatement prepareStatement(String string) {
	// TODO Auto-generated method stub
	return null;
}

}