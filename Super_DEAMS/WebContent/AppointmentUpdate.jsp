<%@page import="com.mvc.bean.AppointmentBean"%>
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
<jsp:useBean id="AppointmentEngine" scope="application"
	class="com.mvc.engine.AppointmentEngine" />

<%
	List<ServiceBean> list = ServiceEngine.viewServices();
	List<TimeBean> btlist = TimeEngine.viewBookingTime();
	List<StaffBean> stlist = StaffEngine.viewStaff();
	List<AppointmentBean> aplist = AppointmentEngine.viewAppointmentById();

	String identity = (String) request.getSession().getAttribute("email");
	System.out.println(identity);

	PatientBean id = PatientEngine.identitySummary(identity);

	int ids = Integer.parseInt(request.getParameter("id"));
	AppointmentBean ab = AppointmentEngine.getAppointmentById(ids);
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
						<li class="breadcrumb-item active" aria-current="page">Update
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
							<h4 class="card-title">Update Appointment Details</h4>
							<form action="AppointmentServletUpdate" method="post">
								<div class="container">
									<div class="row">
										<div class="col-xl-4 col-sm-4 col-12">
											<div class="card">
												<div class="card-body">
													<h5 class="card-title">Select slot</h5>
													<h6 class="card-subtitle mb-2 text-muted">Date</h6>
													<div class="form-group">
														<input type="date" class="form-control" id="date"
															name="date" value="<%=ab.getAppDate()%>">
													</div>
													<br />
													<div class="dropdown-divider"></div>
													<br />
													<h6 class="card-subtitle mb-2 text-muted">Time</h6>
													<div class="form-group">
														<select id="time" class="form-control" name="time">
															<option value="<%=ab.getAppTime()%>"><%=ab.getAppTime()%></option>
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
													<h6 class="card-subtitle mb-2 text-muted">Service</h6>
													<div class="form-group">
														<select id="services" class="form-control"
															name="serviceID">
															<option value="<%=ab.getServiceID()%>"><%=ab.getServiceName()%></option>
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
													<br />
													<h6 class="card-subtitle mb-2 text-muted">Staff</h6>
													<div class="form-group">
														<select id="staff" class="form-control" name="staffID">
															<option value="<%=ab.getStaffID()%>"><%=ab.getStaffName()%></option>
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
												</div>
												<input type="hidden" name="appID" value="<%=ab.getAppID()%>">
												<input type="hidden" name="patientID"
													value="<%=ab.getPatientID()%>"> <input
													type="submit" class="btn btn-primary btn-bg"
													value="Update Appointment">
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
<jsp:include page="footer.jsp"></jsp:include>