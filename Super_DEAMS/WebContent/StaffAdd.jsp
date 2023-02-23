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
						<li class="breadcrumb-item"><a href="Staff.jsp">Staff</a></li>
						<li class="breadcrumb-item active" aria-current="page">Register Staff</li>
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
							<h4 class="card-title">Register New Staff</h4>
							<form action="StaffServlet" method="post">
								<div class="form-group">
									<label for="name">Name</label> <input type="text"
										class="form-control" id="name" name="name" placeholder="staff name">
								</div>
								<div class="form-group">
									<label for="address">Address</label> <input type="text"
										class="form-control" id="address" name="address"
										placeholder="staff address">
								</div>
								<div class="form-group">
									<label for="phoneNumber">Phone No.</label> <input
										type="text" class="form-control" id="phoneNumber"
										name="phoneNumber" placeholder="staff phone number">
								</div>
								<div class="form-group">
									<label for="mail">Email</label> <input type="text"
										class="form-control" id="mail" name="mail" placeholder="staff email">
								</div>
								<div class="form-group">
									<label for="pass">Password</label> <input type="text"
										class="form-control" id="pass" name="pass"
										placeholder="staff password">
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