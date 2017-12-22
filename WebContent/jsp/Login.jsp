<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Healthwiki || Login</title>
</head>
<body>
<jsp:include page="genericheader.jsp"/>
	<div class="container">
		<header class="major">
		<h2>Login</h2>
		</header>
	</div>
	<div style="margin-left: 350px">
	
	<%
	HttpSession hs = request.getSession(false);
	String ui = (String) hs.getAttribute("userid");
if(ui!=null)	
{%>
	<script type="text/javascript">
	location.href="index.jsp";</script>
<%}
	
	if(request.getParameter("msg1")!=null){
System.out.println(request.getParameter("msg")); %>
	<span style="color:green"> <%=request.getParameter("msg1") %></span>
	<%}else{
		if(request.getParameter("msg2")!=null)
		{ System.out.println(request.getParameter("msg2"));
		%>
	<span style="color:red"> <%=request.getParameter("msg2") %></span>
	<%}}%>
		<form method="post" action="/ehealthcare/Login">
			<div class="row uniform 50%">
				<div class="6u$ 12u$(4)">
					<input type="text" id="txtuserid" name="txtuserid"
						required="required" placeholder="userid" />
				</div>
				<div class="6u$ 12u$(4)">
					<input type="password" id="txtpass" name="txtpass"
						required="required" placeholder="Password" />
				</div>
				<!-- <div class="6u$ 12u$(3)">
					<input type="checkbox" id="human" name="human" checked /> <label
						for="human">Remember Me</label>
				</div> -->
				<div class="12u$">
					<ul class="actions">
						<li><input type="submit" value="Login" class="special" /></li>
						<li><input type="reset" value="Cancel" /></li>
					</ul>
				</div>
		</form>
	</div>
</body>
</html>