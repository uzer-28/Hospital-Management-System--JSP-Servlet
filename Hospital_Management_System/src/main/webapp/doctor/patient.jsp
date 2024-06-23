<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@ page import="com.dao.SpecialistDao"%>
<%@ page import="com.dao.DoctorDao"%>
<%@ page import="com.dao.AppointmentDao"%>
<%@ page import="com.entity.Appointment"%>
<%@ page import="com.entity.Doctor"%>
<%@ page import="com.db.DBconnect"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Dashboard</title>

<%@ include file="../components/allcss.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3)
}
</style>

</head>
<body>

	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

	if (session.getAttribute("doctorObj") == null) {     //if doctor is loged in then only display the content
		response.sendRedirect("../doctor_login.jsp");    //else redirect to login page
	} 
	else {
	%>

	<%@ include file="navbar.jsp"%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Patient Details</p>

						<c:if test="${not empty error}">
							<p class="fs-4 text-center text-danger">${error}</p>
							<c:remove var="error" scope="session" />
						</c:if>

						<c:if test="${not empty success}">
							<p class="fs-4 text-center text-success">${success}</p>
							<c:remove var="success" scope="session" />
						</c:if>

						<table class="table">
							<thead>
								<tr>
									<th scope="col" class="text-center">Full Name</th>
									<th scope="col" class="text-center">Gender</th>
									<th scope="col" class="text-center">Age</th>
									<th scope="col" class="text-center">Appointment Date</th>
									<th scope="col" class="text-center">Email</th>
									<th scope="col" class="text-center">Mob No</th>
									<th scope="col" class="text-center">Diseases</th>
									<th scope="col" class="text-center">Status</th>
									<th scope="col" class="text-center">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								Doctor doc = (Doctor) session.getAttribute("doctorObj");
								AppointmentDao dao = new AppointmentDao(DBconnect.getConnection());
								List<Appointment> list = dao.getAppointmentByDoctorId(doc.getId());
								
								for(Appointment app : list) {								
								%>
								<tr>
									<th class="fw-bold text-center"><%=app.getName()%></th>
									<td class="text-center"><%=app.getGender()%></td>
									<td class="text-center"><%=app.getAge()%></td>
									<td class="text-center"><%=app.getDate()%></td>
									<td class="text-center"><%=app.getEmail()%></td>
									<td class="text-center"><%=app.getPhoNo()%></td>
									<td class="text-center"><%=app.getDiseases()%></td>
									<td class="text-center"><%=app.getStatus()%></td>
									<td class="text-center">
									
									<%
									if(app.getStatus().equals("pending")){%>
										<a href="comment.jsp?id=<%= app.getId2() %>" class="btn btn-sm btn-primary">Comment</a>
									<%}
									else{%>
										<a href="#" class="btn btn-sm btn-primary disabled">Comment</a>
									<%}
									%>											
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

</body>
</html>