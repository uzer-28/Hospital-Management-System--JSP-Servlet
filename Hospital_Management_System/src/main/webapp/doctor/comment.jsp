<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="com.dao.AppointmentDao"%>
<%@ page import="com.entity.Appointment"%>
<%@ page import="com.db.DBconnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Dashboard</title>

<%@ include file="../components/allcss.jsp"%>

<style type="text/css">
	.paint-card{
		box-shadow:0 0 10px 0 rgba(0, 0, 0, 0.3)
	}
	
	.backImg{
        background : linear-gradient(rgba(0,0,0,.4), rgba(0,0,0,.4)), url("../img/hos1.png");
        height: 20vh;
        width: 100%;
        background-size: cover;
        background-repeat: no-repeat;
    }
</style>

</head>
<body>

	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

	if (session.getAttribute("doctorObj") == null) { //if user is loged in then only display the content
		response.sendRedirect("../doctor_login.jsp"); //else redirect to login page
	}
	%>

	<%@ include file="navbar.jsp"%>
	
	<div class="container-fluid backImg p-5">
        <p class="text-center fs-2 text-white">Patient Comment </p>
    </div>
    <div class="container p-3">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="text-center fs-4"></p>
                        
                        <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        AppointmentDao dao = new AppointmentDao(DBconnect.getConnection());
                        Appointment app = dao.getAppointment(id);
                        %>

                        <form action="../updateStatus" class="row" method="post">

                            <div class="col-md-6">
                                <label for="">Patient Name <input type="text" readonly class="form-control" value="<%= app.getName() %>"></label>
                            </div>
                            <div class="col-md-6">
                                <label for="">Age <input type="text" readonly class="form-control" value="<%= app.getAge() %>"></label>
                            </div>
                            <div class="col-md-6">
                                <label for="">Mob No <input type="text" readonly class="form-control" value="<%= app.getPhoNo() %>"></label>
                            </div>
                            <div class="col-md-6">
                                <label for="">Diseases <input type="text" readonly class="form-control" value="<%= app.getDiseases() %>"></label>
                            </div>
                            <div class="col-md-12">
                                <label for="">Comment</label>
                                <textarea required rows="3" cols="" class="form-control" name="comm"> </textarea>
                            </div>
                            <input type="hidden" name="id" value="<%= app.getId2() %>">
                            <input type="hidden" name="doctorId" value="<%= app.getDoctorId() %>">

                            <button class="mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>
                        </form>
                    </div>

                </div>

            </div>
        </div>
    </div>


</body>
</html>