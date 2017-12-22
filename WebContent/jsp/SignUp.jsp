<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*, com.dbinfo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Healthwiki || Registration</title>
<script src="js/jquery.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/skel-layers.min.js"></script>
<script src="js/init.js"></script>
<jsp:include page="genericheader.jsp"/>
</head>
<body>
	<section id="one" class="wrapper style1 special">
	<div class="container">
		<header class="major">
		<h2>Sign Up</h2>
		<p>Join Us As an Expert Or a User</p>
		</header>
		<div class="row 150%">

			<div class="6u 12u$(3)">
				<section class="box"> <a href="RegistrationExperts.jsp"><img
					src="images/experts.jpg" class="icon big rounded color1 fa-cloud"></a>
				<h3>
					<a href="RegistrationExperts.jsp">Join as an Expert</a>
				</h3>
				<p>An Expert provides independent, authoritative, impartial and
					timely expertise on Yoga, Diet and Nutrition</p>
				You can make people reach their full potential by your expert
				guidance. Guide the people !!!
				</section>
			</div>
			<div class="6u 12u$(3)">
				<section class="box"> <a href="RegistrationUser.jsp"><img
					src="images/user.png" class="icon big rounded color9 fa-desktop"></a>
				<h3>
					<a href="RegistrationUser.jsp"> Join As User</a>
				</h3>
				<p>To keep the body in good health is a duty... Otherwise we
					shall not be able to keep our mind strong and clear!</p>
				Listen to experts. They'll tell you what can't be done, and why.
				Then do it. </section>
			</div>
		</div>
	</div>
	</section>
</body>
</html>