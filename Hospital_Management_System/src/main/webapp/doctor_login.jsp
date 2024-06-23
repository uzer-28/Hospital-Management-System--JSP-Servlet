<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Login</title>
<%@ include file="components/allcss.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3)
}
</style>

</head>
<body>
	<%@ include file="components/navbar.jsp"%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Doctor Login</p>
						
						<c:if test="${not empty error}">
							<p class="fs-4 text-center text-danger">${error}</p>
							<c:remove var="error" scope="session" />
						</c:if>
						<c:if test="${not empty success}">
							<div class="fs-4 text-center text-success" role="alert">${success}</div>
							<c:remove var="success" scope="session" />
						</c:if>

						<form action="doctorLogin" method="post">
							<div class="mb-3">
								<label class="form-label">Email address</label> <input required
									name="email" type="email" class="form-control" />
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="password" type="password" class="form-control" />
							</div>
							<button type="submit" class="btn bg-success text-white col-md-12">Login</button>
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>