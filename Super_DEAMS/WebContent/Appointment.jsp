<%@ page import="java.util.*"%>
<%@page import="com.mvc.controller.*"%>
<%@page import="com.mvc.bean.AppointmentBean"%>
<%@page import="com.mvc.engine.AppointmentEngine"%>
<%@page import="com.mvc.bean.PatientBean"%>
<%@page import="com.mvc.engine.PatientEngine"%>
<jsp:include page="header.jsp"></jsp:include>

<jsp:useBean id="AppointmentEngine" scope="application"
	class="com.mvc.engine.AppointmentEngine" />
<jsp:useBean id="PatientEngine" scope="application"
	class="com.mvc.engine.PatientEngine" />
<br />

<!-- Breadcrumb -->
<div class="breadcrumb-bar">
	<div class="container-fluid">
		<div class="row align-items-center">
			<div class="col-md-12 col-12">
				<nav aria-label="breadcrumb" class="page-breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="dashboard.jsp">Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">Appointment</li>
					</ol>
				</nav>
				<h2 class="breadcrumb-title">Appointment</h2>
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
							<h4 class="card-title">List Details</h4>
							<%
								if (session.getAttribute("role").equals("admin")) {
									List<AppointmentBean> list = AppointmentEngine.viewAppointment();
							%>
							<div class="table-responsive">
								<table class="table table-hover table-sm display" id="example">
									<thead class="table table-light">
										<tr>
											<th>#</th>
											<th>Patient Name</th>
											<th>Service</th>
											<th>Date</th>
											<th>Time</th>
											<th>Staff Name</th>
											<th>Action</th>
											<th></th>
										</tr>
									</thead>

									<tbody>
										<%
											for (AppointmentBean i : list) {
										%>
										<tr>
											<td><%=i.getAppID()%></td>
											<td><%=i.getPatientName()%></td>
											<td><%=i.getServiceName()%></td>
											<td><%=i.getAppDate()%></td>
											<td><%=i.getAppTime()%></td>
											<td><%=i.getStaffName()%></td>
											<td>
												<form action="AppointmentUpdate.jsp" method="post">
													<input type="submit" class="btn btn-dark btn-sm"
														value="Update"> <input type="hidden" name="id"
														value="<%=i.getAppID()%>">
												</form>

											</td>
											<td>
												<form action="AppointmentServletDelete" method="post">
													<input type="submit" class="btn btn-outline-danger btn-sm"
														value="Delete"> <input type="hidden" name="id"
														value="<%=i.getAppID()%>">
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
						<%
							}
							if (session.getAttribute("role").equals("patient")) {
								String identity = (String) request.getSession().getAttribute("email");
								System.out.println(identity);
								PatientBean name = PatientEngine.identitySummary(identity);
								String UserName = name.getPatientName();
								List<AppointmentBean> list = AppointmentEngine.viewAppointmentIdentity(UserName);
						%>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-hover table-sm display" id="example">
									<thead class="table table-light">
										<tr>
											<th>#</th>
											<th>Patient Name</th>
											<th>Service</th>
											<th>Date</th>
											<th>Time</th>
											<th>Staff Name</th>
											<th>Action</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<%
											for (AppointmentBean i : list) {
										%>
										<tr>
											<td class="text-center"><%=i.getAppID()%></td>
											<td><%=i.getPatientName()%></td>
											<td><%=i.getServiceName()%></td>
											<td><%=i.getAppDate()%></td>
											<td class="text-center"><%=i.getAppTime()%></td>
											<td><%=i.getStaffName()%></td>
											<td>
												<form action="AppointmentUpdate.jsp" method="post">
													<input type="submit" class="btn btn-dark btn-sm"
														value="Update"> <input type="hidden" name="id"
														value="<%=i.getAppID()%>">
												</form>

											</td>
											<td>
												<form action="AppointmentServletDelete" method="post">
													<input type="submit" class="btn btn-outline-danger btn-sm"
														value="Delete"> <input type="hidden" name="id"
														value="<%=i.getAppID()%>">
												</form>
											</td>
										</tr>
										<%
											}
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