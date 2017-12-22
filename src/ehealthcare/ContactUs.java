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

import com.dbinfo.DBOperation;

/**
 * Servlet implementation class ContactUs
 */
@WebServlet("/ContactUs")
public class ContactUs extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private  Connection con=null;
	   private PreparedStatement ps=null; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactUs() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String msg=request.getParameter("message");
		con=DBOperation.createConnection();
		String strinsert1="insert into feedback(name,email,message) values(?,?,?)";
		
		try{
			ps=con.prepareStatement(strinsert1);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, msg);
			int rw=ps.executeUpdate();
			if(rw>0)
			{
				System.out.println("Message Received");
				response.sendRedirect("/ehealthcare/jsp/index.jsp");
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

}
