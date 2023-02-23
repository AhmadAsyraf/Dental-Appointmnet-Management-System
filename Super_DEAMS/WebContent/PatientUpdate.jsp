<%@ page import="com.mvc.bean.PatientBean"%>
<%@ page import="com.mvc.controller.PatientServletUpdate"%>

<jsp:include page="header.jsp"></jsp:include>

<jsp:useBean id="PatientEngine" scope="application"
	class="com.mvc.engine.PatientEngine" />

<jsp:useBean id="PatientBean" scope="application"
	class="com.mvc.bean.PatientBean" />

<%
	int id = Integer.parseInt(request.getParameter("id"));
	PatientBean patient = PatientEngine.getPatientById(id);
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
						<li class="breadcrumb-item"><a href="Patient.jsp">Patient</a></li>
						<li class="breadcrumb-item active" aria-current="page">Update
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
							<h4 class="card-title">Update Patient Details</h4>
							<form action="PatientServletUpdate" method="post">
								<div class="form-group">
									<label for="name">Name</label> <input type="text"
										class="form-control" id="name" name="name"
										value="<%=patient.getPatientName()%>">
								</div>
								<div class="form-group">
									<label for="age">Age</label> <input type="text"
										class="form-control" id="age" name="age"
										value="<%=patient.getPatientAge()%>">
								</div>
								<div class="form-group">
									<label for="gender">Gender</label> <input type="text"
										class="form-control" id="gender" name="gender"
										value="<%=patient.getPatientGender()%>">
								</div>
								<div class="form-group">
									<label for="phone">Phone</label> <input type="text"
										class="form-control" id="phone" name="phone"
										value="<%=patient.getPatientPhone()%>">
								</div>
								<div class="form-group">
									<label for="mail">Email</label> <input type="text"
										class="form-control" id="mail" name="mail"
										value="<%=patient.getPatientMail()%>">
								</div>
								<div class="form-group">
									<label for="pass">Password</label> <input type="text"
										class="form-control" id="pass" name="pass"
										value="<%=patient.getPatientPass()%>">
								</div>
								<input type="hidden" name="id"
									value="<%=patient.getPatientID()%>"> <input
									type="submit" class="btn btn-primary float-right" value="Update">
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
