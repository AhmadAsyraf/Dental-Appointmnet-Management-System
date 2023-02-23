<%@ page import="java.util.*"%>
<%@page import="com.mvc.controller.*"%>
<%@page import="com.mvc.bean.AppointmentBean"%>
<%@page import="com.mvc.bean.PatientBean"%>
<%@page import="com.mvc.engine.AppointmentEngine"%>
<%@page import="com.mvc.engine.PatientEngine"%>
<jsp:include page="header.jsp"></jsp:include>

<jsp:useBean id="AppointmentBean" scope="application"
	class="com.mvc.bean.AppointmentBean" />
<jsp:useBean id="AppointmentEngine" scope="application"
	class="com.mvc.engine.AppointmentEngine" />
<jsp:useBean id="PatientEngine" scope="application"
	class="com.mvc.engine.PatientEngine" />

<%
	String identity = (String) request.getSession().getAttribute("email");
	System.out.println(identity);
	PatientBean name = PatientEngine.identitySummary(identity);
	String UserName = name.getPatientName();
	List<AppointmentBean> list = AppointmentEngine.viewAppointmentIdentity(UserName);
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
						<li class="breadcrumb-item active" aria-current="page">My
							Appointment</li>
					</ol>
				</nav>
				<h2 class="breadcrumb-title">Recent Appointment</h2>
			</div>
		</div>
	</div>
</div>
<!-- /Breadcrumb -->
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
					<h4 class="card-title">
							Your Appointment<a class="nav-link float-right" href="AppointmentAdd.jsp">
								<button type="button" class="btn btn-outline-info">Make Appointment</button>
							</a>
						</h4>
						<div class="table-responsive">
							<table class="table table-hover table-sm display" id="example">
								<thead class="table table-light">
									<tr>
										<th>Service Name</th>
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
										<td><%=i.getServiceName()%></td>
										<td><%=i.getAppDate()%></td>
										<td><%=i.getAppTime()%></td>
										<td><%=i.getStaffName()%></td>
									</tr>
									<% } %>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>