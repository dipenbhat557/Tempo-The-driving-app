<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.TempoEntities.*"%>
<%@page import="com.TempoDao.*"%>

<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("Login.jsp");
}
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> -->

<title>Driver Profile Page</title>
<link href="css/successAlert.css" rel="stylesheet">
<link rel="stylesheet" href="style.css" />
<script src="https://cdn.tailwindcss.com"></script>
<style>
.hidden {
	display: none;
}

/* .logo {
            font-size: 18px;
            background-color: white;
            color: rgb(12, 12, 12);
            font-family: sans-serif;
            font-size: 1.563rem;
            color: white;
            font-weight: 900;
        } */
body {
	background-image: url("img/map.jpg");
	overflow: hidden;
	width: 100%;
}
</style>


</head>

<body>




	<nav class="bg-black flex flex-row h-20 px-4 ">


		<div class="logo  ml-4 mt-4  ">
			<a href="#">
				<h1 class="text-3xl font-bold text-white">TEMPO</h1>
			</a>
		</div>

		<div
			class="hidden md:hidden lg:block  md:ml-5 lg:ml-6 lg:mt-3 w-auto  pt-1 text-xl rounded-md h-10 px-5  border border-black  text-white hover:bg-white hover:text-black transistion duration-500 ">
			<a href="#"> Home </a>
		</div>
		<div class="lists hidden md:hidden lg:block">
			<!-- sm:hidden md:hidden lg:block  md:ml-5 lg:ml-24 lg:mt-3 w-auto  pt-1 text-xl rounded-md h-10 px-5  border border-gray-600 bg-white text-black -->
			<div
				class=" sm:hidden md:hidden lg:block  md:ml-5 lg:ml-5 lg:mt-3 w-40 inline-block  pt-1 text-xl rounded-md h-10 px-5   border border-black  text-white hover:bg-white hover:text-black transistion duration-500 ">
				<a href="#"> Availability <input type="checkbox" class="pl-5">


				</a>



			</div>
		</div>
		<div class="lg:ml-96 flex flex-row">



			<!-- <div class=" lg:ml-96 lg:pt-5 md:ml-36 md:pt-5"> -->

			<div class="   md:block hidden px-14 mt-3">
				<button
					class="peer px-5 py-2 bg-gray-500 rounded-xl  hover:bg-gray-700 text-white">Help</button>


				<div
					class="peer  hidden peer-hover:flex hover:flex
         w-[200px]
         flex-col bg-slate-100 rounded-xl drop-shadow-black ">

					<a class="px-5 py-3 hover:bg-gray-200" href="#">Contact-us</a> <a
						class="px-5 py-3 hover:bg-gray-200" href="#">Chat With Us</a>
				</div>

			</div>


			<!-- </div> -->

			<div class=" justify--end  mt-3">
				<a href="#">
					<button id="modalTrigger">
						<img src="TempoPics/<%=user.getProfileName()%>" alt="sj"
							class="h-11 w-10 rounded-full  " id="">
					</button>

				</a>

			</div>
		</div>



	</nav>

	<%
	Message message = (Message) session.getAttribute("Message");
	if (message != null) {
	%>
	<div class="<%=message.getCssClass()%>"><%=message.getContent()%></div>
	<%
	session.removeAttribute("Message");
	}
	%>

	<section class="h-screen">
		<div
			class="card rounded-xl border bg-slate-100 opacity-75 hover:opacity-90  w-1/5 h-auto p-4  lg:w-1/2 mx-auto mt-8 shadow-2xl ">
			<div>
				<h1 class="text-3xl text-black font-bold">Requests</h1>
			</div>



			<div
				class="bg-slate-400 w-1/2 cursor-pointer mx-36 border  my-5 rounded-xl   opacity-100 flex flex-col h-auto  ">
				<input type="text" placeholder="Current Location"
					class="border  text-black my-2 rounded-lg w-2/3 mx-7 px-8">
				<input type="text" placeholder="Destination"
					class="border  my-2 rounded-lg w-2/3 mx-7 px-8 text-black">
				<input type="text" placeholder="Rate$"
					class="border  my-2 rounded-lg w-1/3 h-1/3 mx-7 px-8"> <span
					class="mr-0 text-black">
					<button class="bg-black text-white h-auto rounded-lg ml-2 px-10">Accept</button>
				</span>
			</div>

			<!-- <div class="bg-slate-400 h-48 w-auto border border-gray-800 my-5 rounded-xl flex flex-col px-10">
                <input type="text" placeholder="Enter pickpoint">
                <input type="text" placeholder="Enter destination">
            </div> -->
			<div
				class="bg-slate-400 w-1/2 mx-36 border  my-5 opacity-100 rounded-xl flex flex-col h-auto  cursor-pointer">
				<input type="text" placeholder="Current Location"
					class="border  my-2 rounded-lg w-2/3 mx-7 px-8"> <input
					type="text" placeholder="Dsestination"
					class="border  my-2 rounded-lg w-2/3 mx-7 px-8"> <input
					type="text" placeholder="Rate$"
					class="border  my-2 rounded-lg w-1/3 h-1/3 mx-7 px-8"> <span
					class="mr-0">
					<button class="bg-black text-white h-auto rounded-lg ml-2 px-10">Accept</button>
				</span>
			</div>

		</div>





		</div>
		<!-- Modal Trigger -->
		<!-- Modal Trigger -->


		<!-- Modal -->
		<div id="myModal" class="fixed z-10 inset-0 overflow-y-auto hidden">
			<div class="flex items-center justify-center min-h-screen px-4">
				<div class="fixed inset-0 transition-opacity" aria-hidden="true">
					<div class="absolute inset-0 bg-gray-500 opacity-75"></div>
				</div>

				<div
					class="bg-white rounded-lg overflow-hidden shadow-xl transform transition-all sm:max-w-3xl sm:w-full">
					<!-- Modal content goes here -->
					<div class="p-4">
						<h2 class="text-xl font-bold">Log Out</h2>
						<!-- <p>This is the content of the modal.</p> -->
					</div>

					<div class="bg-gray-100 px-4 py-3 sm:flex sm:flex-row-reverse">
						<!-- <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
                            onclick="closeModal()">
                            Yes
                        </button> -->
						<button
							class="mt-3 sm:mt-0 sm:mr-4 bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4 rounded"
							onclick="closeModal()">No</button>
						<button
							class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
							><a href="LogoutServlet">Yes</a></button>
					</div>
				</div>
			</div>
		</div>


	</section>



</body>
<script>
	const modalTrigger = document.getElementById("modalTrigger");
	const modal = document.getElementById("myModal");

	modalTrigger.addEventListener("click", function() {
		modal.classList.remove("hidden");
	});

	function closeModal() {
		modal.classList.add("hidden");
	}
</script>


</body>
</html>