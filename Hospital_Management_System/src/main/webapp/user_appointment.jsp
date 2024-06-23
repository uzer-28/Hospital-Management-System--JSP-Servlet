
<%
response.setHeader("Cache-control", "no-cache, no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.entity.Doctor"%>
<%@ page import="com.dao.DoctorDao"%>
<%@ page import="com.db.DBconnect"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Appointment</title>
<%@ include file="components/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)),
		url("img/hos1.png");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<%@ include file="components/navbar.jsp"%>
	
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
	%>
	
	<div class="container-fluid backImg bg-custom p-5">	
		<p class="text-center fs-2 text-white">User Appointment</p> 
		<div class="container p-3">
			<div class="row">
				
				<div class="col-md-6 p-5">
					<img alt="" src="img/doc6.png" />
				</div>
				<div class="col-md-6">
				
					<div class="card paint-card">
						<div class="card-body">
						
						<!--  	<p class="text-center fs-3">User Appointment</p> -->
							
							<c:if test="${not empty error}">
								<p class="fs-4 text-center text-danger">${error}</p>
								<c:remove var="error" scope="session" />
							</c:if>
							
							<c:if test="${not empty success}">
								<p class="fs-4 text-center text-success">${success}</p>
								<c:remove var="success" scope="session" />
							</c:if>
							
							<form class="row g-3" action="addAppointment" method="post">
							
								<input type="hidden" name="userId" value="${userObj.getId()}" />
								
								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">Full Name</label> <input
										type="text" class="form-control" name="name"
										id="inputEmail4" required>
								</div>
								
								<div class="col-md-6">
									<label>Gender</label> <select class="form-control"
										name="gender" required>
										<option value="male">Male</option>
										<option value="female">Female</option>
									</select>
								</div>
								
								<div class="col-md-6">
									<label for="inputEmail4" class="form-Label">Age</label> <input
										required type="number" class="form-control" name="age">
								</div>
								
								<div class="col-md-6">
									<label for="inputEmail4" class="form-Label">Appointment
										Date</label> <input type="date" class="form-control" required
										name="date">
								</div>
								
								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">Email</label> <input
										required type="email" class="form-control" name="email">
								</div>

								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">Phone No</label> <input
										maxlength="10" required type="number" class="form-control"
										name="phoNo">
								</div>

								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">Diseases</label> <input
										required type="text" class="form-control" name="diseases">
								</div>
								
								<div class="col-md-6">
									<label for="inputPassword4" class="form-Label">Doctor</label> <select
										required class="form-control" name="doctorId">
										<option value="">--select--</option>
										<%
											DoctorDao dao = new DoctorDao(DBconnect.getConnection());
											List<Doctor> list = dao.getDoctor();
											
											for(Doctor d : list)
											{%>
													<option value="<%=d.getId()%>" > <%=d.getName()%>(<%=d.getSpeciality() %>)</option>																							
											<%}
										%>										
									</select>
								</div>
								<div class="col-md-12">

									<label>Full Address</label>
									<textarea required name="address" class="form-control" rows="3"
										cols=""></textarea>
								</div>

								<c:if test="${empty userObj}">
									<a href="user_login.jsp"
										class="col-md-6 offset-md-3 btn btn-success">Submit</a>
								</c:if>

								<c:if test="${not empty userObj }">
									<button class="col-md-6 offset-md-3 btn btn-success">Submit</button>

								</c:if>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
