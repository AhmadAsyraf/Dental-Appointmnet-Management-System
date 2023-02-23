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
						<li class="breadcrumb-item"><a href="Service.jsp">Service</a></li>
						<li class="breadcrumb-item active" aria-current="page">Create
							Service</li>
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
							<h4 class="card-title">Create New Service</h4>
							<form action="ServicesAdd" method="post">
								<div class="form-group">
									<label for="name">Name</label> <input type="text"
										class="form-control" id="name" name="name" placeholder="Service Name">
								</div>
								<div class="form-group">
									<label for="price">Price</label> <input type="text"
										class="form-control" id="price" name="price"
										placeholder="Service Price">
								</div>
								<button type="submit" class="btn btn-primary float-right">Create</button>
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