
<%@page import="com.tech.blog.entities.*"%>
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

<link href="css/test.css" rel="stylesheet">


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
	<main class="d-flex align-items-center banner-backfound  "
		style="height: 80vh">
		<div class="container ">
			<div class="row  ">
				<div class="col-md-4 offset-md-4 ">
					<div class="card ">
						<div class="card-header text-center bg-primary">
							<span class=" fa fa-user-plus"></span>
							<p>Login Here</p>
						</div>

						<%
						Message message = (Message) session.getAttribute("msg");
						if (message != null) {
						%>

						<div class=" alert <%=message.getCssClass()%> text-center"
							role="alert">
							<%=message.getContent()%>
						</div>

						<%
						session.removeAttribute("msg");
						}
						%>

						<div class="card-body">
							<form method="post" action="login" id="login_form">
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Email
										address</label> <input type="email" name="email" class="form-control"
										required="required" id="exampleInputEmail1"
										aria-describedby="emailHelp">
								</div>
								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Password</label>
									<input type="password" name="password" class="form-control"
										required="required" id="exampleInputPassword1">
								</div>

								<div class="text-center">
									<button type="submit" class="btn btn-primary" id="loginbtn">Submit</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

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