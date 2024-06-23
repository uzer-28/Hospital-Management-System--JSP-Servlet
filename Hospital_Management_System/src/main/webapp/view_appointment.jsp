<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.entity.Doctor"%>
<%@ page import="com.entity.Appointment"%>
<%@ page import="com.entity.User"%>
<%@ page import="com.dao.DoctorDao"%>
<%@ page import="com.dao.AppointmentDao"%>
<%@ page import="com.db.DBconnect"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Appointment</title>

<%@ include file="components/allcss.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3)
}
</style>

</head>
<body>
	<%@ include file="components/navbar.jsp"%>
	
	<%
		User user = (User) session.getAttribute("userObj");
	List<Appointment> list = null;
	AppointmentDao dao = new AppointmentDao(DBconnect.getConnection());
	//List<Appointment> list = dao.getAppointmentById(user.getId());
	
	DoctorDao dao1 = new DoctorDao(DBconnect.getConnection());
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");   
	
		if(user == null) {                                     //if user is not loged in then 
			response.sendRedirect("user_login.jsp");              //redirect to login page
		}
		else{
			list = dao.getAppointmentById(user.getId());
		
	%>

	<div class="container-fluid bg-success ">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-9">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">Appointment
							List</p>
						<table class="table">

							<tr>
								<th scope="col">Full Name</th>
								<th scope="col">Gender</th>
								<th scope="col">Age</th>
								<th scope="col">Appointment Date</th>
								<th scope="col">Diseases</th>
								<th scope="col">Doctor Name</th>
								<th scope="col">Status</th>
							</tr>
					
						<tbody>
						<%
							
							
							
							for(Appointment app : list){ 
								Doctor doc = dao1.getDoctorById(app.getDoctorId());
								%>
								<tr>
								<td class="fw-bold"><%= app.getName() %></td>
								<td><%= app.getGender() %></td>
								<td><%= app.getAge() %></td>
								<td><%= app.getDate() %></td>
								<td><%= app.getDiseases() %></td>
								<td><%= doc.getName() %></td>
								<td><%
								    if(app.getStatus().equals("pending")) {%>
								    	<a href="#" class="btn btn-sm btn-warning">Pending</a>
								    <%}
								    else {%>
								    	<%= app.getStatus() %>
								    <%}
								%></td>
							    </tr>
							<%} 
							}
						%>									
						</tbody>
						</table>
					</div>
				</div>

			</div>
			<div class="col-md-3 p-3">
				<img alt="" src="img/doc6.png">
			</div>
		</div>
	</div>
</body>
</html>


