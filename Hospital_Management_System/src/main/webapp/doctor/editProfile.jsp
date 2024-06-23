<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>

<%@ page import="com.dao.SpecialistDao"%>
<%@ page import="com.dao.DoctorDao"%>
<%@ page import="com.entity.Specialist"%>
<%@ page import="com.entity.Doctor"%>
<%@ page import="com.db.DBconnect"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>

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

	if (session.getAttribute("doctorObj") == null) { //if user is loged in then only display the content
		response.sendRedirect("../doctor_login.jsp"); //else redirect to login page
	} 
	else {
		Doctor doc2 = (Doctor) session.getAttribute("doctorObj"); 
	%>

	<%@ include file="navbar.jsp"%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 ">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Change Password</p>

						<c:if test="${not empty success}">
							<p class="text-center text-success fs-5">${success}</p>
							<c:remove var="success" scope="session" />
						</c:if>

						<c:if test="${not empty error}">
							<p class="text-center text-danger fs-5">${error}</p>
							<c:remove var="error" scope="session" />
						</c:if>

						<form action="../changeDocPass?id=<%=doc2.getId()%>" method="post">
							<div class="mb-3">
								<label class="form-label">Old Password</label> <input required
									name="oldPass" type="text" class="form-control" />
							</div>
							<div class="mb-3">
								<label class="form-label">New Password</label> <input required
									name="newPass" type="text" class="form-control" />
							</div>
							<button type="submit" class="btn bg-success text-white col-md-12">Submit</button>
						</form>

					</div>
				</div>
			</div>

			<div class="col-md-5 offset-md-2 ">
				<div class="card paint-card">
					<div class="card-body">
					<p class="text-center fs-3">Edit Profile</p>
					
					<c:if test="${not empty successD}">
							<p class="text-center text-success fs-5">${successD}</p>
							<c:remove var="successD" scope="session" />
						</c:if>

						<c:if test="${not empty errorD}">
							<p class="text-center text-danger fs-5">${errorD}</p>
							<c:remove var="errorD" scope="session" />
						</c:if>
					
						<form action="../editDocProfile" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="name" class="form-control"
									value="<%=doc2.getName()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									required name="dob" class="form-control"
									value="<%=doc2.getDob()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input required
									type="text" name="qualification" class="form-control"
									value="<%=doc2.getQualification()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">Speciality</label> <select
									name="speciality" required class="form-control">
									<option><%=doc2.getSpeciality()%></option>

									<%
									SpecialistDao dao = new SpecialistDao(DBconnect.getConnection());
									List<Specialist> list = dao.getSpecialist();

									for (Specialist s : list) {
									%>
									<option><%=s.getSpecialistName()%></option>
									<%
									}
									%>
								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> <input type="text"
									required name="email" class="form-control" readonly
									value="<%=doc2.getEmail()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="text"
									required name="mobNo" class="form-control"
									value="<%=doc2.getMobNo()%>">
							</div>

							<input type="hidden" name="id" value="<%=doc2.getId()%>">

							<button type="submit" class="btn btn-primary col-md-12">Update</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	%>

</body>
</html>