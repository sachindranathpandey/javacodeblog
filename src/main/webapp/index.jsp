<!doctype html>
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
		.banner-backfound{
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
				</a>

				<a type="button" class="btn btn-success" href="login.jsp">
					<i class="fa fa-user-circle fa-spin"></i> Login
				</a>

			</div>


		</div>


	</div>


	<div class="container-fluid ">

		<!-- Card Body -->
		<div class="container mt-5 text-dark">
			<div class="row">
				<div class="col-sm">

					<div class="card" style="width: 18rem;">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn btn-info">Read More...</a>
						</div>
					</div>

				</div>
				<div class="col-sm">
					<div class="card" style="width: 18rem;">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn btn-info">Read More...</a>
						</div>
					</div>
				</div>
				<div class="col-sm">
					<div class="card" style="width: 18rem;">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn btn-info">Read More...</a>
						</div>
					</div>
				</div>
			</div>

			<!-- Card Body Ends Here -->


		</div>


		<div class="container mt-5 text-dark">
			<div class="row">
				<div class="col-sm">

					<div class="card" style="width: 18rem;">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn btn-info">Read More...</a>
						</div>
					</div>

				</div>
				<div class="col-sm">
					<div class="card" style="width: 18rem;">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn btn-info">Read More...</a>
						</div>
					</div>
				</div>
				<div class="col-sm">
					<div class="card" style="width: 18rem;">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn btn-info">Read More...</a>
						</div>
					</div>
				</div>
			</div>

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