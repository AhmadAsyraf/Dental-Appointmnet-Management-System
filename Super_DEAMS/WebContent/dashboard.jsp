<%@ page import="java.util.*"%>
<%@page import="com.mvc.controller.*"%>
<%@page import="com.mvc.bean.AppointmentBean"%>
<%@page import="com.mvc.engine.AppointmentEngine"%>
<%@page import="com.mvc.bean.StaffBean"%>
<%@page import="com.mvc.engine.StaffEngine"%>
<%@page import="com.mvc.bean.PatientBean"%>
<%@page import="com.mvc.engine.PatientEngine"%>

<jsp:include page="header.jsp"></jsp:include>

<jsp:useBean id="AppointmentEngine" scope="application"
	class="com.mvc.engine.AppointmentEngine" />
<jsp:useBean id="StaffEngine" scope="application"
	class="com.mvc.engine.StaffEngine" />
<jsp:useBean id="PatientEngine" scope="application"
	class="com.mvc.engine.PatientEngine" />

<%
	List<AppointmentBean> list = AppointmentEngine.viewAppointment();
	List<StaffBean> list2 = StaffEngine.viewStaff();
	List<PatientBean> list3 = PatientEngine.viewPatient();

	int counterStaff = StaffEngine.countStaff();
	int counterPatient = PatientEngine.countPatient();
	int counterAppointment = AppointmentEngine.countAppointment();
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
						<li class="breadcrumb-item active" aria-current="page">Dashboard</li>
					</ol>
				</nav>
				<h2 class="breadcrumb-title">Dashboard</h2>
			</div>
		</div>
	</div>
</div>
<!-- /Breadcrumb -->
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-xl-4 col-sm-4 col-12">
				<div class="card">
					<div class="card-body">
						<div class="dash-widget-header">
							<span class="dash-widget-icon text-primary border-primary">
								<i class="fi fi-users"></i>
							</span>
							<div class="dash-count">
								<h3><%=counterStaff%></h3>
							</div>
						</div>
						<div class="dash-widget-info">
							<h6 class="text-muted">Staff</h6>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-4 col-sm-4 col-12">
				<div class="card">
					<div class="card-body">
						<div class="dash-widget-header">
							<span class="dash-widget-icon text-primary border-primary">
								<i class="fi fi-users"></i>
							</span>
							<div class="dash-count">
								<h3><%=counterPatient%></h3>
							</div>
						</div>
						<div class="dash-widget-info">
							<h6 class="text-muted">Patient</h6>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-4 col-sm-4 col-12">
				<div class="card">
					<div class="card-body">
						<div class="dash-widget-header">
							<span class="dash-widget-icon text-primary border-primary">
								<i class="fi fi-users"></i>
							</span>
							<div class="dash-count">
								<h3><%=counterAppointment%></h3>
							</div>
						</div>
						<div class="dash-widget-info">
							<h6 class="text-muted">Appointment</h6>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br />
		<div class="row">
			<div class="col-md-12 d-flex">
				<!-- Recent Orders -->
				<div class="card card-table flex-fill">
					<div class="card-body">
						<h4 class="card-title">
							Appointment<a class="nav-link float-right" href="Appointment.jsp">
								<button type="button" class="btn btn-outline-info">View</button>
							</a>
						</h4>
						<div class="table-responsive">
							<table class="table table-hover table-center mb-0">
								<thead>
									<tr>
										<th>Patient Name</th>
										<th>Service</th>
										<th>Date</th>
										<th>Time</th>
										<th>Staff Name</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (AppointmentBean i : list) {
									%>
									<tr>
										<td><%=i.getPatientName()%></td>
										<td><%=i.getServiceName()%></td>
										<td><%=i.getAppDate()%></td>
										<td><%=i.getAppTime()%></td>
										<td><%=i.getStaffName()%></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- /Recent Orders -->

			</div>
		</div>
		<br />
		<div class="row">
			<div class="col-md-6 d-flex">
				<!-- Recent Orders -->
				<div class="card card-table flex-fill">
					<div class="card-body">
						<h4 class="card-title">
							Staff<a class="nav-link float-right" href="Staff.jsp">
								<button type="button" class="btn btn-outline-info">View</button>
							</a>
						</h4>
						<div class="table-responsive">
							<table class="table table-hover table-center mb-0">
								<thead>
									<tr>
										<th scope="col">Name</th>
										<th scope="col">Phone No.</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (StaffBean i : list2) {
									%>
									<tr>
										<td><%=i.getStaffName()%></td>
										<td><%=i.getStaffPhone()%></td>
										<%
											}
										%>
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- /Recent Orders -->
			</div>
			<div class="col-md-6 d-flex">

				<!-- Feed Activity -->
				<div class="card  card-table flex-fill">
					<div class="card-body">
						<h4 class="card-title">
							Patients<a class="nav-link float-right" href="Patient.jsp">
								<button type="button" class="btn btn-outline-info">View</button>
							</a>
						</h4>
						<div class="table-responsive">
							<table class="table table-hover table-center mb-0">
								<thead>
									<tr>
										<th>Name</th>
										<th>Age</th>
										<th>Phone No.</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (PatientBean i : list3) {
									%>
									<tr>
										<td><%=i.getPatientName()%></td>
										<td><%=i.getPatientAge()%></td>
										<td><%=i.getPatientPhone()%></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- /Feed Activity -->
			</div>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>