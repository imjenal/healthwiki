<!DOCTYPE html>
<!--
	Transit by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Healthwiki || Aerobics</title>
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
				<li><a href="vitamins.jsp">Vitamins</a></li>
				<li><a href="yoga.jsp">Yoga</a></li>
				<%
					HttpSession hs = request.getSession(false);
					String ui = (String) hs.getAttribute("userid");
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
				<h2>Aerobics</h2>
				<p>Aerobics: A series of strenuous exercises which help convert
					fats, sugars, and starches into aches, pains, and cramps.</p>
			</header>

			<a href="Aerobics.jsp" class="image fit"><img src="images/a1.jpg"
				alt="Aerobics" /></a>
			<p>Aerobics is a form of physical exercise that combines rhythmic
				aerobic exercise with stretching and strength training routines with
				the goal of improving all elements of fitness (flexibility, muscular
				strength, and cardio-vascular fitness). It is usually performed to
				music and may be practiced in a group setting led by an instructor
				(fitness professional), although it can be done solo and without
				musical accompaniment. With the goal of preventing illness and
				promoting physical fitness, practitioners perform various routines
				comprising a number of different dance-like exercises. Formal
				aerobics classes are divided into different levels of intensity and
				complexity. A well-balanced aerobics class will have five
				components: warm-up (5-10 minutes), cardio vascular conditioning
				(25-30 minutes), muscular strength and conditioning (10-15 minutes),
				cool-down (5-8 minutes) and stretching and flexibility (5-8
				minutes).Aerobics classes may allow participants to select their
				level of participation according to their fitness level. Many gyms
				offer a variety of aerobic classes. Each class is designed for a
				certain level of experience and taught by a certified instructor
				with a specialty area related to their particular class</p>
			<p>
			<h2>Varieties</h2>
			<ol type="1">
				<h3>
					<li>Indoor</li>
				</h3>
				<h4>
					<ul>
						<li>Stair climbing</li>
						<li>Elliptical trainer</li>
						<li>Indoor rower</li>
						<li>Stairmaster</li>
						<li>Stationary bicycle</li>
						<li>Treadmill</li>
					</ul>
				</h4>
				<center>
					<div class="6u$">
						<span class="image fit"><img src="images/a2.jpg"
							alt="Indoor" /></span>
					</div>
				</center>

				<h3>
					<li>Outdoor</li>
				</h3>
				<h4>
					<ul>
						<li>Walking</li>
						<li>Cycling</li>
						<li>Running</li>
						<li>Cross-country skiing</li>
						<li>Cross-country running</li>
						<li>Nordic walking</li>
						<li>Inline skating</li>
						<li>Rowing</li>
					</ul>
				</h4>
				<span class="image fit"><img src="images/a3.jpg"
					alt="Outdoor" /></span>

				<h3>
					<li>Indoor or Outdoor</li>
				</h3>
				<h4>
					<ul>
						<li>Swimming</li>
						<li>Kickboxing</li>
						<li>Skipping rope or jump rope</li>
						<li>Circuit training</li>
						<li>Jumping jacks</li>
						<li>Jogging</li>
						<li>Water aerobics</li>
					</ul>
				</h4>
			</ol>
			<span class="image fit"><img src="images/a4.jpg"
				alt="Indoor Or Outdoor" /></span>
			</p>
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