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
 * Servlet implementation class Message
 */
@WebServlet("/UserMessage")
public class UserMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;   
    
    public UserMessage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs=request.getSession(false);
		String to = request.getParameter("txtto");
		String subject = request.getParameter("txtsubject");
		String msg = request.getParameter("txtmsg");
		java.util.Date dt=new java.util.Date();
		java.sql.Date sd=new java.sql.Date(dt.getTime());
		con=DBOperation.createConnection();
		String strinsert="insert into message(senderid,receiverid,subject,messagetext,date,rstatus,sstatus) values(?,?,?,?,?,?,?)";
		try{
			ps=con.prepareStatement(strinsert);
			ps.setString(1, (String)hs.getAttribute("userid"));
			ps.setString(2, to);
			ps.setString(3, subject);
			ps.setString(4, msg);
			ps.setDate(5, sd); 
			ps.setString(6, "false");
			ps.setString(7, "false");
			int rw=ps.executeUpdate();
			if(rw>0)
			{
				System.out.println("Rows Inserted");
				response.sendRedirect("/ehealthcare/jsp/User.jsp?msg=Message Sent");
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
