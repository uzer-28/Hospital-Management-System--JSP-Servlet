package com.admin.servlet;

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

@WebServlet("/deleteDoctor")
public class DeleteDoctor extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		try {
			DoctorDao dao = new DoctorDao(DBconnect.getConnection());
			boolean res1 = dao.deleteDoctor(id);

			HttpSession session = req.getSession();

			if (res1) {
				session.setAttribute("success", "Doctor deleted successfully.");
				res.sendRedirect("admin/view_doctor.jsp");
			} else {
				session.setAttribute("error", "Something went wrong.");
				res.sendRedirect("admin/view_doctor.jsp");
			}
		} 
		catch (Exception e) {
			System.out.println(e);
		}
	}

}
