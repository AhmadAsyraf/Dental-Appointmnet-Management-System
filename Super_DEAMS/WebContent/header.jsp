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
<script defer
	src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	integrity="sha384-rOA1PnstxnOBLzCLMcre8ybwbTmemjzdNlILg8O7z1lUkLXozs4DHonlDtnE7fpc"
	crossorigin="anonymous"></script>
<!-- Modal -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- Data Table -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
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

	$(document).ready(function() {
		$('#example').DataTable();
	});
</script>
</head>
<body class="bg-light">

	<nav class="navbar navbar-expand-lg navbar-dark bg-info text-white">
		<a class="navbar-brand">DentalExpressAMS</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">

				<%
					if (session.getAttribute("status") != null) {
						if (session.getAttribute("role").equals("admin")) {
				%>
				<li class="nav-item"><a class="nav-link" href="dashboard.jsp">Dashboard</a></li>
				<li class="nav-item"><a class="nav-link" href="Staff.jsp">Staff</a></li>
				<li class="nav-item"><a class="nav-link" href="Patient.jsp">Patient</a></li>

				<%
					} else if (session.getAttribute("role").equals("patient")) {
				%>
				<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
				<%
					}
					}
				%>
				<li class="nav-item"><a class="nav-link" href="Appointment.jsp">Appointment</a></li>
				<li class="nav-item"><a class="nav-link" href="Service.jsp">Services</a></li>
				<li class="nav-item"><a class="nav-link" href="Profile.jsp">Profile</a></li>
			</ul>
			<ul class="navbar-nav navbar-right">
				<%
					if (session.getAttribute("status") != null) {
						if (session.getAttribute("status").equals("loggedin")) {
							if (session.getAttribute("role").equals("patient")){
				%>
				<li class="nav-item"><a class="nav-link" href="AppointmentAdd.jsp"><button
							type="submit" class="btn btn-warning btn-sm">Make
							Appointment</button></a></li>
				<% } %>
				<li class="nav-item"><a class="nav-link" href="logout.jsp"><button
							type="submit" class="btn btn-danger btn-sm">Log Out</button></a></li>
				<%
					}
					} else {
				%>
				<li class="nav-item"><a class="nav-link" href="login.jsp"><button
							type="submit" class="btn btn-danger btn-sm">Login</button></a></li>
				<%
					}
				%>
			</ul>
		</div>
	</nav>

	<div class="container">
		<%
			if (session.getAttribute("success") != null) {
		%>
		<div class="alert alert-success alert-dismissible fade show"
			role="alert">
			<%=session.getAttribute("success")%>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<%
			session.removeAttribute("success");
			}
		%>

		<%
			if (session.getAttribute("danger") != null) {
		%>
		<div class="alert alert-danger alert-dismissible fade show"
			role="alert">
			<%=session.getAttribute("danger")%>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<%
			session.removeAttribute("danger");
			}
		%>