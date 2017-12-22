<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Healthwiki</title>
<script src="js/jquery.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/skel-layers.min.js"></script>
<script src="js/init.js"></script>
</head>
<body>
<header id="header">
				<h1><a href="index.jsp">Healthwiki</a></h1>
				<nav id="nav">
					<ul>
					<%
					HttpSession hs = request.getSession(false);
					String ui = (String) hs.getAttribute("userid");
					String uType=(String)hs.getAttribute("usertype") ;
					if (hs.isNew() || (ui == null)) {
				%>

				<li><a href="SignUp.jsp" class="button special"> Sign up </a></li>
				<li><a href="Login.jsp" class="button special"> Login </a></li>
				<%
					} else {
						if(ui.equals("admin")){
				%>
				<li><a href="Admin.jsp" class="button special" title="<%=ui%>"> <%=ui%></a></li>	
				<%}else{
					if(uType.equals("user")){%>
				<li><a href="User.jsp" class="button special" title="<%=ui%>"> <%=ui%></a></li>		
				<%}else{ %>
				<li><a href="Expert.jsp" class="button special" title="<%=ui%>"> <%=ui%></a></li>	
				<%} %>
				<%} %><li><a href="/ehealthcare/Logout" class="button special"> <img
						height=100% width=100% alt="logout" src="images/logout.jpg"></a></li>
				<%
					} 
				%>
			</ul>
				</nav>
			</header>

</body>
</html>