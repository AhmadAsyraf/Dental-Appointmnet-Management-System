<%@page import="com.mvc.engine.TimeEngine"%>
<%@page import="com.mvc.bean.TimeBean"%>
<%@page import="com.mvc.bean.StaffBean"%>
<%@page import="com.mvc.bean.ServiceBean"%>
<%@page import="com.mvc.bean.PatientBean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="ServiceEngine" scope="application"
	class="com.mvc.engine.ServiceEngine" />
<jsp:useBean id="PatientEngine" scope="application"
	class="com.mvc.engine.PatientEngine" />
<jsp:useBean id="TimeEngine" scope="application"
	class="com.mvc.engine.TimeEngine" />
<jsp:useBean id="StaffEngine" scope="application"
	class="com.mvc.engine.StaffEngine" />

<%
	List<ServiceBean> list = ServiceEngine.viewServices();
	List<TimeBean> btlist = TimeEngine.viewBookingTime();
	List<StaffBean> stlist = StaffEngine.viewStaff();

	String identity = (String) request.getSession().getAttribute("email");
	System.out.println(identity);
	PatientBean id = PatientEngine.identitySummary(identity);
%>

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
						<li class="breadcrumb-item"><a href="Appointment.jsp">Appointment</a></li>
						<li class="breadcrumb-item active" aria-current="page">Create
							Appointment</li>
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
							<h4 class="card-title">Create Your Appointment</h4>
							<form action="AppointmentServlet" method="post">
								<div class="container">
									<div class="row">
										<div class="col-xl-4 col-sm-4 col-12">
											<div class="card">
												<div class="card-body">
													<h5 class="card-title">Select Slot</h5>
													<h6 class="card-subtitle mb-2 text-muted">Date</h6>
													<div class="form-group">
														<input type="date" class="form-control" id="date"
															name="date">
													</div>
													<br />
													<div class="dropdown-divider"></div>
													<br />
													<h6 class="card-subtitle mb-2 text-muted">Time</h6>
													<div class="form-group">
														<select id="time" class="form-control" name="time">
															<%
																for (TimeBean b : btlist) {
															%>
															<option value="<%=b.getBookingTimeSlot()%>"><%=b.getBookingTimeSlot()%></option>
															<%
																}
															%>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-4 col-sm-4 col-12">
											<div class="card">
												<div class="card-body">
													<h5 class="card-title">Select Services</h5>
													<h6 class="card-subtitle mb-2 text-muted">Services</h6>
													<div class="form-group">
														<select id="services" class="form-control" name="services">
															<%
																for (ServiceBean i : list) {
															%>
															<option value="<%=i.getServiceID()%>"><%=i.getServiceName()%></option>
															<%
																}
															%>
														</select>
													</div>
													<br />
													<div class="dropdown-divider"></div>
													<br>
													<h6 class="card-subtitle mb-2 text-muted">Select Staff</h6>
													<div class="form-group">
														<select id="staff" class="form-control" name="staffID">
															<%
																for (StaffBean s : stlist) {
															%>
															<option value="<%=s.getStaffID()%>"><%=s.getStaffName()%></option>
															<%
																}
															%>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-4 col-sm-4 col-12">
											<div class="card">
												<div class="card-body">
													<h5 class="card-title">Appointment Summary</h5>
													<h6 class="card-subtitle mb-2 text-muted">Patient
														Details</h6>
													<div class="row">
														<div
															class="col-sm-4 text-muted text-sm-right mb-0 mb-sm-3">Name</div>
														<div class="col-sm-8"><%=id.getPatientName()%></div>
													</div>
													<div class="row">
														<div
															class="col-sm-4 text-muted text-sm-right mb-0 mb-sm-3">Age</div>
														<div class="col-sm-8"><%=id.getPatientAge()%></div>
													</div>
													<div class="row">
														<div
															class="col-sm-4 text-muted text-sm-right mb-0 mb-sm-3">Gender</div>
														<div class="col-sm-8"><%=id.getPatientGender()%></div>
													</div>
												</div>
												<input type="hidden" name="patientID"
													value="<%=id.getPatientID()%>"> <input
													type="submit" class="btn btn-block btn-primary"
													value="Make Appointment"> <span style="color: red"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></span>
											</div>
										</div>
									</div>
								</div>
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