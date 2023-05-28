<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.TempoEntities.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vehicle Registration Page</title>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        .harilal {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        body {
            background-color: #D9D9D9;
        }

        .first {
            border: 1px solid wheat;
            width: 50%;
            margin: auto;
            width: 50%;

            padding: 10px;


            box-shadow: 5px 5px;
            background-color: black;
            color: aliceblue;
            border-radius: 18px;


        }
    </style>
</head>

<body>
    <div class="first mt-5">
    <form action="VehicleServlet" enctype="multipart/form-data" method="post">
        <div>
            <h1 class="text-center"><strong>Vehicle Info</strong></h1>
        </div>
        <%
			Message message = (Message) session.getAttribute("Message");
			if (message != null) {
			%>
			<div class="<%=message.getCssClass()%>"><%=message.getContent()%></div>
			<%
			session.removeAttribute("Message");
			}
			%>
        <div class="container">
            <strong> Select vehicle type</strong>

            <div class="form-check">
                <input class="form-check-input" type="radio" name="vType" id="twoWheeler" value="twoWheeler">
                <label class="form-check-label" for="twoWheeler">
                    Two wheeler
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="vType" id="fourWheeler" value="fourWheeler" >
                <label class="form-check-label" for="fourWheeler">
                    Four wheeler
                </label>
            </div>

            <div class="input-group mt-4"><strong>Enter your vehicle model:</strong>
                <input type="text" name="vModel" class="form-control bg-dark text-white" placeholder="Vehicle model">
            </div>
            <div class="input-group mt-4"><strong>Enter your vehicle number plate:</strong>
                <input type="text" class="form-control bg-dark text-white" name="vPlate" placeholder="Number plate">
            </div>
            <div class="mb-3 mt-4">
                <label for="formFile" class="form-label"><strong>
                        Vehicle photo
                    </strong></label>
                <input class="form-control bg-dark text-white" type="file" name="vPhoto" id="formFile">
            </div>
            <div class="harilal">
                <button type="submit" class="btn btn-dark ">Done</button>
            </div>
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
				url:"VehicleServlet",
				data : form,
				type : "post",
				
				success : function(data,textStatus,jqXHR){
					console.log(data);
					if(data.trim()=="done"){
						swal("Registered Suceessfully!! Redirection to profile Page....") .then ((value)=>{
						window.location="DriverProfile.jsp"
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