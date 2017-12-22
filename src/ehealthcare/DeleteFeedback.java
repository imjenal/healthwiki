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

import java.sql.*;

/**
 * Servlet implementation class DeleteMessage
 */
@WebServlet("/DeleteFeedback")
public class DeleteFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFeedback() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		con=DBOperation.createConnection();
		String strdel="delete from feedback where fid=?";
		try{
			ps=con.prepareStatement(strdel);
			ps.setString(1, request.getParameter("msgid"));
			int b=ps.executeUpdate();
			if(b>=1)
			{
				System.out.println("Feedback Deleted");
				response.sendRedirect("/ehealthcare/jsp/Admin.jsp");
			}
		}
		catch(SQLException se)
		{
			System.out.println(se);
		}
		finally{
			try{
				if(ps!=null)
					ps.close();
			}
	        catch(SQLException se)
			{
	        	System.out.println(se);
			}
	   	}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
