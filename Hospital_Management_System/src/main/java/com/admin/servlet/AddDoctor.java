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


@WebServlet("/addDoctor")
public class AddDoctor extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		try {
			String name = req.getParameter("name");
			String dob = req.getParameter("dob");
			String qualification = req.getParameter("qualification");
			String speciality = req.getParameter("speciality");
			String email = req.getParameter("email");
			String mobNo = req.getParameter("mobNo");
			String pass = req.getParameter("pass");
			
			Doctor doc = new Doctor(name, dob, qualification, speciality, email, mobNo, pass);
			DoctorDao dao = new DoctorDao(DBconnect.getConnection());
			boolean res1 = dao.addDcotor(doc);
			
			HttpSession session = req.getSession();
			
			if(res1) {
				session.setAttribute("success", "Doctor added successfully.");
				res.sendRedirect("admin/doctor.jsp");
			}
			else{
				session.setAttribute("error", "Something went wrong.");
				res.sendRedirect("admin/doctor.jsp");
			}
			
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}

}
