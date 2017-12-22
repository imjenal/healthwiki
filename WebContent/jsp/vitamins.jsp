<!DOCTYPE html>
<!--
	Transit by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Healthwiki || Vitamins</title>
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
				<li><a href="yoga.jsp">Yoga</a></li>
				<li><a href="Aerobics.jsp">Aerobics</a></li>
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
				<h2>Vitamins</h2>
				<p>Vitamins and minerals are essential nutrients your body needs
					in small amounts to work properly</p>
			</header>
			<center>
				<div class="4u$">
					<span class="image fit"><img src="images/v1.jpg" alt="Vitamins" /></span>
				</div>
			</center>
			<p>A vitamin is an organic compound and a vital nutrient that an
				organism requires in limited amounts.[1] An organic chemical
				compound (or related set of compounds) is called a vitamin when the
				organism cannot synthesize the compound in sufficient quantities,
				and it must be obtained through the diet; thus, the term "vitamin"
				is conditional upon the circumstances and the particular organism To
				keep itself running smoothly your body requires an array of
				essential nutrients, ranging from disease-fighting antioxidants to
				bone-building heavy metals. Although you can get many of these
				nutrients in a daily supplement, nearly all of them can also be
				found in the foods you eat—or should be eating—every day</p>

			<h2>Vitamin A</h2>
			<p>
			<center>
				<div class="4u$">
					<span class="image fit"><img src="images/v2.jpg" alt="Vitamin A" /></span>
				</div>
			</center>
			<b>Why you need it:</b> The vitamin A family plays a key role in
			immunity, reproductive behaviors, and especially vision. The A
			vitamins, which include beta-carotene, help the retina, cornea, and
			membranes of the eye to function properly. <br> <br> <b>Where
				to get it:</b> The highest concentration of vitamin A is found in sweet
			potatoes, Beef liver, spinach, fish, milk, eggs, and carrots also are
			good sources.
			</p>

			<h2>Vitamin B6</h2>
			<p>
			<center>
				<div class="4u$">
					<span class="image fit"><img src="images/v3.jpg" alt="Vitamin B6" /></span>
				</div>
			</center>
			<b>Why you need it:</b> Vitamin B6 is an umbrella term for six
			different compounds that have similar effects on the body. These
			compounds metabolize foods, help form hemoglobin (part of your red
			blood cells), stabilize blood sugar, and make antibodies that fight
			disease.<br> <b>Where to get it:</b> Fish, beef liver, and
			poultry are all good sources of B6, but the food richest in this
			vitamin—good news for vegetarians—is the chickpea, or garbanzo bean.
			</p>

			<h2>Vitamin C</h2>
			<p>
			<center>
				<div class="4u$">
					<span class="image fit"><img src="images/v4.jpg" alt="Vitamin C" /></span>
				</div>
			</center>
			<b>Why you need it:</b> Vitamin C is an important antioxidant, and
			it's also a necessary ingredient in several key bodily processes,
			such as protein metabolism and the synthesis of neurotransmitters.<br>
			<b>Where to get it:</b> Most people think citrus when they think of
			vitamin C, but sweet red peppers actually contain more of the vitamin
			than any other food (well ahead of oranges and just edging out orange
			juice). Other good sources include kiwi fruit, broccoli, Brussels
			sprouts, and cantaloupe.
			</p>

			<h2>Vitamin D</h2>
			<p>
			<center>
				<div class="4u$">
					<span class="image fit"><img src="images/v5.jpg"
						alt="Vitamin D" /></span>
				</div>
			</center>
			<b>Why you need it: </b>Vitamin D, which our body generates on its
			own when our skin is exposed to sunlight, helps spur calcium
			absorption and bone growth. It's also important for cell growth,
			immunity, and the reduction of inflammation.<br> <b>Where to
				get it:</b> Fatty fishes—including swordfish, salmon, and mackerel—are
			among the few naturally occurring dietary sources of vitamin D. Most
			people tend to consume vitamin D via fortified foods such as milk,
			breakfast cereals, yogurt, and orange juice.
			</p>

			<h2>Vitamin E</h2>
			<p>
			<center>
				<div class="4u$">
					<span class="image fit"><img src="images/v6.jpg" alt="Vitamin E" /></span>
				</div>
			</center>
			<b>Why you need it:</b> Vitamin E is a powerful antioxidant that
			protects cells from the harmful molecules known as free radicals.
			It's important for immunity, and for healthy blood vessel function
			and clotting (such as occurs when you cut yourself).<br> <b>Where
				to get it:</b> While wheat germ oil packs more vitamin E than any other
			food source, most people will find it easier to get their vitamin E
			from sunflower seeds or almonds.
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