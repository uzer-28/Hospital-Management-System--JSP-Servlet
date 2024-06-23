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
<title>Insert title here</title>

<%@ include file="../components/allcss.jsp"%>

<style type="text/css">
	.paint-card{
		box-shadow:0 0 10px 0 rgba(0, 0, 0, 0.3)
	}
</style>

</head>
<body>

	<%@ include file="navbar.jsp"%>
	
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");   
	
		if(session.getAttribute("adminObj") == null){           //if user is loged in then only display the content
			response.sendRedirect("../admin_login.jsp");              //else redirect to login page
		}
		else{
	%>
	
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
									<th scope="col" class="text-center">Doctor Name</th>
									<th scope="col" class="text-center">Address</th>
									<th scope="col" class="text-center">Status</th>
								</tr>
							</thead>
							<tbody>

								<%
								AppointmentDao dao = new AppointmentDao(DBconnect.getConnection());
								DoctorDao dao1 = new DoctorDao(DBconnect.getConnection());
								List<Appointment> list = dao.getAllAppointment();
								
								
								
								for(Appointment app : list) {
									Doctor doc = dao1.getDoctorById(app.getDoctorId());
								%>
								<tr>
									<th class="fw-bold text-center"><%=app.getName()%></th>
									<td class="text-center"><%=app.getGender()%></td>
									<td class="text-center"><%=app.getAge()%></td>
									<td class="text-center"><%=app.getDate()%></td>
									<td class="text-center"><%=app.getEmail()%></td>
									<td class="text-center"><%=app.getPhoNo()%></td>
									<td class="text-center"><%=app.getDiseases() %></td>
									<td class="text-center"><%=doc.getName() %></td>
									<td class="text-center"><%=app.getAddress() %></td>
									<td class="text-center">
									
									<%
									if(app.getStatus().equals("pending")){%>
										<div class="text-warning">Pending</div>
									<%}
									else{%>
										<div class="text-info">Done</div>
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

</body>
</html>