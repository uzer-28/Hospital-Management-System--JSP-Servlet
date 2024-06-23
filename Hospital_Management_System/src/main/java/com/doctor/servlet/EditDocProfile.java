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

@WebServlet("/editDocProfile")
public class EditDocProfile extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String dob = req.getParameter("dob");
			String qualification = req.getParameter("qualification");
			String speciality = req.getParameter("speciality");
			String email = req.getParameter("email");
			String mobNo = req.getParameter("mobNo");
			
			
			
			Doctor doc = new Doctor(id, name, dob, qualification, speciality, email, mobNo);
			DoctorDao dao = new DoctorDao(DBconnect.getConnection());
			boolean res1 = dao.editDcotor(doc);
			
			HttpSession session = req.getSession();
			
			if(res1) {
				Doctor updateDoc = dao.getDoctorById(id); 
				
				session.setAttribute("successD", "Details updated successfully.");
				session.setAttribute("doctorObj", updateDoc);
				res.sendRedirect("doctor/editProfile.jsp");
			}
			else{
				session.setAttribute("errorD", "Something went wrong.");
				res.sendRedirect("doctor/editProfile.jsp");
			}
			
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}

}
