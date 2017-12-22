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
<title>Healthwiki || Admin</title>
<style type="text/css">
.txtareastyle {
	height: 141px;
	width: 487px;
}
</style>
</head>
<%
HttpSession hs=request.getSession(false);
if(hs.getAttribute("userid")==null)
{
response.sendRedirect("Login.jsp");	
 }
String ui = (String) hs.getAttribute("userid");
String uType = (String) hs.getAttribute("usertype");
System.out.println(uType);
if(!uType.equals("admin")){
response.sendRedirect("index.jsp");	
}
 %>
<jsp:include page="genericheader.jsp"/>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#home">Admin</a></li>
		<li><a data-toggle="tab" href="#menu1">Inbox</a></li>
		<li><a data-toggle="tab" href="#menu3">Sent Message</a></li>
		<li><a data-toggle="tab" href="#menu2">Add Tips</a></li>
		<li><a data-toggle="tab" href="#menu4">Feedback</a></li>
		<li><a data-toggle="tab" href="#menu5">User List</a></li>
	</ul>

	<div class="tab-content">
		<div id="home" class="tab-pane fade in active">
		<h3>Profile</h3>
		
			<% 
			Connection con=null;
			ResultSet rs=null;
			PreparedStatement ps=null;
			con=DBOperation.createConnection();
			String strsql="select * from logindetails where userid=?";
		    hs= request.getSession(false);
			try{
				ps=con.prepareStatement(strsql);
				ps.setString(1, (String)hs.getAttribute("userid"));
				rs=ps.executeQuery();
				rs.next();
				%>
				<table>
				<tr><td colspan="2" align="center">Admin</td></tr>
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
					<td><%=rs.getString("date")%></td>
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
					<td><input type="submit" value="Add Tips"></td>
				</tr>
			</table>
		</form>
	</div>
		</div>
	
	<div id="menu4" class="tab-pane fade">
			<h3>Feedback</h3>
			<table>
				<tr>
					
					<th>Name</th>
					<th>Email Id</th>
					<th>Message</th>
					<th>Action</th>
				</tr>
				<%  	
				String strsql1 = "Select * from feedback ";
					try {
						ps = con.prepareStatement(strsql1);
						rs = ps.executeQuery();
						while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("name")%></td>
					<td><%=rs.getString("email")%></td>
					<td><%=rs.getString("message")%></td>
					<td><b><a style="color:#FF0000" href="/ehealthcare/DeleteFeedback?msgid=<%=rs.getString("fid")%>">Delete</a></b></td>
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
		
		<div id="menu5" class="tab-pane fade">
			<h3>User List</h3>
			<table>
				<tr>
					<th>userid</th>
					<th>UserType</th>
					<th>Action</th>
					<th>Status</th>
				</tr>
				<%  	
				strsql = "Select * from logindetails ";
					try {
						ps = con.prepareStatement(strsql);
						rs = ps.executeQuery();
						while (rs.next()) {
				%>
				<tr>
				<td><%=rs.getString("userid")%></td>
					<td><%=rs.getString("usertype")%></td>
			
				<td><b><a style="color:#FF0000" href="/ehealthcare/DeleteUser?userid=<%=rs.getString("userid")%>">Delete</a></b></td>
				
				<%if(Boolean.parseBoolean(rs.getString("status"))) {%>
				<td><b><font color="#00CC00">Verified</font></b></td>
				<%}else{ %>
				<td><b><a style="color:#FF0000" href="/ehealthcare/UpdateStatus?userid=<%=rs.getString("userid")%>" >Verify</a></b></td>
				
				<%} %>
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