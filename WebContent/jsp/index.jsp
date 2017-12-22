<!DOCTYPE html>
<!--
	Transit by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.dbinfo.DBOperation"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="header.jsp"/>
<body class="landing">
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5&appId=1681498138729275";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
	<!-- Header -->
	<header id="header">
		<h1>
			<a href="index.jsp">Healthwiki </a>
		</h1>
		<nav id="nav">
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="Experts.jsp">Experts</a></li>
				<li><a href="AboutUs.jsp">About Us</a></li>
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

	<!-- Banner -->
	<section id="banner">
		<h2>Healthwiki</h2>
		<p>It's all about keeping you Healthy !!!</p>
		<ul class="actions">
			<%
				hs = request.getSession(false);
				ui = (String) hs.getAttribute("userid");
				if (hs.isNew() || (ui == null)) {
			%>


			<li><a href="SignUp.jsp" class="button big">Join Us</a></li>
			<%
				} else {
			%>
			<%
				}
			%>
		</ul>
	</section>

	<!-- One -->
	<section id="one" class="wrapper style1 special">
		<div class="container">
			<header class="major">
				<h2>Rejuvenate Yourself !!</h2>
				<p>Keep Calm And Stay Healthy</p>
			</header>
			<div id="vya" class="row 150%">
				<div class="4u 12u$(medium)">
					<section class="box">
						<a href="vitamins.jsp"><img src="images/vitamins.jpg"
							class="icon big rounded color1 fa-cloud"></a>
						<h3>
							<a href="vitamins.jsp">Vitamins</a>
						</h3>
						<p>
							You will get to know the different types of Vitamins and
							importance of each benefit.<br>Keep Calm And Eat Healthy!<br>Stay
							Fit!
						</p>
					</section>
				</div>
				<div class="4u 12u$(medium)">
					<section class="box">
						<a href="yoga.jsp"><img src="images/yoga.png"
							class="icon big rounded color9 fa-desktop"></a>
						<h3>
							<a href="yoga.jsp">Yoga</a>
						</h3>
						<p>
							Yoga is a light, which once lit, will never dim. The better your
							practice, the brighter the flame<br> Yoga is 99% practice
							and 1% theory
						</p>
					</section>
				</div>
				<div class="4u$ 12u$(medium)">
					<section class="box">
						<a href="Aerobics.jsp"><img src="images/aerobics.jpg"
							class="icon big rounded color6 fa-rocket"></a>
						<h3>
							<a href="Aerobics.jsp">Aerobics</a>
						</h3>
						<p>You think aerobics is not a cool sport? Wrong! It requires
							amazing discipline - flexibility, fitness, knowledge. You need to
							do it with a big smile</p>
					</section>
				</div>
			</div>
			.
		</div>
	</section>

	<!-- Two -->
	<section id="two" class="wrapper style2 special">
		<div class="container">
			<header class="major">
				<h2>Eat More F.O.O.D.</h2>
				<p>
				F - Fruits And Veggies<br>
				O - Organic Lean Proteins<br>
				O - Omega 3 Fatty Acids<br>
				D - Drink Lots of Water</p>
			</header>
			<section id="tips" class="profiles">
				<div class="row">


					<%
						Connection con = DBOperation.createConnection();
						String strinsert = "Select * from tips order by date desc limit 10";
						PreparedStatement ps = null;
						try {
							ps = con.prepareStatement(strinsert);

							ResultSet rs = ps.executeQuery();
							while (rs.next()) {
								strinsert = "select Name from expert where userid=?";
								ps = con.prepareStatement(strinsert);
								ps.setString(1, rs.getString("userid"));
								ResultSet rs1 = ps.executeQuery();
								if (rs1.next()) {
					%>
					<section class="3u 6u(medium) 12u$(xsmall) profile">
						<img src="images/profile_placeholder.gif" alt="" />
						<h4><%=rs1.getString("Name")%></h4>

						<p><%=rs.getString("tips")%></p>
					</section>
					<%
						}
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

				</div>
			</section>
			<footer>
				<h3>"Take Care of Your Body. It's the Only Place You Have To Live " </h3>
				<h4 align="right">- Vim Robn </h4>
				<ul class="actions">
					<li><a href="#header" class="button big">Back To Top</a></li>
				</ul>
			</footer>
		</div>
	</section>

	<!-- Three -->
	<section id="three" class="wrapper style3 special">
		<div class="container">
			<header class="major">
				<h2>Contact Us</h2>
				<p>Happy to Help ! 24x7</p>
			</header>
		</div>
		<div class="container 50%">
			<form action="/ehealthcare/ContactUs" method="post">
				<div class="row uniform">
					<div class="6u 12u$(small)">
						<input name="name" id="name" value="" placeholder="Name"
							type="text">
					</div>
					<div class="6u$ 12u$(small)">
						<input name="email" id="email" value="" placeholder="Email"
							type="email">
					</div>
					<div class="12u$">
						<textarea name="message" id="message"
							placeholder="Message : Query or Feedback" rows="6"></textarea>
					</div>
					<div class="12u$">
						<ul class="actions">
							<li><input value="Submit" class="special big" type="submit"></li>
						</ul>
					</div>
				</div>
			</form>
		</div>
	</section>
	
		<!-- Footer -->
	<footer id="footer">
		<div class="container">
			<section class="links">
				<div class="row">
					<section class="3u 6u(medium) 12u$(small)">
						<h3><a href="index.jsp">Home</a></h3>
						<ul class="unstyled">
							<li><a href="index.jsp#one">Rejuvenate Yourself</a></li>
							<li><a href="index.jsp#two">Daily Tips</a></li>
						</ul>
					</section>
					<section class="3u 6u$(medium) 12u$(small)">
						<h3><a href="SignUp.jsp">SignUp</a></h3>
						<ul class="unstyled">
							<li><a href="RegistrationExperts.jsp">Experts</a></li>
							<li><a href="RegistrationUser.jsp">User</a></li>
							<li><a href="Admin.jsp">Admin</a></li>
					</section>
					<section class="3u 6u(medium) 12u$(small)">
						<h3><a href="AboutUs.jsp">About Us</a></h3>
						<ul class="unstyled">
							<li><a href="vitamins.jsp">Vitamins</a></li>
							<li><a href="yoga.jsp">Yoga</a></li>
							<li><a href="Aerobics.jsp">Aerobics</a></li>
						</ul>
					</section>
					<section class="3u$ 6u$(medium) 12u$(small)">
						<h3><a href="index.jsp#three">Contact Us</a></h3>
						<ul class="unstyled">
							<li><a href="index.jsp#three">Feedback</a></li>
							<li><a href="index.jsp#three">Query</a></li>
						</ul>
					</section>
				</div>
			</section>
			<div class="row">
				<div class="8u 12u$(medium)">
					<ul class="copyright">
						<li>&copy; Healthwiki All rights reserved.</li>
						<li>Developed By: Jyotsna</li>
						<!-- <li>Images: <a href="http://templated.co">Templates</a>
						<a href="http://unsplash.com">Unsplash</a></li> -->
					</ul>
				</div>
				<div class="4u$ 12u$(medium)">
					<ul class="icons">
						<li><a
							href="https://www.facebook.com/pages/Healthwiki/733782126730716"
							class="icon rounded fa-facebook"><span class="label">Facebook</span></a>
							</li>
						<li><a href="https://twitter.com/healthwikicare"
							class="icon rounded fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a
							href="https://plus.google.com/u/1/105568784360023633211/posts"
							class="icon rounded fa-google-plus"><span class="label">Google+</span></a></li>
						<!-- <li><a class="icon rounded fa-linkedin"><span
								class="label">LinkedIn</span></a></li>  -->
					</ul>
				</div>
			</div>
		</div>
			
			</footer>
</body>
</html>