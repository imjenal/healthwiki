package ehealthcare;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbinfo.DBOperation;

/**
 * Servlet implementation class UpdateStatus
 */
@WebServlet("/UpdateStatus")
public class UpdateStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con = null;
	private PreparedStatement ps = null;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateStatus() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		con = DBOperation.createConnection();
		String userid = request.getParameter("userid");
		String strupdate = "update logindetails set status=? where userid=?";
		try {
			ps = con.prepareStatement(strupdate);
			ps.setString(1, "true");
			ps.setString(2, userid);
			int rw = ps.executeUpdate();
			if (rw > 0) {
				System.out.println("Profile Verified");
				response.sendRedirect("/ehealthcare/jsp/Admin.jsp?msg=ProfileVerified");
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
