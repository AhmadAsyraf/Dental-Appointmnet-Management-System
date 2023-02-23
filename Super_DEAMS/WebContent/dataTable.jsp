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

<h3>View Patient</h3>
<div class=" table-responsive">
<table class="table table-hover table-sm display" id="example">
	<thead class="table table-dark">
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
					<input type="hidden" name="id" value="<%=i.getPatientID()%>" >
					<input type="submit" class="btn btn-success" value="Update" 
				data-toggle="modal" data-target="#myModal" id="<%=i.getPatientID()%>">
				</form>
				<button class="btn btn-success" data-toggle="modal" data-target="#myModal" id="<%=i.getPatientID()%>">View</button>
			</td>
			<td>
				<form action="PatientDelete" method="post">
					<input type="submit" class="btn btn-danger" value="Delete">
					<input type="hidden" name="id" value="<%=i.getPatientID()%>">
				</form>
			</td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>
</div>
<!-- Button to Open the Modal -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    Open modal
  </button>

  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Update Patient Details</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        	<div id="show-data"></div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary" data-dismiss="modal">Update</button>
        </div>
        
      </div>
    </div>
  </div>

</div>