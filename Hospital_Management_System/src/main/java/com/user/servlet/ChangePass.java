package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBconnect;

@WebServlet("/changePass")
public class ChangePass extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String oldPass = req.getParameter("oldPass");
		String newPass = req.getParameter("newPass");
		int id = Integer.parseInt(req.getParameter("id"));
		
		UserDao dao = new UserDao(DBconnect.getConnection());
		HttpSession session = req.getSession();
		
		try {
			boolean res = dao.checkPass(id, oldPass);
			
			if(res) {
				boolean res1 = dao.changePass(id, newPass);
				if(res1) {
					session.setAttribute("success", "Password changed successsfully.");
					resp.sendRedirect("changePass.jsp");
				}
				else {
					session.setAttribute("error", "Something went wrong.");
					resp.sendRedirect("changePass.jsp");
				}
			}
			else {
				session.setAttribute("error", "Something went wrong.");
				resp.sendRedirect("changePass.jsp");
			}
			
		} 
		catch (Exception e) {
			
			e.printStackTrace();
		}
	}

}
