package ehealthcare;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbinfo.DBOperation;

/**
 * Servlet implementation class CheckUserId
 */
@WebServlet("/CheckUserId")
public class CheckUserId extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckUserId() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
PrintWriter out=response.getWriter();
	String uid=request.getParameter("uid");
	 con=DBOperation.createConnection();
	String strsql="select userid from logindetails where userid=?";
	try{
		ps=con.prepareStatement(strsql);
		ps.setString(1, uid);
		rs = ps.executeQuery();
		if (rs.next())
			out.println("red,UserId already exists");
		else
			out.println("green,UserId available");
	} 
	catch (SQLException se) {
		System.out.println(se);
	} finally {
		try {
			if (ps != null)
				ps.close();
		} catch (SQLException se) {
			System.out.println(se);
		}
	}
}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
