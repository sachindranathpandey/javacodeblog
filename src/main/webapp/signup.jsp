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
	clip-path: polygon(0 0, 100% 0, 100% 92%, 75% 100%, 21% 95%, 0 99%);
	background-image: url("images/bghead1.jpg");
	background-repeat: no-repeat;
	background-size: 100%;
}
</style>
</head>
<body>
	<%@ include file="normal_navbar.jsp"%>
	<main class="d-flex align-items-center banner-backfound  "
		style="height: 100vh">
		<div class="container pt-3">
			<div class="row  ">
				<div class="col-md-4 offset-md-4 ">
					<div class="card ">
						<div class="card-header text-center bg-primary">
							<span class=" fa fa-user-plus"></span>
							<p>Signup Here</p>
						</div>
						<div class="card-body">
							<form  id="reg_form" action="register" method="post" >

								<div class="mb-3">
									
									<input type="text" class="form-control" id="exampleInputName" placeholder="Name" name="name"
										aria-describedby="emailHelp">

								</div>
								<div class="mb-3">
									<input type="email" class="form-control" name="email"
										id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Email">
									<div id="emailHelp" class="form-text">We'll never share
										your email with anyone else.</div>
								</div>	
								<div class="mb-3">
									
									<input type="password" class="form-control" name="password"
										id="exampleInputPassword1" placeholder="Password">
								</div>
								<div>
									
									Gender &nbsp
									<input type="radio" name="gender" value="Male" required="required">Male &nbsp &nbsp
              						<input type="radio" name="gender" value="Female" required="required">Female
									
								</div>
								 &nbsp
								<div>
								 <textarea name="about"  name="about"  id="about" cols="40" rows="3" placeholder="Write something about yourself"></textarea>
								</div>
								<div class="mb-3 form-check">
									<input type="checkbox" name="check"  class="form-check-input"
										id="exampleCheck1" > <label class="form-check-label"
										for="exampleCheck1">Terms & Condition</label>
								</div>
								<div class="container text-center mb-2"  id="loader"  style="color:green; display:none">
									
								 <i class="fa fa-refresh fa-spin" style="font-size:24px"></i>
								 <p>Please wait...</p>
								</div>
								<div class="text-center">
									<button type="submit"   id="submit-btn"  class="btn btn-primary">Submit</button>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script src="js/myjs.js"></script>
	
	<script type="text/javascript">
    var frm = $('#reg_form');
    $("#loader").hide();
    $("#submit_btn").show();
    frm.submit(function (e) {

        e.preventDefault();
        
        
        $("#submit-btn").hide();
        $("#loader").show();

        $.ajax({
            type: frm.attr('method'),
            url: frm.attr('action'),
            data: frm.serialize(),
            success: function (data) {
             
                $("#submit-btn").show();
            	$("#loader").hide();
            	if(data.trim()=='success'){
            		
            		
            		
            		Swal.fire({
              	  	position: "center",
              		icon: "success",
              		title: "Registered successfully...Redirecting to login page",
              		showConfirmButton: false,
              		timer: 2000
					
              		}).then(function() {
              		    window.location = "login.jsp";
              		});
            	}else if(data.trim()=="terms"){
            		
            		Swal.fire({
              		  icon: "error",
              		  title: "Oops...",
              		  text: "Please check t&c",
              		  
              		});
            	}else if(data.trim()=="already_registered"){
            		
            		Swal.fire({
              		  icon: "error",
              		  title: "Oops...",
              		  text: "This email is already registered",
              		  
              		});
            	}else{
            		Swal.fire({
                		  icon: "error",
                		  title: "Oops...",
                		  text: "Opps! Registration Faild",
                		  
                		});
            	}
            	
               
            },
            error: function (data) {
            	console.log(data);
                $("#submit-btn").show();
            	$("#loader").hide();
            	
                
            },
            
           
        });
        
        
    });
    
   
</script>
</body>
</html>