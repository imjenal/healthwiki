package ehealthcare;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbinfo.DBOperation;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Enumeration;



/**
 * Servlet implementation class Upload
 */
@WebServlet("/Upload")
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Upload() {
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
		PreparedStatement ps=null;
		Connection con=null;
		HttpSession hs=request.getSession();
		ServletContext sc=getServletContext();
		String path=sc.getRealPath("/");
		System.out.println(path);
		String ui=(String)hs.getAttribute("userid");
		String newpath=path+"/"+ui;
		File f=new File(newpath);
		if(!f.exists())
		{
			f.mkdir();
		}
		MultipartRequest mpt=new MultipartRequest(request, newpath, 4*1024*1024, new DefaultFileRenamePolicy());
		File fobj=null;
		Enumeration	e=mpt.getFileNames();
		String filename="";
		while(e.hasMoreElements())
		{
			String ctrlname=(String)e.nextElement();
			System.out.println("Control is"+ctrlname);
			fobj=mpt.getFile(ctrlname);
			fobj.getName();
		filename=fobj.getName();
		}
		
		try{
		con=DBOperation.createConnection();
		String strupdate="update userdetails set ProfilePic=? where userid=?";
		ps=con.prepareStatement(strupdate);
		ps.setString(1, filename);
		ps.setString(2, ui);
		int rw=ps.executeUpdate();
		if(rw>0)
		{
			System.out.println("Pic Inserted");
			response.sendRedirect("/ehealthcare/jsp/Expert.jsp?msg=Pic Uploaded");
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

