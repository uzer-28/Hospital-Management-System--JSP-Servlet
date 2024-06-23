package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.db.DBconnect;
import com.entity.Appointment;

@WebServlet("/addAppointment")
public class AddAppointment extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int userId = Integer.parseInt(req.getParameter("userId"));
		String name = req.getParameter("name");
		String gender = req.getParameter("gender");
		int age = Integer.parseInt(req.getParameter("age"));
		String date = req.getParameter("date");
		String email = req.getParameter("email");
		String phoNo = req.getParameter("phoNo");
		String diseases = req.getParameter("diseases");
		int doctorId = Integer.parseInt(req.getParameter("doctorId"));
		String address = req.getParameter("address");
	
		try {
			Appointment app = new Appointment(name, gender, age, date, email, phoNo, diseases,
					doctorId, userId, "pending", address);
			AppointmentDao dao = new AppointmentDao(DBconnect.getConnection());
			boolean res = dao.addAppointment(app);
			
			HttpSession session = req.getSession();
			if(res) {
				session.setAttribute("success", "Appointment added successfully.");
				resp.sendRedirect("user_appointment.jsp");
			}
			else {
				session.setAttribute("error", "Something went wrong");
				resp.sendRedirect("user_appointment.jsp");
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}

}
