<%@ page import="com.mvc.bean.StaffBean"%>
<%@ page import="com.mvc.controller.StaffServletUpdate"%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:useBean id="StaffEngine" scope="application"
	class="com.mvc.engine.StaffEngine" />
<jsp:useBean id="StaffBean" scope="application"
	class="com.mvc.bean.StaffBean" />

<%
	int id = Integer.parseInt(request.getParameter("id"));
	StaffBean staff = StaffEngine.getStaffById(id);
%>

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
						<li class="breadcrumb-item active" aria-current="page">Update Staff</li>
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
							<h4 class="card-title">Update Staff Details</h4>
							<form action="StaffServletUpdate" method="post">
								<div class="form-group">
									<label for="name">Name</label> <input type="text"
										class="form-control" id="name" name="name"
										value="<%=staff.getStaffName()%>">
								</div>
								<div class="form-group">
									<label for="address">Address</label> <input type="text"
										class="form-control" id="address" name="address"
										value="<%=staff.getStaffAddress()%>">
								</div>
								<div class="form-group">
									<label for="phone">Phone No.</label> <input type="text"
										class="form-control" id="phone" name="phone"
										value="<%=staff.getStaffPhone()%>">
								</div>
								<div class="form-group">
									<label for="mail">Email</label> <input type="text"
										class="form-control" id="mail" name="mail"
										value="<%=staff.getStaffMail()%>">
								</div>
								<div class="form-group">
									<label for="pass">Password</label> <input type="text"
										class="form-control" id="pass" name="pass"
										value="<%=staff.getStaffPass()%>">
								</div>
								<input type="hidden" name="id" value="<%=staff.getStaffID()%>">
								<input type="submit" class="btn btn-primary float-right" value="Update">
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
