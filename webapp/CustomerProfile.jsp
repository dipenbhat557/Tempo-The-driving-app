<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.TempoEntities.*" %>
	<%@page import="com.TempoDao.*" %>
	
	<%
	User user = (User) session.getAttribute("currentUser");
	if(user==null){
		response.sendRedirect("Login.jsp");
	}
	
	
	%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Customer Profile Page</title>
<link href="css/successAlert.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css"
	integrity="sha384-b6lVK+yci+bfDmaY1u0zE8YYJt0TZxLEAFyYSLHId4xoVvsrQu3INevFKo+Xir8e"
	crossorigin="anonymous">
<!--Link for bootstrap icon-->
<style>
body {
	background-image:
		url("https://www.google.com/maps/d/thumbnail?mid=1sGvcKzz4h2-P2RqJUM3Ri7fPzCk&hl=en");
	width: 100%;
}

#home {
	color: white;
	font-family: sans-serif;
}

#home:hover {
	font-size: 18px;
	background-color: white;
	color: rgb(12, 12, 12) !important;
}

nav {
	background-color: black;
}

#logo {
	font-family: sans-serif;
	font-size: 1.563rem;
	color: white;
	font-weight: 900;
}

#burger {
	background-color: white !important;
}

.form {
	opacity: 0.8;
}

.form:hover {
	opacity: 1 !important;
}
</style>
</head>

<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" id="logo"> TEMPO </a>
			<button class="navbar-toggler ms-auto" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarScroll">
				<span class="navbar-toggler-icon" id="burger"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarScroll">
				<ul class="navbar-nav me-auto my-2 my-lg-0">
					<li class="nav-item"><a class="nav-link me-2" id="home"
						href="#">HOME</a></li>
				</ul>
				<div class="dropdown">
					<button type="button" class="btn btn-dark dropdown-toggle"
						data-bs-toggle="dropdown">HELP</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">Contact Us</a></li>
						<li><a class="dropdown-item" href="#">Chat With Us</a></li>
					</ul>
				</div>
				<button class="btn btn-lg" data-bs-toggle="modal"
					data-bs-target="#logout">
					<a class="navbar-brand" style="margin-left: 3%;" href="#"> <img
						src="https://randomuser.me/api/portraits/women/25.jpg" alt="Logo"
						style="width: 44px" class="rounded-circle">
					</a>
				</button>
			</div>
		</div>
	</nav>


<%
Message message = (Message)session.getAttribute("Message");
if(message != null){
	%>
	<div class="<%= message.getCssClass()%>"><%=message.getContent() %></div>
	<% 
	session.removeAttribute("Message");
}
%>


	<div class="container">
		<div class="row">
			<div class="col-4 f1">
				<Section class="form">
					<div class="card"
						style="width: 18rem; margin-top: 9%; margin-left: 2%; padding-bottom: 5%; padding-top: 4%;">
						<div class="card-body">
							<h3 class="card-text">
								<strong>Where can we pick you up?</strong>
							</h3>
							<input class="form-control mt-3" type="text"
								placeholder="Add your current location"
								aria-label="default input example"> <input
								class="form-control mt-3" type="text"
								placeholder="Add your Destination"
								aria-label="default input example">
							<button type="button" class="btn btn-secondary mt-3"
								style="margin-left: 70%;">Request</button>
						</div>
					</div>
				</Section>
			</div>
		</div>
	</div>



	<!--Modal-->
	<section>

		<div class="modal fade" id="logout" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">
							LOG OUT<i class="bi bi-box-arrow-left mx-1"></i>
						</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							data-bs-dismiss="modal">
							<a href="LogoutServlet" class="nav-link">YES</a>
						</button>
						<button type="button" class="btn btn-secondary">
							<a class="nav-link" href="CustomerProfile.jsp">NO</a>
						</button>
					</div>
				</div>
			</div>
		</div>

	</section>


</body>
</html>