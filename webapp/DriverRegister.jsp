<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.TempoEntities.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Driver Register Page</title>
<link href="css/DriverRegister.css" rel="stylesheet">
<link href="css/successAlert.css" rel="stylesheet">
</head>
<body>

	<div class="info">
		<form action="DriverRegistrationServlet" id="reg-form"
			enctype="multipart/form-data">
			<h2>Register</h2>
			<br>
			<br>
			<%
			Message message = (Message) session.getAttribute("Message");
			if (message != null) {
			%>
			<div class="<%=message.getCssClass()%>"><%=message.getContent()%></div>
			<%
			session.removeAttribute("Message");
			}
			%>
			<span for="name">First Name</span> <br /> <br>
			<input type="text" name="fName" placeholder="Enter Your first Name " />
			<br /> <br>
			<br>
			<span for="last name">Last name</span> <br>
			<br> <input type="text" name="lName"
				placeholder="Enter Your Last Name" /> <br />
			<br>
			<br> <span for-="phone number">Phone Number</span> <br>
			<br> <input type="text" name="phoneno"
				placeholder="Enter Your Phone Number" /> <br /> <br>
			<br>
			<span for="gender">Gender</span> <br>
			<br>
			<label for="id1"> &nbsp;<input type="radio" name="gender"
				value="male" id="id1" />Male
			</label> <label for="id2"> &nbsp;<input type="radio" name="gender"
				value="female" id="id2" />Female
			</label> <label for="id3"> &nbsp;<input type="radio" name="gender"
				value="other" id="id3" />Others
			</label><br>
			<br>
			<br> <span for="email">Email</span> <br>
			<br> <input type="text" name="email"
				placeholder="Enter Your Email" /> <br />
			<br>
			<br> <span for="password">Password</span> <br>
			<br>
			<input type="password" name="password1"
				placeholder="Enter Your Password" /> <br /> <br>
			<br>
			<span for="password">Confirm Password</span><br>
			<br> <input type="password" name="password2" name="password2"
				placeholder="Confirm Your Password" /> <br>
			<br>
			<br /> <span for="profile photo">Upload Profile Photo</span> <br>
			<br>
			<input type="file" name="profileName" id="profile photo"
				placeholder="Choose file" /><br>
			<br> <br /> <span for="lisence photo">Upload Lisence
				Photo</span> <br>
			<br>
			<input type="file" name="liscenceName" id="lisence photo"
				placeholder="Choose file" /> <br /> <br />
			<br>
			<div class="term">
				<label> <input type="checkbox" value="checked" name="check">&nbsp
					I agree
				</label> <a
					href="https://ubar.om/terms-condition#:~:text=Terms%20%26%20Conditions%201%201.%20User%20is%20responsible,to%20determine%20your%20pickup%20point.%20...%20More%20items">Terms
					and condition</a>
			</div>
			<br>
			<br>
			<div id="login1">
				<input type="submit" value="Sign Up" /> <br />     
			</div>
		</form>
		 
	</div>

	<script src="https://code.jquery.com/jquery-3.7.0.min.js"
		integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

	<script>
		$(document).ready(function() {
			console.log("Document is ready");
			$('#reg-form').on('submit',function(event){
				event.preventDefault();
			let form = new FormData(this);
			
			$.ajax({
				url:"DriverRegistrationServlet",
				data : form,
				type : "post",
				
				success : function(data,textStatus,jqXHR){
					if(data.trim()=="done"){
					console.log(data);
					swal("Redirecting to vehicle Registration Page....").then ((value) =>{
						window.location="VehicleRegistration.jsp"
					});
					}
					else{
						swal(data);
					}
				},
				error: function(jqXHR,textStatus,errorThrown){
					console.log(errorThrown);
				},
				processData:false,
				contentType:false
			});
		});
		});
	</script>

</body>
</html>