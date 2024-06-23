<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="com.dao.DoctorDao"%>
<%@ page import="com.db.DBconnect"%>

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
	%>

	<div class="container p-5">
	<p class="text-center fs-3">Admin Dashboard</p>
	
		<c:if test="${not empty error}">
			<p class="fs-4 text-center text-danger">${error}</p>
			<c:remove var="error" scope="session" />
		</c:if>
		
		<c:if test="${not empty success}">
			<div class="fs-4 text-center text-success" role="alert">${success}</div>
			<c:remove var="success" scope="session" />
		</c:if>
		
		<%
        DoctorDao dao = new DoctorDao(DBconnect.getConnection());
    %> 
    
		<div class="row mt-4">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							Doctor <br><%= dao.countDoctor() %>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-circle fa-3x"></i><br>
						<p class="fs-4 text-center">
							User <br><%= dao.countUser() %>
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment <br><%= dao.countAppointment() %>
						</p>
					</div>
				</div>
			</div>


			<div class="col-md-4 mt-2" data-bs-toggle="modal" data-bs-target="#exampleModal" style="cursor: pointer;">
				<div class="card paint-card" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Specialist <br><%=dao.countSpecialist() %>
						</p>
					</div>
				</div>
			</div>
		</div>
		
		

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       
		<form action="../addSpecialist" method="post">
			<div class="form-group">
			<label>Enter Specialist Name</label>
			<input type="text" name="name" class="form-control">
			</div>
			<input type="submit" class="btn btn-primary mt-3" value="Add" >
			
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>