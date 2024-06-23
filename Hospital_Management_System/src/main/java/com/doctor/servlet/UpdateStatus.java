package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.db.DBconnect;

@WebServlet("/updateStatus")
public class UpdateStatus extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("id"));
		int doctorId = Integer.parseInt(req.getParameter("doctorId"));
		String comm = req.getParameter("comm");
		
		AppointmentDao dao = new AppointmentDao(DBconnect.getConnection());
		
		HttpSession session = req.getSession();
		
		try {
			boolean res = dao.updateStatus(id, doctorId, comm);
			if(res) {
				session.setAttribute("success", "Comment updated.");
				resp.sendRedirect("doctor/patient.jsp");
			}
			else {
				session.setAttribute("error", "Something went wrong");
				resp.sendRedirect("doctor/patient.jsp");
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
