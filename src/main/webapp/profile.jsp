<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<%@ page import="com.tech.blog.entities.User"%>

<%@page errorPage="error.jsp"%>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/test.css" rel="stylesheet">

<title>Create Post</title>

</head>
<body>

	<%
	User user2 = (User) session.getAttribute("currentUser");

	if (user2 == null) {

		response.sendRedirect("login.jsp");
	}
	%>
<!-- Start of Nav Bar -->
	<nav class="navbar navbar-expand-lg navbar-dark  primary-background">
		<div class="container-fluid ">
			<span style="margin-right: 40px"><i
				class="fa fa-stack-overflow" style="font-size: 48px; color: red"></i></span>
			<a class="navbar-brand" href="index.jsp">JavaBlog</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">


					<li class="nav-item"><a class="nav-link active" href="#">Java
							8</a></li>


					<li class="nav-item dropdown"><a
						class="nav-link active dropdown-toggle" href="#"
						id="navbarDropdown" role="button" data-bs-toggle="dropdown"
						aria-expanded="false"> Categories </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Core Java</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">SpringBoot</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">MicrosServices</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Spring Security</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">AWS</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">KAFKA</a></li>
						</ul></li>



					<li>

						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#post-mpdel">
							<span class="fa fa-edit" style="color: #00FFFF"> Create
								Post</span>
						</button>
					</li>

				</ul>

				<ul class="navbar-nav mr-right">


					<li class="nav-item"><a class="nav-link active color-red"
						data-bs-toggle="modal" data-bs-target="#exampleModal" href="#">

							<li><img alt="profile" class="img-fluid"
								style="border-radius: 50%; max-width: 35px; max-height: 35px"
								src="pics/<%=user2.getProfile()%>"></li> <span> <%
 User user = (User) session.getAttribute("currentUser");
 %> <%=user.getName()%>

						</span>
					</a></li>
					<li class="nav-item"><a class="nav-link active color-red"
						href="logout"> <span class="fa fa-sign-out">Logout</span></a></li>
				</ul>

			</div>
		</div>
	</nav>





	<!-- End of Nav Bar -->
	<!-- Start left navigation -->
	<div class="container">

		<div class="row mt-4">

			<div class="col-md-4">
				<ul class="list-group"  id="myList">
					<a href=# class="list-group-item list-group-item-action active" onclick="getPosts(<%= 0%>)" >All Posts</a>

					<%
					
					PostDao dao = new PostDao(ConnectionProvider.getConnection());
					ArrayList<Category> cat = dao.getAllCategories();

					for (Category c : cat) {
					%>
						
						<a href=#  onclick="getPosts(<%=c.getCid()%>)" class="list-group-item list-group-item-action"><%=c.getName()%></a>
						
					<%
					}
					%>
					

				</ul>
			</div>
			<div class="col-md-8" >
			
				<div class="container text-center" id="loader">
					<i class=" fa fa-refresh fa-4x fa-spin"></i>
					<h4 class="margin-top:3px">Loading...</h4>
				</div>
				
				<div class="fluid-container" id="post-container">
					
				</div>
			</div>
		</div>

	</div>
	<!-- Start Right navigation -->
	<!-- ----------------------------------------------------------------------->


	<!-- Start Post Model Here -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content ">
				<div class="modal-header primary-background text-white text-center">
					<h5 class="modal-title" id="exampleModalLabel">Java Blog</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<div class="container text-center">
						<img alt="profile" class="img-fluid"
							style="border-radius: 50%; max-width: 150px"
							src="pics/<%=user.getProfile()%>">
						<h5 class="modal-title" id="exampleModalLabel"><%=user.getName()%></h5>
					</div>

					<table class="table" id="profile_model">
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col"></th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">ID</th>
								<td><%=user.getId()%></td>

							</tr>
							<tr>
								<th scope="row">Email</th>
								<td><%=user.getEmail()%></td>

							</tr>
							<tr>
								<th scope="row">Gender</th>
								<td colspan="2"><%=user.getGender()%></td>

							</tr>
							<tr>
								<th scope="row">About</th>
								<td colspan="2"><%=user.getAbout()%></td>

							</tr>

							<tr>
								<th scope="row">Registered On</th>
								<td colspan="2"><%=user.getDateTime()%></td>

							</tr>
						</tbody>
					</table>


					<!-- Edit Table start here -->

					<div style="display: none;" id="editable_table">
						<br>
						<h6 class="text-center" style="color: red">Edit Carefully</h6>
						<form action="editservlet" method="post"
							enctype="multipart/form-data">
							<table class="table" id="profile_model">

								<thead>
									<tr>
										<th scope="col"></th>
										<th scope="col"></th>

									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">ID</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Name</th>
										<td><input type="text" value="<%=user.getName()%>"
											name="name	"></td>

									</tr>
									<tr>
										<th scope="row">Email</th>
										<td><input type="text" value="<%=user.getEmail()%>"
											name="email"></td>

									</tr>

									<tr>
										<th scope="row">Password</th>
										<td><input type="text" value="<%=user.getPassword()%>"
											name="password"></td>

									</tr>
									<tr>
										<th scope="row">Gender</th>
										<td colspan="2"><input type="text"
											value="<%=user.getGender()%>" name="gender"></td>

									</tr>
									<tr>
										<th scope="row">About</th>
										<td colspan="2"><textarea rows="5" cols=""
												class="form-control" name="about"><%=user.getAbout()%></textarea>
										</td>

									</tr>

									<tr>
										<th scope="row">Profile Photo</th>
										<td colspan="2"><input type="file" name="image"
											class="form-control"></td>

									</tr>

									<tr>
										<th scope="row">Registered On</th>
										<td colspan="2"><%=user.getDateTime()%></td>

									</tr>


								</tbody>
							</table>
							<div class="container text-center">
								<input type="submit" class="btn btn-outline-primary"
									value="Save" class="text-center" />
							</div>
						</form>
					</div>
					<!-- Edit table ends here -->

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="edit_button">Edit</button>
				</div>
			</div>
		</div>
	</div>


	<!-- End Edit Table -->

	<!-- Start Post Model Here -->
	<div class="modal fade" id="post-mpdel" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title " id="exampleModalLabel">Write Post</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form method="post" action="UploadServlet" id="add-post-form"
						enctype="multipart/form-data">


						<div class="form-group">

							<select class="form-control" name="cid">
								<option value="" selected disabled>--Select Category--</option>
								<%
								PostDao dao2 = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> cat2 = dao2.getAllCategories();

								for (Category c : cat2) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>
								<%
								}
								%>

							</select>
						</div>
						<br>
						<div class="form-group">
							<input type="text" placeholder="Enter Titel" class="form-control"
								name="ptitle">
						</div>

						<br>
						<div class="form-group">
							<textarea style="height: 120px" placeholder="Write your content"
								class="form-control" name="pcontent"></textarea>
						</div>

						<br>
						<div class="form-group">
							<textarea style="height: 150px"
								placeholder="{Enter Your Code Here}" class="form-control"
								name="pcode"></textarea>
						</div>
						<br>
						<div class="form-group">

							<span>Choose Image</span>&nbsp <input type="file" name="file"
								class="form-control">
						</div>
						<br>
						<div class="container text-center">
							<button type="submit" class="btn btn-outline-success"
								id="uploadButton">Save</button>
						</div>
					</form>

				</div>

			</div>
		</div>
	</div>
	<!-- End Post Model Here -->

	<script>
		var flag = true;
		$(document).ready(function() {
			$("#edit_button").click(function() {

				if (flag == true) {
					$("#profile_model").hide();
					$("#editable_table").show();
					$("#edit_button").html("	Back");

					flag = false;
				} else {
					$("#profile_model").show();
					$("#editable_table").hide();
					$("#edit_button").html("Edit");
					flag = true;
				}

			})
		});
	</script>



	<!-- insert post script -->


	<!-- end insert post script -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>



	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js">
		
	</script>


	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


	<script>
		$(document).ready(function(e) {

			$("#add-post-form").on("submit", function(event) {

				// this code gets called when form is submitted

				event.preventDefault();

				let form = new FormData(this);

				//console.log(form);
				// Now requestiong to server
				$.ajax({
					url : "UploadServlet",
					type : 'POST',
					data : form,
					success : function(data, textStatus, jqXHR) {
						// success
						console.log("data is " + data);

						if (data.trim() == 'success') {
							Swal.fire({
								title : "Good job!",
								text : "Your Post is successfully saved",
								icon : "success"
							});
						} else if (data.trim() == 'selectoption') {
							Swal.fire({
								icon : "error",
								title : "Oops...",
								text : "You did not select category option",

							});
						} else {
							Swal.fire({
								icon : "error",
								title : "Oops...",
								text : "Faileds",

							});
						}

					},

					error : function(jqXHR, textStatus, errorThrown) {
						// error
						console.log("failed")
					},

					processData : false,
					contentType : false
				})

			})

		});
	</script>
	
	
	<!-- Script for load posts -->
	<script>
	
	function getPosts(catId) {
		$("#loader").show();
		$("#post-container").hide();
		$.ajax({
			
			url:"load_posts.jsp",
			data:{cid:catId},
		    success : function(data, textStatus, jqXHR){
			$("#loader").hide();
			$("#post-container").show();
			$("#post-container").html(data);
		},
		})
		
	}
		$(document).ready(function(e){
			
			getPosts(0);
		});
	
	</script>
	<!-- End of Script for load posts -->
	
	<!-- Make link active -->
	
	
	
	<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {
	    var links = document.querySelectorAll("#myList a");

	    links.forEach(function(link) {
	        link.addEventListener("click", function(event) {
	            event.preventDefault(); // Prevent the default action of the link
	            var activeLink = document.querySelector("#myList a.active");
	            if (activeLink) {
	                activeLink.classList.remove("active"); // Remove active class from previously active link
	            }
	            link.classList.add("active"); // Add active class to the clicked link
	        });
	    });
	});
	</script>

</body>
</html>
