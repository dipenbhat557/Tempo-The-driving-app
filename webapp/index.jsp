<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="com.TempoEntities.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index Page</title>
<link href="css/successAlert.css" rel="stylesheet">
<link rel="stylesheet" href="css/index.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

</head>
<body>
	<header>
		<div class="left">
			<ul>
				<li class="logo"><a href="#">TEMPO</a></li>
				<li class="fonts"><a href="index.jsp">HOME</a></li>
				<li class="fonts"><a href="#besafe">SAFETY</a></li>
			</ul>
		</div>
		<div class="right">
			<ul>
				<div class="dropdown">
					<button class="dropbtn">PRODUCT</button>
					<div class="dropdown-content">
						<a href="#">Two wheelers</a> <a href="#">Four wheelers</a>
					</div>
				</div>
				<li><a href="Login.jsp">SIGN IN</a></li>
				<div class="dropdown1">
					<button class="dropbtn1">SIGN UP</button>
					<div class="dropdown-content1">
						<a href="DriverRegister.jsp">SIGN UP AS DRIVER</a> <a
							href="CustomerRegister.jsp">SIGN UP AS CUSTOMER</a>
					</div>
				</div>
			</ul>
		</div>
	</header>
		<%
		Message message = (Message) session.getAttribute("Message");
		if (message != null) {
		%>
		<div class="<%=message.getCssClass()%>"><%=message.getContent()%></div>
		<%
		session.removeAttribute("Message");
		}
		%>
	<section class="section1">
		<div class="section-right">
			<h1>
				"GET THE DRIVER SEAT<br />AT GET PAID"
			</h1>
			<button>
				SIGN UP <i class="fa-solid fa-arrow-right"></i>
			</button>
		</div>
	</section>

	<section class="section2">
		<div id="slideshow-container">
			<div class="experience">
				<h2>Our Customer Experiences</h2>
			</div>
			<div class="customers">
				<div class="grid1">
					<img src="img/profilepic.jpg" width="40px"
						style="border-radius: 50%" />
					<p>Avash Neupane1</p>
				</div>
				<div class="grid2">
					<p>" Lorem, ipsum dolor sit amet consectetur adipisicing elit.
						Pariatur, excepturi? Sequi, dignissimos autem? Provident, itaque."
					</p>
				</div>
			</div>
			<div class="customers">
				<div class="grid1">
					<img src="img/profilepic.jpg" width="40px"
						style="border-radius: 50%" />
					<p>Avash Neupane2</p>
				</div>
				<div class="grid2">
					<p>"Lorem, ipsum dolor sit amet consectetur adipisicing elit.
						Pariatur, excepturi? Sequi, dignissimos autem? Provident, itaque."
					</p>
				</div>
			</div>

			<div class="customers">
				<div class="grid1">
					<img src="img/profilepic.jpg" width="40px"
						style="border-radius: 50%" />
					<p>Avash Neupane3</p>
				</div>
				<div class="grid2">
					<p>"Lorem, ipsum dolor sit amet consectetur adipisicing elit.
						Pariatur, excepturi? Sequi, dignissimos autem? Provident, itaque."
					</p>
				</div>
			</div>
			<a class="prev" onclick="changeSlide(-1)">&#10094;</a> <a
				class="next" onclick="changeSlide(1)">&#10095;</a>
		</div>
	</section>
	<section class="section3">
		<div class="secthree">
			<div class="tempo">
				<h1>Tempo for business</h1>
			</div>
			<div class="boxes">
				<div class="box1">
					<img src="img/safepic5.webp.jpg" width="300px" />
					<p>
						"diber ma mailo moter chalaudai , herna herna maiya le kolai
						bolaudai , hajur lai<br /> ho ki guruji"
					</p>
				</div>
				<div class="box1">
					<img src="img/safepic6.webp" width="250px" height="277px" />
					<p>
						"diber ma mailo moter chalaudai , herna herna maiya le kolai
						bolaudai , hajur lai<br /> ho ki guruji"
					</p>
				</div>
			</div>
		</div>
	</section>
	<section class="section4" id="besafe">
		<div class="mainbox">
			<div class="rightbox">
				<h1>Our Commitment to your safety</h1>
				<h4>
					<br /> <br /> Hami helmet bina chaldainau , hami hero ho <br />
					Auna parcha hajur haru hamro taxi ma <br /> hamro driver haru
					johny sins jasta chainan , byavarik chan<br /> auni vaye aunus hai
					ta<br /> <br />
				</h4>
				<h5>
					<a href="#"> Read about community guidelines</a>
				</h5>
			</div>

			<div class="leftbox">
				<img src="img/oladiver.jpg" width="400px" height="350px" />
			</div>
		</div>
	</section>
	<section class="aboutus">
		<div class="aboutcontainer">
			<div class="rightabout">
				<h2>ABOUT US</h2>
				<p>
					Hami vaneko jain ka biyarthi haun, manchey thik cham<br /> barose
					mand cham , kei hola vanera tension na linu<br /> team ma euta
					dipen valu vanni chan jasle backend sackend herchan<br /> aru sab
					part time front end hun
				</p>
			</div>
			<div class="leftabout">
				<h4>
					<a href="#">HARILAL</a>
				</h4>
				<h4>
					<a href="#">SYAMLAL</a>
				</h4>
				<h4>
					<a href="#">MANIRAM</a>
				</h4>
			</div>
		</div>
	</section>


	<script src="index.jsp"></script>
</body>
</html>