package ehealthcare;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbinfo.DBOperation;

import java.sql.*;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("txtuserid");
		String userpass = request.getParameter("txtpass");
		Connection con = DBOperation.createConnection();
		String strinsert = "select * from logindetails where userid=? and userpass=?";

		try {
			ps = con.prepareStatement(strinsert);
			ps.setString(1, userid);
			ps.setString(2, userpass);
			rs = ps.executeQuery();
			if (rs.next()) {
				if(Boolean.parseBoolean(rs.getString("status")))
				{
				
				HttpSession hs = request.getSession();
				hs.setAttribute("userid", userid);
				hs.setAttribute("usertype", rs.getString("usertype"));
				response.sendRedirect("/ehealthcare/jsp/index.jsp?msg1=Login Succesfully");
				}
				else
				{
					response.sendRedirect("/ehealthcare/jsp/Login.jsp?msg2=Profile yet not verified");
				}
			}
			else{
				response.sendRedirect("/ehealthcare/jsp/Login.jsp?msg2=UserId Or Password Incorrect");
			}
		} catch (SQLException se) {
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

}