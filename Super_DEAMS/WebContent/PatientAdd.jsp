<jsp:include page="header.jsp"></jsp:include>
<br>
<!-- Breadcrumb -->
<div class="breadcrumb-bar">
	<div class="container-fluid">
		<div class="row align-items-center">
			<div class="col-md-12 col-12">
				<nav aria-label="breadcrumb" class="page-breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="dashboard.jsp">Home</a></li>
						<li class="breadcrumb-item"><a href="Patient.jsp">Patient</a></li>
						<li class="breadcrumb-item active" aria-current="page">Register
							Patient</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<!-- /Breadcrumb -->
<div class="content">
	<div class="container-fluid">
		<!-- Page Wrapper -->
		<div class="page-wrapper">
			<div class="content container-fluid">
				<div class="row">
					<div class="card card-table flex-fill">
						<div class="card-body">
							<h4 class="card-title">Register New Patient</h4>
							<form action="PatientServlet" method="post">
								<div class="form-group">
									<label for="name">Name</label> <input type="text"
										class="form-control" id="name" name="name" placeholder="Patient Name">
								</div>
								<div class="form-group">
									<label for="age">Age</label> <input type="text"
										class="form-control" id="age" name="age" placeholder="Patient Age">
								</div>
								<div class="form-group">
									<label for="manufacturer">Gender</label> <input type="text"
										class="form-control" id="gender" name="gender"
										placeholder="Patient Gender">
								</div>
								<div class="form-group">
									<label for="phoneNumber">Phone Number</label> <input
										type="text" class="form-control" id="phoneNumber"
										name="phoneNumber" placeholder="Patient Phone Number">
								</div>
								<div class="form-group">
									<label for="password">Email</label> <input type="text"
										class="form-control" id="email" name="email"
										placeholder="Patient Email">
								</div>
								<div class="form-group">
									<label for="password">Password</label> <input type="text"
										class="form-control" id="password" name="password"
										placeholder="Patient Password">
								</div>
								<button type="submit" class="btn btn-primary float-right">Register</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<br>
<jsp:include page="footer.jsp"></jsp:include>