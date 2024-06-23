package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecialistDao;
import com.db.DBconnect;

@WebServlet("/addSpecialist")
public class AddSpecialist extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name = req.getParameter("name");
		try {
			SpecialistDao dao = new SpecialistDao(DBconnect.getConnection());
			boolean res = dao.addSpecialist(name);

			HttpSession session = req.getSession();
			if (res) {
				session.setAttribute("success", "Specialist Added.");
				resp.sendRedirect("admin/index.jsp");
			} else {
				session.setAttribute("error", "Something went wrong.");
				resp.sendRedirect("admin/index.jsp");
			}

		} 
	   catch (Exception e) {
			e.printStackTrace();
		}

	}
}
