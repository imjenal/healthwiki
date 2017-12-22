<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*, com.dbinfo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Healthwiki || Tips</title>
<jsp:include page="genericheader.jsp"/>
</head>
<body>
<h3>Change Your Profile Pic</h3>
			<form method="post" action="/ehealthcare/Upload" enctype="multipart/form-data">
			<input type="file" id="pic" name="pic"/>
			<br>
			<input type="submit" value="Upload Pic"/>
			</form>
<% ServletContext sc=getServletContext();
HttpSession hs=request.getSession(false);	
Connection con=null;
		ResultSet rs=null;
		PreparedStatement ps=null;   
		con = DBOperation.createConnection();
		ps=null;
		String path=sc.getRealPath("/");
		System.out.println(path);
		String ui=(String)hs.getAttribute("userid");
		String strsql = "select ProfilePic from userdetails where userid=?";
		ps = con.prepareStatement(strsql);
		ps.setString(1, ui);
		rs = ps.executeQuery();
		 if(rs.next())
		 {
			 String newpath=path+"\\"+ui+"\\"+rs.getString("ProfilePic");
			 System.out.println("newpath is "+newpath);
			 %>
		
			<img src="file:///C:/Users/Jyotsna%20Gupta/HeathCare/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/ehealthcare/hi/aerobics2.jpg" alt="<%=(String)hs.getAttribute("userid")%>" width=100% height=100% />
				<%}%>
</body>
</html>