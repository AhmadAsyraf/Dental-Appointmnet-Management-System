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
				<!-- Page Header -->
				<div class="page-header">
					<div class="row">
						<div class="col">
							<h3 class="page-title text-center">Dental Express</h3>
						</div>
					</div>
				</div>
				<!-- /Page Header -->
				<div class="row align-items-center justify-content-center">
					<div class="col-xl-6 col-sm-6 col-12 ">
						<div class="card card-table flex-fill">
							<div class="card-body">
								<h4 class="card-title">Login</h4>
								<br />
								<form action="LoginServlet" method="post" name="form"
									onsubmit="return validate()">
									<div class="form-group">
										<label for="exampleInputEmail1">Email</label> <input
											type="email" name="email" class="form-control"
											id="exampleInputEmail1" aria-describedby="emailHelp"
											placeholder="Enter email">
									</div>
									<div class="form-group">
										<label for="password">Password</label> <input type="password"
											name="password" class="form-control" id="password"
											placeholder="Enter Password">
									</div>
									<br />
									<button type="submit"
										class="btn btn-primary btn-block login-btn">Login</button>
									<span style="color: red"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></span>
								</form>
							</div>
						</div>
						<br />
						<div class="text-center dont-have">
							Don't have any account? <a href="register.jsp">Register</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>