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
 * Servlet implementation class Registration
 */
@WebServlet("/RegistrationUser")
public class RegistrationUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private  Connection con=null;
    private PreparedStatement ps=null;
		
		
    public RegistrationUser() {
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
	String pass=request.getParameter("txtpass1");
	String name=request.getParameter("txtname");
	String add=request.getParameter("txtadd");
	String email=request.getParameter("email");
	String gender=request.getParameter("gender");
	String phone=request.getParameter("phoneno");
	String dob=request.getParameter("dob");
	con=DBOperation.createConnection();
	java.util.Date dt=new java.util.Date();
	java.sql.Date sd=new java.sql.Date(dt.getTime());
	
	String strinsert="insert into userdetails(userid,Name,Address,email,Gender,PhoneNo,Dor,DOB) values(?,?,?,?,?,?,?,?)";
	try{
		ps=con.prepareStatement(strinsert);
		ps.setString(1, ui);
		ps.setString(2, name);
		ps.setString(3, add);
		ps.setString(4, email);
		ps.setString(5, gender);
		ps.setString(6, phone);
		ps.setDate(7, sd);
		ps.setString(8, dob);
		int rw1=ps.executeUpdate();
		if(rw1>0)
		{
			System.out.println("Values in userdetails Table Inserted");
			String strinsert2="insert into logindetails values(?,?,?,?)";
			ps=con.prepareStatement(strinsert2);
			ps.setString(1, ui);
			ps.setString(2, pass);
			ps.setString(3, "user");
			ps.setString(4, "true");
			int rw2=ps.executeUpdate();
			System.out.println("Values in logindetails Table Inserted");
			response.sendRedirect("/ehealthcare/jsp/Login.jsp?msg1=Registration Succesfull");
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
