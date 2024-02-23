<!doctype html>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.*"%>
<%@page import="java.util.*"%>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

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

<style type="text/css">
.banner-backfound {
	clip-path: polygon(50% 0%, 100% 0, 100% 86%, 75% 100%, 23% 92%, 0 100%, 0 0);
	background-image: url("images/bghead1.jpg");
	background-repeat: no-repeat;
	background-size: 100%;
}
</style>
</head>
<body>
	<%@ include file="normal_navbar.jsp"%>

	<div class="container-fluid banner-backfound">
		<div class=" p-5  text-dark rounded">
			<h1 class="text-center">Welcome to Java Blog</h1>
			<p>Welcome to our Java tech blogging website, where the world of
				Java programming unfolds in all its brilliance and complexity.
				Whether you're a seasoned developer or just starting your journey
				into the realm of coding, our platform offers a wealth of resources
				to help you navigate the Java landscape with confidence and finesse.

				From fundamental concepts like variables, loops, and data types to
				advanced topics such as multithreading, networking, and Java EE
				development, our blog covers it all. Our team of experienced Java
				enthusiasts and experts is dedicated to bringing you insightful
				articles, tutorials, and tips that cater to every skill level. Stay
				updated with the latest trends, tools, and best practices in Java
				development. Our blog also features real-world examples, case
				studies, and practical projects to help you apply your newfound
				knowledge in meaningful ways. Whether you're interested in web
				development, mobile app development, or enterprise solutions, our
				Java blog has something for everyone. So why wait? Dive into our
				treasure trove of Java wisdom and take your coding skills to new
				heights.</p>

			<div class="text-center">

				<a type="button" class="btn btn-warning center" href="signup.jsp">

					<i class="fa fa-plus-circle"></i> Start..its Free
				</a> <a type="button" class="btn btn-success" href="login.jsp"> <i
					class="fa fa-user-circle fa-spin"></i> Login
				</a>

			</div>


		</div>


	</div>

	<%
	PostDao dao = new PostDao(ConnectionProvider.getConnection());
	List<Post> list = dao.getAllPosts();
	%>

	<div class="container-fluid ">

		<!-- Card Body -->
		<div class="row">

			<%
			for (Post p : list) {
			%>
			<div class="col-lg-4 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="" alt="">
					<div class="card-body">
						
						<h4 class="card-title"> <%= p.getPtitle() %></h4>
						<div>
							<h6 class="text-primary">Written By: <%=dao.getUserNameByID(p.getUserId()) %> </h6>
							<i class="text-primary">Date: <%=p.getPdate() %>  </i>
						</div>
						<p class="card-text"><%=p.getPcontent() %></p>
						<a href="login.jsp" class="btn btn-outline-dark text-primary btn-sm">Read more...</a>
					</div>
					
				</div>
			</div>

			<%
			}
			%>


			<!-- Card Body Ends Here -->


		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script src='https://kit.fontawesome.com/a076d05399.js'
		crossorigin='anonymous'></script>




	<script src="js/myjs.js"></script>
</body>
</html>