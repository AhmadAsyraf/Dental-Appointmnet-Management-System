<%@page import="com.mvc.bean.PatientBean"%>
<%@page import="com.mvc.engine.PatientEngine"%>
<%@ page import="java.util.*"%>
<jsp:include page="header.jsp"></jsp:include>

<jsp:useBean id="PatientEngine" scope="application"
	class="com.mvc.engine.PatientEngine" />
<%
	List<PatientBean> list = PatientEngine.viewPatient();
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
						<li class="breadcrumb-item active" aria-current="page">Patient</li>
					</ol>
				</nav>
				<h2 class="breadcrumb-title">Patient</h2>
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
							<h4 class="card-title">
								List Details<a class="nav-link float-right"
									href="PatientAdd.jsp">
									<button type="button" class="btn btn-outline-info">Add</button>
								</a>
							</h4>
							<div class="table-responsive">
								<table class="table table-hover table-sm display" id="example">
									<thead class="table table-light">
										<tr>
											<th>#</th>
											<th>Name</th>
											<th>Age</th>
											<th>Gender</th>
											<th>Phone Number</th>
											<th>Email</th>
											<th>Action</th>
											<th></th>
										</tr>
									</thead>

									<tbody>
										<%
											for (PatientBean i : list) {
										%>
										<tr>
											<td><%=i.getPatientID()%></td>
											<td><%=i.getPatientName()%></td>
											<td><%=i.getPatientAge()%></td>
											<td><%=i.getPatientGender()%></td>
											<td><%=i.getPatientPhone()%></td>
											<td><%=i.getPatientMail()%></td>
											<td>
												<form action="PatientUpdate.jsp" method="post">
													<input type="submit" class="btn btn-dark btn-sm"
														value="Update"> <input type="hidden" name="id"
														value="<%=i.getPatientID()%>">
												</form>

											</td>
											<td>
												<form action="PatientServletDelete" method="post">
													<input type="submit" class="btn btn-outline-danger btn-sm"
														value="Delete"> <input type="hidden" name="id"
														value="<%=i.getPatientID()%>">
												</form>
											</td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>