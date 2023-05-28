<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.TempoEntities.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link href="css/successAlert.css" rel="stylesheet">
<link rel="stylesheet" href="css/Login.css" />
</head>

<body>
	<div class="container">
		<div class="login">Login</div>
		<%
		Message message = (Message) session.getAttribute("Message");
		if (message != null) {
		%>
		<div class="<%=message.getCssClass()%>"><%=message.getContent()%></div>
		<%
		session.removeAttribute("Message");
		}
		%>
		<form action="LoginServlet" method="post"
			enctype="multipart/form-data"
			onsubmit="contentType='false',processData='false'">
			<div class="info">
				<label for="username">Username</label> <input type="text"
					name="email" placeholder="Type Your Username" /> <br /> <label
					for="password">Password</label> <input type="password"
					name="password" placeholder="Type Your Password" />
			</div>
			<br />
			<div id="login1">
				<input type="submit" value="Login" name="Login" id="login" /> <br />
			</div>
			<div id="signup">Or Signin Using</div>
			<div class="link">
				<a href="https://www.facebook.com/"><img
					src="/firsthtml/facebook.jpeg" height="40px" /></a> <a
					href="https://twitter.com/"><img src="/firsthtml/twitter.jpeg"
					height="40px" /></a> <a
					href="https://accounts.google.com/signup/v2/webcreateaccount?flowName=GlifWebSignIn&flowEntry=SignUp"><img
					src="/firsthtml/google.jpeg" height="40px" /></a>
			</div>
		</form>
	</div>
</body>
</html>