<%@page import="com.mvc.bean.StaffBean"%>
<%@page import="com.mvc.engine.StaffEngine"%>
<%@ page import="java.util.*"%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:useBean id="StaffEngine" scope="application"
	class="com.mvc.engine.StaffEngine" />
<%
	List<StaffBean> list = StaffEngine.viewStaff();
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
						<li class="breadcrumb-item active" aria-current="page">Staff</li>
					</ol>
				</nav>
				<h2 class="breadcrumb-title">Staff</h2>
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
							List Details<a class="nav-link float-right" href="StaffAdd.jsp">
								<button type="button" class="btn btn-outline-info">Add</button>
							</a>
						</h4>
							<div class="table-responsive">
								<table class="table table-hover table-sm display" id="example">
									<thead class="table table-light">
										<tr>
											<th scope="col">id</th>
											<th scope="col">Name</th>
											<th scope="col">Address</th>
											<th scope="col">Phone</th>
											<th scope="col">Action</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<%
											for (StaffBean i : list) {
										%>
										<tr>
											<td><%=i.getStaffID()%></td>
											<td><%=i.getStaffName()%></td>
											<td><%=i.getStaffAddress()%></td>
											<td><%=i.getStaffPhone()%></td>
											<td>
												<form action="StaffUpdate.jsp" method="post">
													<input type="submit" class="btn btn-dark btn-sm"
														value="Update"> <input type="hidden" name="id"
														value="<%=i.getStaffID()%>">
												</form>
											</td>
											<td>
												<form action="StaffServletDelete" method="post">
													<input type="submit" class="btn btn-outline-danger btn-sm"
														value="Delete"> <input type="hidden" name="id"
														value="<%=i.getStaffID()%>">
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