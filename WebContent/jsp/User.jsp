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
<title>Healthwiki || User</title>
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
		<li><a data-toggle="tab" href="#menu2">Compose</a></li>
		<li><a data-toggle="tab" href="#menu1">Inbox</a></li>
		<li><a data-toggle="tab" href="#menu3">Sent Message</a></li>
	</ul>

	<div class="tab-content">
		<div id="home" class="tab-pane fade in active">
		<h3>Profile</h3>
		
			<% 
			Connection con=null;
			ResultSet rs=null;
			PreparedStatement ps=null;
			con=DBOperation.createConnection();
			String strsql="select * from userdetails where userid=?";
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
					<th><%=rs.getString("email")%></th></tr> 
				<tr><th>Gender</th>
					<th><%=rs.getString("Gender")%></th></tr>	
				 <tr><th>DOB</th>
					<th><%=rs.getString("DOB")%></th></tr>	
				 <tr><th>Date Of Registration</th>
					<th><%=rs.getString("Dor")%></th></tr>		
				<tr><th>Contact No</th>
					<th><%=rs.getString("PhoneNo")%></th></tr>	
				 <tr><th>Address</th>
				 <th><%=rs.getString("Address")%></th></tr>
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
		
		
		<div id="menu2" class="tab-pane fade">
			<h3>Compose</h3>
				<div>
		<form method="post" action="/ehealthcare/UserMessage">
			<table>
				<tr>
					<td>To</td>
					<td><%if(request.getParameter("to")==null)
					{%>
					<input type="text" id="txtto" name="txtto"
						required="required" value="">
						<% }
						else
						{%>
					<input type="text" id="txtto" name="txtto"
						required="required" value="<%=request.getParameter("to")%>">
						<%} %></td>
				</tr>
				<tr>
					<td>Subject</td>
					<td><input type="text" id="txtsubject" name="txtsubject"
						required="required" value="hi"></td>
				</tr>
				<tr>
					<td>Message</td>
					<td><textarea class="txtareastyle" name="txtmsg" id="txtmsg"></textarea>
					</td>
				</tr>
				<tr>
					<td><input type="submit" value="Send"></td>
				</tr>
			</table>
		</form>
	</div>
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
	
		</div>
		
</body>
</html>