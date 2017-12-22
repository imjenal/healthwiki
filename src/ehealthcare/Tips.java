package ehealthcare;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbinfo.DBOperation;

import java.sql.*;

/**
 * Servlet implementation class Tips
 */
@WebServlet("/Tips")
public class Tips extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Tips() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs= request.getSession(false);
		con=DBOperation.createConnection();
		java.util.Date dt=new java.util.Date();
		java.sql.Date sd=new java.sql.Date(dt.getTime());
		String strinsert="insert into tips(userid,date,tips) values(?,?,?)";
		try{
			ps=con.prepareStatement(strinsert);
			ps.setString(1, (String)hs.getAttribute("userid"));
			ps.setDate(2, sd);
			ps.setString(3, request.getParameter("txttips"));
			
			int rw=ps.executeUpdate();
			if(rw>0)
			{
				System.out.println("Tips Inserted");
				response.sendRedirect("/ehealthcare/jsp/Expert.jsp?msg1=Tip Added&actMn=Tips");
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}

}
