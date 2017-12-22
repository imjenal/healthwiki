<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*, com.dbinfo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Healthwiki || Message</title>
<style type="text/css">
.txtareastyle{
height: 141px;
width: 487px;
}
</style>
<jsp:include page="header.jsp"/></head>
<body>
	<div>
	<%
	HttpSession hs = request.getSession(false);
	String ui = (String) hs.getAttribute("userid");
	String uType = (String) hs.getAttribute("usertype");
	if(uType.equals("user")){
	%>
		<form method="post" action="/ehealthcare/UserMessage">
			<%}else{ %>
		<form method="post" action="/ehealthcare/Message">
			<%} %>
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
</body>
</html>