<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Register Page</title>
<link href="css/successAlert.css" rel="stylesheet">
<link href="css/CustomerRegister,css.css" rel="stylesheet">
</head>
<body>
    <div class="info">
    <form id="reg-form" action="CustomerRegistrationServlet" enctype="multipart/form-data">
      <h2>Register</h2>
      <span for="name">First Name</span>
      <br />
      <input type="text" name="fName" placeholder="Enter Your first Name " />
      <br />
      <span for="last name">Last name</span>
      <br />
      <input type="text" name="LName" placeholder="Enter Your Last Name" />
      <br />
      <span for-="phone number">Phone Number</span>
      <br />
      <input type="text" name="phoneno" placeholder="Enter Your Phone Number" />
      <br />
      <span for="gender">Gender</span>
      <label for="id1">
        &nbsp;<input type="radio" value="male" name="gender" id="id1" />Male
      </label>
      <label for="id2">
        &nbsp;<input type="radio" value="female" name="gender" id="id2" />Female
      </label>
      <label for="id3">
        &nbsp;<input type="radio" value="other" name="gender" id="id3" />Others
      </label>
      <span for="email">Email</span>
      <br />
      <input type="text" name="email" placeholder="Enter Your Email" />
      <br />
      <span for="password">Password</span>
      <br />
      <input
        type="password"
        name="password1"
        placeholder="Enter Your Password"
      />
      <br />
      <span for="password">Confirm Password</span>
      <br />
      <input
        type="password"
        name="password2"
        placeholder="Confirm Your Password"
      /><br>
      <span for="profile">Upload your current profile picture :</span><br>
          <input type="file" name="profile" />
      <br />
      <div class="term">
        <label>
          <input type="checkbox" value="checked" name="check" />&nbsp I agree
        </label>
        
        <a
          href="https://ubar.om/terms-condition#:~:text=Terms%20%26%20Conditions%201%201.%20User%20is%20responsible,to%20determine%20your%20pickup%20point.%20...%20More%20items"
          >Terms and condition</a>
        <br /><br />
      </div>
      <div id="login1">
        <input type="submit" value="submit" name="Login" id="login" />
        <br />
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
				url:"CustomerRegistrationServlet",
				data : form,
				type : "post",
				
				success : function(data,textStatus,jqXHR){
					if(data.trim()=="done"){
					console.log(data);
					swal("Successfully registered!! Redirectring to profile page....").then ((value) =>{
						window.location="CustomerProfile.jsp"
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