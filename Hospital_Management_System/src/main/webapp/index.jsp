<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="com.db.DBconnect" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<%@ include file="components/allcss.jsp"%>

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
	%>

	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/hos1.png" class="d-block w-100" alt="..."
					height="575px">
			</div>
			<div class="carousel-item">
				<img src="img/hos2.png" class="d-block w-100" alt="..."
					height="575px">
			</div>
			<div class="carousel-item">
				<img src="img/doctor3.png" class="d-block w-100" alt="..."
					height="575px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>


	<div class="container p-3">
		<p class="text-center fs-2">Specialities of our Hospital</p>
		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Voluptatem, inventore</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Clean Environment</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Voluptatem, inventore</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Friendly Doctors</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Voluptatem, inventore</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Medical Research</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Voluptatem, inventore</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4" >
				<img class="img1" alt src="img/doc6.png" >
			</div>
		</div>
	</div>
	
	<hr>
<div class="container p-2">
    <p class="text-center fs-2">Our Team</p>
    <div class="row">
        <div class="col-md-3">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="img/pro4.png" width="250px" height="300px">
                    <p class="fw-bold fs-5">Samuani Simi</p>
                    <p class="fs-7">(CEO & Chairperson)</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="img/pro1.png" width="250px" height="300px">
                    <p class="fw-bold fs-5">Dr. Siva Kumar</p>
                    <p class="fs-7">(Chief Doctor)</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="img/pro2.png" width="250px" height="300px">
                    <p class="fw-bold fs-5">Dr. Niuse Paule</p>
                    <p class="fs-7">(Chief Doctor)</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="img/pro3.png" width="250px" height="300px">
                    <p class="fw-bold fs-5">Dr. Mathue Samuel</p>
                    <p class="fs-7">(Chief Doctor)</p>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="components/footer.jsp" %>

</body>
</html>