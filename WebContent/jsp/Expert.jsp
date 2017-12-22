<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*, com.dbinfo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="css/bootstrap.min.css">
<script
	src="js/jquery.min.js"></script>
<script
	src="js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Healthwiki || Expert</title>
<style type="text/css">
.txtareastyle {
	height: 141px;
	width: 487px;
}
</style>
<%
HttpSession hs=request.getSession(false);
if(hs.getAttribute("userid")==null)
{
response.sendRedirect("Login.jsp");	

}
%>
<jsp:include page="genericheader.jsp" /></head>
<body>
	<ul class="nav nav-tabs">
		
		
		<li class="active"><a data-toggle="tab" href="#home">My Profile</a></li>
		<li><a data-toggle="tab" href="#edit">Edit Profile</a></li>
		<li><a data-toggle="tab" href="#menu1">Inbox</a></li>
		<li><a data-toggle="tab" href="#menu3">Sent Message</a></li>
		<li class="active"><a data-toggle="tab" href="#menu2">Add Tips</a></li>
	</ul>

	<div class="tab-content">
		<div id="home" class="tab-pane fade in active">
		<h3>Profile</h3>
		
			<% 
			Connection con=null;
			ResultSet rs=null;
			PreparedStatement ps=null;
			con=DBOperation.createConnection();
			String strsql="select * from expert where userid=?";
		    hs= request.getSession(false);
			try{
				ps=con.prepareStatement(strsql);
				ps.setString(1, (String)hs.getAttribute("userid"));
				rs=ps.executeQuery();
				rs.next();
				%>
				<table>
				<tr><th>Name</th>
				 <th> <%=rs.getString("Name")%></th></tr>
				<tr><th>Email</th>
					<th><%=rs.getString("Email")%></th></tr> 
				<tr><th>Gender</th>
					<th><%=rs.getString("Gender")%></th></tr>	
				 <tr><th>DOB</th>
					<th><%=rs.getString("DOB")%></th></tr>	
				<tr><th>Contact No</th>
					<th><%=rs.getString("PhoneNo")%></th></tr>	
				 <tr><th>Address</th>
				 <th><%=rs.getString("Address")%></th></tr>
				<tr><th>Role</th>
					<th><%=rs.getString("Role")%></th></tr>	
				<tr><th>Experience</th>
					<th><%=rs.getString("Experience")%></th></tr>	
				<tr><th>Skills</th>
					<th><%=rs.getString("Skills")%></th></tr>	
				
				<% }
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
			%>
		</table>
		</div>
		
		
		<div id="edit" class="tab-pane fade">
		<h3>Edit Profile</h3>
		
			<% 
			con=DBOperation.createConnection();
		    strsql="select * from expert where userid=?";
		    hs= request.getSession(false);
			try{
				ps=con.prepareStatement(strsql);
				ps.setString(1, (String)hs.getAttribute("userid"));
				rs=ps.executeQuery();
				rs.next();
				%>
				<form method="post" action="/ehealthcare/EditProfile">
				<table>
				<tr><th>Name</th>
				 <th><input type="text"  value="<%=rs.getString("Name")%>" name="txtname"></th></tr>
				<tr><th>Email</th>
					<th><input type="text" value="<%=rs.getString("Email")%>" name="email"></th></tr> 
				<tr><th>Gender</th>
					<th><input type="text" value="<%=rs.getString("Gender")%>" name="gender"></th></tr>	
				 <tr><th>DOB</th>
					<th><input type="text" value="<%=rs.getString("DOB")%>" name="dob"></th></tr>	
				<tr><th>Contact No</th>
					<th><input type="text" value="<%=rs.getString("PhoneNo")%>" name="phoneno"></th></tr>	
				 <tr><th>Address</th>
				 <th><input type="text" value="<%=rs.getString("Address")%>" name="txtadd"></th></tr>
				<tr><th>Role</th>
					<th><input type="text" value="<%=rs.getString("Role")%>" name="role"></th></tr>	
				<tr><th>Experience</th>
					<th><input type="text" value="<%=rs.getString("Experience")%>" name="exp"></th></tr>	
				<tr><th>Skills</th>
					<th><input type="text" value="<%=rs.getString("Skills")%>" name="skills"></th></tr>	
				<tr>
					<td colspan="2" align="center"><input type="submit" value="Update"></td>
				<%if(request.getParameter("msg1")!=null){
System.out.println(request.getParameter("msg")); %>
	<td><span style="color:green"> <%=request.getParameter("msg1") %></span> </td>
<% }%> 
				
				</tr>
				<%}
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
			%>
			
			
		</table>
		</form>
		</div>
		
		<div id="menu1" class="tab-pane fade">
			<h3>Inbox</h3>
			<table>
				<tr>
					<th>From</th>
					<th>Subject</th>
					<th>Message</th>
					<th>Date</th>
					<th>Action</th>
				</tr>
				<%  	
				
					String strinsert = "Select * from message where receiverid=?";
					try {
						ps = con.prepareStatement(strinsert);
						ps.setString(1, (String)hs.getAttribute("userid"));
						rs = ps.executeQuery();
						while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("senderid")%></td>
					<td><%=rs.getString("subject")%></td>
					<td><%=rs.getString("messagetext")%></td>
					<td><%=rs.getDate("date")%></td> 
					<td><b><a style="color:#00CC00" href="Message.jsp?to=<%=rs.getString("senderid")%>">Reply</a></b>
					<b><a style="color:#FF0000" href="/ehealthcare/DeleteMessage?msgid=<%=rs.getString("messageid")%>">Delete</a></b></td>
				</tr>

				<%
					}
					} catch (SQLException se) {
						System.out.println(se);
					} finally {
						try {
							if (ps != null)
								ps.close();
						} catch (SQLException se) {
							System.out.println(se);
						}
					}
				%>
			</table>
		</div>
		
		
		<div id="menu3" class="tab-pane fade">
			<h3>Sent</h3>
			<table>
				<tr>
					<th>To</th>
					<th>Subject</th>
					<th>Message</th>
					<th>Date</th>
					<th>Action</th>
				</tr>
				<%  	
				
					 strinsert = "Select * from message where senderid=?";
					try {
						ps = con.prepareStatement(strinsert);
						ps.setString(1, (String)hs.getAttribute("userid"));
						rs = ps.executeQuery();
						while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("receiverid")%></td>
					<td><%=rs.getString("subject")%></td>
					<td><%=rs.getString("messagetext")%></td>
					<td><%=rs.getString("date")%></td>
					<td><b><a style="color:#FF0000" href="/ehealthcare/DeleteMessage?msgid=<%=rs.getString("messageid")%>">Delete</a></b></td>
				</tr>

				<%
					}
					} catch (SQLException se) {
						System.out.println(se);
					} finally {
						try {
							if (ps != null)
								ps.close();
						} catch (SQLException se) {
							System.out.println(se);
						}
					}
				%>
			</table>
		</div>
		
		<div id="menu2" class="tab-pane fade">
			<h3>Add Tips</h3>
				<div>
		<form method="get" action="/ehealthcare/Tips">
			<table>
				<tr>
				<td><textarea class="txtareastyle" name="txttips" placeholder="Tips You Want to Post !!" id="txttips" required></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="Add Tips"></td>
				</tr>
			</table>
		</form>
	</div>
		</div>
	</div>
</body>
</html>