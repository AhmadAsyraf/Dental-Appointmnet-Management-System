<%@ page import="com.mvc.controller.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Dental Express</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<script>
	function validate() {
		var email = document.form.email.value;
		var password = document.form.password.value;

		if (email == null || email == "") {
			alert("Email cannot be blank");
			return false;
		} else if (password == null || password == "") {
			alert("Password cannot be blank");
			return false;
		}
	}
</script>
</head>
<body class="bg-light">
	<div class="container">
		<br />
		<!-- Page Wrapper -->
		<div class="page-wrapper">
			<div class="content container-fluid">
				<div class="row align-items-center justify-content-center">
					<div class="col-xl-6 col-sm-6 col-12 ">
						<div class="card card-table flex-fill">
							<div class="card-body">
								<h4 class="card-title">Patient Register</h4>
								<br />
								<form action="RegisterServlet" method="post">
									<div class="form-group">
										<label for="name">Name</label> <input type="text"
											class="form-control" id="name" name="name"
											placeholder="Your Name">
									</div>
									<div class="form-group row">
										<div class="col">
										<label for="age">Age</label> <input type="text"
											class="form-control" id="age" name="age" placeholder="Age">
										</div>
										<div class="col">
										<label for="manufacturer">Gender</label> <input type="text"
											class="form-control" id="gender" name="gender"
											placeholder="Gender">
										</div>
									</div>
									<div class="form-group">
										
									</div>
									<div class="form-group">
										<label for="phoneNumber">Phone Number</label> <input
											type="text" class="form-control" id="phoneNumber"
											name="phoneNumber" placeholder="Phone Number">
									</div>
									<div class="form-group">
										<label for="email">Email</label> <input type="text"
											class="form-control" id="email" name="email"
											placeholder="Email">
									</div>
									<div class="form-group">
										<label for="password">Password</label> <input type="text"
											class="form-control" id="password" name="password"
											placeholder="Create Password">
									</div>
									<br />
									<button type="submit" class="btn btn-block btn-primary">Create
										Account</button>
								</form>
							</div>
						</div>
						<br />
						<div class="text-center dont-have">
							<a class="text-center" href="login.jsp">Already have an
								account?</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>