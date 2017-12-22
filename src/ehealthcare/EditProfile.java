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
 * Servlet implementation class RegistrationExperts
 */
@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private  Connection con=null;
    private PreparedStatement ps=null;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfile() {
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
		HttpSession hs= request.getSession(false);
		String ui=(String)hs.getAttribute("userid");
		String name=request.getParameter("txtname");
		String add=request.getParameter("txtadd");
		String role=request.getParameter("role");
		String email=request.getParameter("email");
		String gender=request.getParameter("gender");
		String phoneno=request.getParameter("phoneno");
		String dob=request.getParameter("dob");
		String exp=request.getParameter("exp");
		String skills=request.getParameter("skills");
		con=DBOperation.createConnection();
		String strupdate1 = "update expert set Name=?, email=?, Gender=?, dob=?, PhoneNo=?, Address=?, role=?, experience=?, skills=? where userid=?";
		
		try{
			ps=con.prepareStatement(strupdate1);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, gender);
			ps.setString(4, dob);
			ps.setString(5, phoneno);
			ps.setString(6, add);
			ps.setString(7, role);
			ps.setString(8, exp);
			ps.setString(9, skills);
			ps.setString(10, ui);
			int rw1=ps.executeUpdate();
			if(rw1>0)
			{
				System.out.println("Values in expert Table Updated");
				String strupdate2="update logindetails set usertype=? where userid=?";
				ps=con.prepareStatement(strupdate2);
				ps.setString(1, role);
				ps.setString(2, ui);
				int rw2=ps.executeUpdate();
				System.out.println("Values in logindetails Table Updated");
				response.sendRedirect("/ehealthcare/jsp/Expert.jsp?msg1=Update Successfull");
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
