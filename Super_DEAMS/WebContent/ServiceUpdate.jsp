<%@ page import="com.mvc.bean.ServiceBean"%>
<%@ page import="com.mvc.controller.ServiceServletUpdate"%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:useBean id="ServiceEngine" scope="application"
	class="com.mvc.engine.ServiceEngine" />
<jsp:useBean id="ServiceBean" scope="application"
	class="com.mvc.bean.ServiceBean" />
<%
	int id = Integer.parseInt(request.getParameter("id"));
	ServiceBean services = ServiceEngine.getServicesById(id);
%>
<br />
<!-- Breadcrumb -->
<div class="breadcrumb-bar">
	<div class="container-fluid">
		<div class="row align-items-center">
			<div class="col-md-12 col-12">
				<nav aria-label="breadcrumb" class="page-breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="dashboard.jsp">Home</a></li>
						<li class="breadcrumb-item"><a href="Service.jsp">Service</a></li>
						<li class="breadcrumb-item active" aria-current="page">Update
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
							<h4 class="card-title">Update Service Details</h4>
							<form action="ServicesUpdate" method="post">
								<div class="form-group">
									<label for="name">Name</label> <input type="text"
										class="form-control" id="name" name="name"
										value="<%=services.getServiceName()%>">
								</div>
								<div class="form-group">
									<label for="price">Price</label> <input type="text"
										class="form-control" id="price" name="price"
										value="<%=services.getServicePrice()%>">
								</div>
								<input type="hidden" name="id"
									value="<%=services.getServiceID()%>"> <input
									type="submit" class="btn btn-primary float-right" value="Update">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>