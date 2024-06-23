<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>

	
<%@ page import="com.dao.SpecialistDao" %>
<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.entity.Specialist" %>
<%@ page import="com.entity.Doctor" %>
<%@ page import="com.db.DBconnect" %>
<%@ page import="java.util.List" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Details</title>

<%@ include file="../components/allcss.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3)
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
	%>

	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Doctor Details</p>
						<c:if test="${not empty error}">
							<p class="fs-4 text-center text-danger">${error}</p>
							<c:remove var="error" scope="session" />
						</c:if>
						<c:if test="${not empty success}">
							<div class="fs-4 text-center text-success" role="alert">${success}</div>
							<c:remove var="success" scope="session" />
						</c:if>
						<table class="table">
							<thead>
								<tr>
									<th scope="col" class="text-center">Full Name</th>
									<th scope="col" class="text-center">DOB</th>
									<th scope="col" class="text-center">Qualification</th>
									<th scope="col" class="text-center">Speciality</th>
									<th scope="col" class="text-center">Email</th>
									<th scope="col" class="text-center">Mob No</th>
									<th scope="col" class="text-center">Action</th>
								</tr>
							</thead>
							<tbody>
							
							<%
								DoctorDao dao1 = new DoctorDao(DBconnect.getConnection());
								List<Doctor> list1 = dao1.getDoctor();
								
								for(Doctor d: list1)
								{%>
									<tr>
										<td class="text-center"><%= d.getName() %> </td>
										<td class="text-center"><%= d.getDob() %></td>
										<td class="text-center"><%= d.getQualification() %></td>
										<td class="text-center"><%= d.getSpeciality() %></td>
										<td class="text-center"><%= d.getEmail() %></td>
										<td class="text-center"><%= d.getMobNo() %></td>
										<td class="text-center">
										<a href="edit_doctor.jsp?id=<%= d.getId() %>" class="btn btn-sm btn-primary">Edit</a>
										<a href="../deleteDoctor?id=<%= d.getId() %>" class="btn btn-sm btn-danger">Delete</a>
										</td>
									</tr>
								<%}
							%>
							
							</tbody>
						</table>
					</div>
				</div>
			</div>
</body>
</html>