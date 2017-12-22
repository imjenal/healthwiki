<!DOCTYPE html>
<!--
	Transit by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Healthwiki || Experts</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
<script src="js/jquery.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/skel-layers.min.js"></script>
<script src="js/init.js"></script>
<noscript>
	<link rel="stylesheet" href="css/skel.css" />
	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/style-xlarge.css" />
</noscript>
</head>
<body>

	<!-- Header -->
	<header id="header">
		<h1>
			<a href="index.jsp">Healthwiki</a>
		</h1>
		<nav id="nav">
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="Experts.jsp">Experts</a></li>
				<li><a href="AboutUs.jsp">About Us</a></li>
				<%
					HttpSession hs = request.getSession(false);
					String ui = (String) hs.getAttribute("userid");
					String uType = (String) hs.getAttribute("usertype");
					if (hs.isNew() || (ui == null)) {
				%>
				<li><a href="SignUp.jsp" class="button special"> Sign up </a></li>
				<li><a href="Login.jsp" class="button special"> Login </a></li>
				<%
					} else {
				%>
				<li><a href="Expert.jsp" class="button special" title="<%=ui%>">
						<%=ui%></a></li>
				<li><a href="/ehealthcare/Logout" class="button special"> <img
						height=100% width=100% alt="logout" src="images/logout.jpg"></a></li>
				<%
					}
				%>
			</ul>
		</nav>
	</header>

	<!-- Main -->
	<section id="main" class="wrapper">
		<div class="container">

			<header class="major">
				<h2>Experts</h2>
			</header>

			<h2>Dietician</h2>
			<center>
				<div class="4u$">
					<span class="image fit"><img src="images/d.jpg" alt="Dietician" /></span>
				</div>
			</center>
			<p>A dietitian (or dietician) is an expert in dietetics; that is,
				human nutrition and the regulation of diet. A dietitian advises
				people on what to eat in order to lead a healthy lifestyle or to
				achieve a specific health-related goal. Dietitians work in a variety
				of settings from clinical to community and public policy to media
				communications.<br><br>
			A registered dietitian (RD) or registered dietitian
				nutritionist (RDN), is a dietitian who meets all of a set of special
				academic and professional requirements, including:
			<ul>
				<li>the completion of a bachelor's degree with an accredited
					nutrition</li>
				<li>curriculum satisfactory performance on the registration
					exam</li>
				<li>an internship at an approved health-care facility,
					foodservice organization, or community agency</li>
			</ul></p>

			<h2>Nuritionist</h2>
			<center>
				<div class="4u$">
					<span class="image fit"><img src="images/n.jpg" alt="Nutritionist" /></span>
				</div>
			</center>
			<p>A nutritionist is a person who advises on matters of food and
				nutrition impacts on health. Different professional terms are used
				in different countries, employment settings and context- some
				examples include: nutrition scientist, public health nutritionist,
				dietitian-nutritionist, clinical nutritionist, and sports
				nutritionist.</p>
		</div>
	</section>

	<!-- Footer -->
	<footer id="footer">
		<div class="container">
			<section class="links">
				<div class="row">
					<section class="3u 6u(medium) 12u$(small)">
						<h3>
							<a href="index.jsp">Home</a>
						</h3>
						<ul class="unstyled">
							<li><a href="index.jsp#one">Rejuvenate Yourself</a></li>
							<li><a href="index.jsp#two">Daily Tips</a></li>
						</ul>
					</section>
					<section class="3u 6u$(medium) 12u$(small)">
						<h3>
							<a href="SignUp.jsp">SignUp</a>
						</h3>
						<ul class="unstyled">
							<li><a href="RegistrationExperts.jsp">Experts</a></li>
							<li><a href="RegistrationUser.jsp">User</a></li>
					</section>
					<section class="3u 6u(medium) 12u$(small)">
						<h3>
							<a href="AboutUs.jsp">About Us</a>
						</h3>
						<ul class="unstyled">
							<li><a href="vitamins.jsp">Vitamins</a></li>
							<li><a href="yoga.jsp">Yoga</a></li>
							<li><a href="Aerobics.jsp">Aerobics</a></li>
						</ul>
					</section>
					<section class="3u$ 6u$(medium) 12u$(small)">
						<h3>
							<a href="index.jsp#three">Contact Us</a>
						</h3>
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
							</lhrei>
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