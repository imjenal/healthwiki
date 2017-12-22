<!DOCTYPE html>
<!--
	Transit by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Healthwiki || Yoga</title>
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
				<h2>Yoga</h2>
				<p>"Yoga is the journey of the self, through the self, to the
					self" -- Bhagwad Gita</p>
			</header>

			<a href="yoga.jsp" class="image fit"><img src="images/y1.jpg" alt="" /></a>
			<p>Derived from the Sanskrit word yuj, Yoga means union of the
				individual consciousness or soul with the Universal Consciousness or
				Spirit. Yoga is a 5000 year old Indian body of knowledge. Though
				many think of yoga only as a physical exercise where people twist,
				turn, stretch, and breathe in the most complex ways, these are
				actually only the most superficial aspect of this profound science
				of unfolding the infinite potentials of the human mind and soul. The
				science of Yoga imbibe itself the complete essence of the Way of
				Life, including - Gyan Yoga or philosophy, Bhakti Yoga or path of
				devotional bliss, Karma Yoga or path of blissful action, and Raja
				Yoga or path of mind control. Raja Yoga is further divided into
				eight parts. At the heart of the Raja Yoga system, balancing and
				unifying these various approaches, is the practice of Yoga Asana.</p>
			<p>Yoga is the simplest and the easiest way to reduce our excess
				weight and meditating our body and mind. The ancient practice of
				yoga provides a wide range of mind and body benefits, including
				other benefits like giving strength and flexibility, stress relief
				and even cures many diseases</p>
			
			<h2>VARIOUS YOGA ASANAS FOR BEGINNERS:</h2>
		<li><h3>Slow Neck Stretches:</h3></li>
				<center>
					<div class="4u$">
						<span class="image fit"><img src="images/y2.jpg"
							alt="Slow Neck Stretches" /></span>
					</div>
				</center>
				<p>To start with yoga, one should get started with the basic
					exercises first like slow neck stretches. It is recommend to
					perform few repetitions of this yogic slow neck stretches as it
					eases the neck tension and strain. This yoga can be easily done
					standing anywhere, even sitting on your chair!</p>
			
				<li><h3>Tadasana (Mountain pose):</h3></li>
						<center>
				<div class="4u$">
					<span class="image fit"><img src="images/y3.jpg" alt="Tadasana (Mountain Pose)" /></span>
				</div>
			</center>
			
				<p>Tadasana is also known as mountain pose. Practicing this
					asana regularly every morning gives a good massage to our hands,
					back, spine and the whole body. This is the most recommended asana
					for increasing height as well.</p>

				<li><h3>Uttanasana (Standing Forward Fold Pose):</h3></li>
							<center>
				<div class="4u$">
					<span class="image fit"><img src="images/y4.jpg" alt="Uttanasana (Standing Forward Fold Pose)" /></span>
				</div>
			</center>
				
				<p>Uttanasana is a forward bending pose which relaxes us from
					stress and anxiety. And with the arm bind, this standing forward
					bend variation provides a deep shoulder stretch. By binding the
					hands, it also allows the arms to stretch and tighten the shoulders
					to relax. It also brings some blood back to the brain while giving
					a great stretch to the legs.</p>

				<li><h3>Trikonasana (Triangle pose):</h3></li>
							<center>
				<div class="4u$">
					<span class="image fit"><img src="images/y5.jpg" alt="Trikonasana (Triangle pose)" /></span>
				</div>
			</center>
				
				<p>This trikonasana stretches and strengthens the muscles along
					with improving the functions of our body. This is a good yoga
					exercise for pregnant women. It helps in reducing blood pressure,
					stress and anxiety and also improves the functions of the blood
					through the entire body. It improves our balance & concentration
					power. It also removes fats from waist and thighs</p>

				<li><h3>Dhanurasana (Bow Pose):</h3></li>
							<center>
				<div class="4u$">
					<span class="image fit"><img src="images/y6.jpg" alt="Dhanurasana (Bow Pose)" /></span>
				</div>
			</center>
				
				<p>Dhanurasana is very effective in weight loss program. this
					yoga pose helps in reducing the belly fat very easily. It
					strengthens the ankles, thighs, groins, chest and abdominal organs
					and spinal cord. This yoga posture improves the functions of
					kidney, pancreas, liver, small and big intestine. It also acts as a
					stress reliever and gives flexibility to the back. It improves the
					function of digestion and removes gases.</p>
			</ul>
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