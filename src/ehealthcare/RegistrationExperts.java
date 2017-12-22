package ehealthcare;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbinfo.DBOperation;

import java.sql.*;
/**
 * Servlet implementation class RegistrationExperts
 */
@WebServlet("/RegistrationExperts")
public class RegistrationExperts extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private  Connection con=null;
    private PreparedStatement ps=null;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationExperts() {
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
		String ui=request.getParameter("txtuserid");
		String pass=request.getParameter("txtuserpass1");
		String name=request.getParameter("txtname");
		String add=request.getParameter("txtadd");
		String role=request.getParameter("role");
		String email=request.getParameter("email");
		String gender=request.getParameter("gender");
		String phone=request.getParameter("phoneno");
		String dob=request.getParameter("dob");
		String exp=request.getParameter("exp");
		String skills=request.getParameter("skills");
		con=DBOperation.createConnection();
		String strinsert1="insert into expert values(?,?,?,?,?,?,?,?,?,?)";
		
		try{
			ps=con.prepareStatement(strinsert1);
			ps.setString(1, ui);
			ps.setString(2, name);
			ps.setString(3, add);
			ps.setString(4, email);
			ps.setString(5, gender);
			ps.setString(6, phone);
			ps.setString(7, exp);
			ps.setString(8, skills);
			ps.setString(9, role);
			ps.setString(10, dob);
			int rw1=ps.executeUpdate();
			if(rw1>0)
			{
				System.out.println("Values in expert Table Inserted");
				String strinsert2="insert into logindetails values(?,?,?,?)";
				ps=con.prepareStatement(strinsert2);
				ps.setString(1, ui);
				ps.setString(2, pass);
				ps.setString(3, role);
				ps.setString(4, "false");
				int rw2=ps.executeUpdate();
				System.out.println("Values in logindetails Table Inserted");
				response.sendRedirect("/ehealthcare/jsp/Login.jsp?msg1=Registration Successfull");
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
