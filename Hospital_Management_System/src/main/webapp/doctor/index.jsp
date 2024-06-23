<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="com.dao.AppointmentDao"%>
<%@ page import="com.entity.Doctor"%>
<%@ page import="com.db.DBconnect"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Dashboard</title>

<%@ include file="../components/allcss.jsp"%>

<style type="text/css">
	.paint-card{
		box-shadow:0 0 10px 0 rgba(0, 0, 0, 0.3)
	}
</style>

</head>
<body>

	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

	if (session.getAttribute("doctorObj") == null) { //if user is loged in then only display the content
		response.sendRedirect("../doctor_login.jsp"); //else redirect to login page
	}
	else{
		Doctor doc = (Doctor) session.getAttribute("doctorObj");
		AppointmentDao dao = new AppointmentDao(DBconnect.getConnection());
	%>

	<%@ include file="navbar.jsp"%>

	<p class="text-center fs-3 mt-3">Doctor Dashboard</p>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-2">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							Doctor <br>12
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment <br><%= dao.countAppbyDcoId(doc.getId()) %>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
<%} %>

</body>
</html>