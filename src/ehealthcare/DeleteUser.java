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
@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		con=DBOperation.createConnection();
		String strdel1="delete from logindetails where userid=?";
		String strdel2="delete from userdetails where userid=?";
		String strdel3="delete from expert where userid=?";
		try{
			ps=con.prepareStatement(strdel1);
			con.setAutoCommit(false);
			ps.setString(1, request.getParameter("userid"));
			int b=ps.executeUpdate();
			if(b>=1)
			{
				System.out.println("User Deleted from Login");
				ps=con.prepareStatement(strdel2);
				ps.setString(1, request.getParameter("userid"));
				b=ps.executeUpdate();
				if(b>=1)
				{
					con.commit(); 
					System.out.println("User Deleted from User");
				response.sendRedirect("/ehealthcare/jsp/Admin.jsp");
			}else{
				System.out.println("User Deleted from Login");
				ps=con.prepareStatement(strdel3);
				ps.setString(1, request.getParameter("userid"));
				b=ps.executeUpdate();
				if(b>=1)
				{
					con.commit(); 
					System.out.println("User Deleted from Expert");
				response.sendRedirect("/ehealthcare/jsp/Admin.jsp");
			}
		}}
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
