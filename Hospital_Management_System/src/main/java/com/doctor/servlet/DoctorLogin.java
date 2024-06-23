package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DBconnect;
import com.entity.Doctor;

@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String pass = request.getParameter("password");

		try {
			HttpSession session = request.getSession();

			DoctorDao dao = new DoctorDao(DBconnect.getConnection());
			Doctor doc = dao.login(email, pass);

			if (doc != null) {
				session.setAttribute("doctorObj", doc);
				response.sendRedirect("doctor/index.jsp");
			} else {
				session.setAttribute("error", "Inavlid credentials.");
				response.sendRedirect("doctor_login.jsp");
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
