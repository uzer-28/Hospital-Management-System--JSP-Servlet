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
<title>Add Doctor</title>

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
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Doctor</p>
						<c:if test="${not empty error}">
							<p class="fs-3 text-center text-danger">${error}</p>
							<c:remove var="error" scope="session" />
						</c:if>
						<c:if test="${not empty success}">
							<div class="fs-3 text-center text-success" role="alert">${success}</div>
							<c:remove var="success" scope="session" />
						</c:if>
						<form action="../addDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="name" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									required name="dob" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input required
									type="text" name="qualification" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Speciality</label> 
								<select name="speciality" required class="form-control">
									<option>--select--</option>
									
									<%
										SpecialistDao dao = new SpecialistDao(DBconnect.getConnection());
										List<Specialist> list = dao.getSpecialist();
										
										for(Specialist s : list)
										{%>
											<option><%= s.getSpecialistName()%></option>
										<%}
									%>
								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> <input type="text"
									required name="email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="text"
									required name="mobNo" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input
									type="password" required name="pass" class="form-control">
							</div>

							<button type="submit" class="btn btn-primary col-md-12">Add Doctor</button>
						</form>
					</div>
				</div>
			</div>

			
</body>
</html>