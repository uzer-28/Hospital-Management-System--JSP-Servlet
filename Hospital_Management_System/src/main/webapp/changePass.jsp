<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="com.dao.DoctorDao"%>
<%@ page import="com.entity.User"%>
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

	<%@ include file="components/navbar.jsp"%>
	
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");   
	
		if(session.getAttribute("userObj") == null){           //if user is loged in then only display the content
			response.sendRedirect("user_login.jsp");              //else redirect to login page
		}
		else{
			User user = (User) session.getAttribute("userObj");
	%>
	
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
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

						<form action="changePass?id=<%=user.getId() %>" method="post">
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
		</div>
	</div>
<%} %>
</body>
</html>