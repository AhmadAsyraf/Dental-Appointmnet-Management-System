<%@ page import="com.mvc.bean.PatientBean"%>
<%@ page import="com.mvc.bean.StaffBean"%>
<%@ page import="com.mvc.controller.PatientServletUpdate"%>
<%@ page import="com.mvc.controller.StaffServletUpdate"%>

<jsp:include page="header.jsp"></jsp:include>

<jsp:useBean id="PatientEngine" scope="application"
	class="com.mvc.engine.PatientEngine" />
<jsp:useBean id="PatientBean" scope="application"
	class="com.mvc.bean.PatientBean" />
<jsp:useBean id="StaffEngine" scope="application"
	class="com.mvc.engine.StaffEngine" />
<jsp:useBean id="StaffBean" scope="application"
	class="com.mvc.bean.StaffBean" />
<br />
<!-- Breadcrumb -->
<div class="breadcrumb-bar">
	<div class="container-fluid">
		<div class="row align-items-center">
			<div class="col-md-12 col-12">
				<nav aria-label="breadcrumb" class="page-breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="dashboard.jsp">Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">Profile</li>
					</ol>
				</nav>
				<h2 class="breadcrumb-title">Profile</h2>
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
							<ul class="nav nav-tabs">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="tab" href="#profile">Your Profile</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#update">Update Profile</a></li>
							</ul>
							<%
								String stat = (String) request.getSession().getAttribute("role");
								String identity, identity2;
								PatientBean name;
								StaffBean name2;
								if (stat.equals("patient")) {
									identity = (String) request.getSession().getAttribute("email");
									System.out.println(identity);
									name = PatientEngine.identitySummary(identity);
									int id = name.getPatientID();
							%>
							<div class="tab-content">
								<div id="profile" class="tab-pane active">
									<br />
									<div class="form-group">
										<label for="name">Name</label> <input type="text"
											class="form-control" id="name" name="name"
											value="<%=name.getPatientName()%>" readonly>
									</div>
									<div class="form-group row">
										<div class="col">
											<label for="age">Age</label> <input type="text"
												class="form-control" id="age" name="age"
												value="<%=name.getPatientAge()%>" readonly>
										</div>
										<div class="col">
											<label for="gender">Gender</label> <input type="text"
												class="form-control" id="gender" name="gender"
												value="<%=name.getPatientGender()%>" readonly>
										</div>
									</div>
									<div class="form-group">
										<label for="phone">Phone</label> <input type="text"
											class="form-control" id="phone" name="phone"
											value="<%=name.getPatientPhone()%>" readonly>
									</div>
									<div class="form-group">
										<label for="mail">Email</label> <input type="text"
											class="form-control" id="mail" name="mail"
											value="<%=name.getPatientMail()%>" readonly>
									</div>
								</div>
								<div id="update" class="tab-pane fade">
									<br />
									<form action="ProfileServletUpdate" method="post">
										<div class="form-group">
											<label for="name">Name</label> <input type="text"
												class="form-control" id="name" name="name"
												value="<%=name.getPatientName()%>">
										</div>
										<div class="form-group row">
											<div class="col">
												<label for="age">Age</label> <input type="text"
													class="form-control" id="age" name="age"
													value="<%=name.getPatientAge()%>">
											</div>
											<div class="col">
												<label for="gender">Gender</label> <input type="text"
													class="form-control" id="gender" name="gender"
													value="<%=name.getPatientGender()%>">
											</div>
										</div>
										<div class="form-group">
											<label for="phone">Phone</label> <input type="text"
												class="form-control" id="phone" name="phone"
												value="<%=name.getPatientPhone()%>">
										</div>
										<div class="form-group">
											<label for="mail">Email</label> <input type="text"
												class="form-control" id="mail" name="mail"
												value="<%=name.getPatientMail()%>">
										</div>
										<div class="form-group">
											<label for="pass">Password</label> <input type="text"
												class="form-control" id="pass" name="pass"
												value="<%=name.getPatientPass()%>">
										</div>
										<input type="hidden" name="id"
											value="<%=name.getPatientID()%>"> <input
											type="hidden" name="role" value="<%=stat%>"> <input
											type="submit" class="btn btn-primary float-right"
											value="Update">
									</form>
								</div>
							</div>
							<%
								} else if (stat.equals("admin")) {
									identity2 = (String) request.getSession().getAttribute("email");
									System.out.println(identity2);
									name2 = StaffEngine.identitySummary(identity2);
									int id = name2.getStaffID();
							%>
							<div class="tab-content">
								<div id="profile" class="tab-pane active">
									<br />
									<div class="form-group">
										<label for="name">Name</label> <input type="text"
											class="form-control" id="name" name="name"
											value="<%=name2.getStaffName()%>" readonly>
									</div>
									<div class="form-group">
										<label for="address">Address</label> <input type="text"
											class="form-control" id="address" name="address"
											value="<%=name2.getStaffAddress()%>" readonly>
									</div>
									<div class="form-group row">
										<div class="col">
											<label for="phone">Phone No.</label> <input type="text"
												class="form-control" id="phone" name="phone"
												value="<%=name2.getStaffPhone()%>" readonly>
										</div>
										<div class="col">
											<label for="mail">Email</label> <input type="text"
												class="form-control" id="mail" name="mail"
												value="<%=name2.getStaffMail()%>" readonly>
										</div>
									</div>
								</div>
								<div id="update" class="tab-pane fade">
									<br />
									<form action="ProfileServletUpdate" method="post">
										<div class="form-group">
											<label for="name">Name</label> <input type="text"
												class="form-control" id="name" name="name"
												value="<%=name2.getStaffName()%>">
										</div>
										<div class="form-group">
											<label for="address">Address</label> <input type="text"
												class="form-control" id="address" name="address"
												value="<%=name2.getStaffAddress()%>">
										</div>
										<div class="form-group">
											<label for="phone">Phone No.</label> <input type="text"
												class="form-control" id="phone" name="phone"
												value="<%=name2.getStaffPhone()%>">
										</div>
										<div class="form-group">
											<label for="mail">Email</label> <input type="text"
												class="form-control" id="mail" name="mail"
												value="<%=name2.getStaffMail()%>">
										</div>
										<div class="form-group">
											<label for="pass">Password</label> <input type="text"
												class="form-control" id="pass" name="pass"
												value="<%=name2.getStaffPass()%>">
										</div>
										<input type="hidden" name="id" value="<%=name2.getStaffID()%>">
										<input type="hidden" name="role" value="<%=stat%>"> <input
											type="submit" class="btn btn-primary float-right"
											value="Update">
									</form>
								</div>
							</div>
							<%
								}
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>