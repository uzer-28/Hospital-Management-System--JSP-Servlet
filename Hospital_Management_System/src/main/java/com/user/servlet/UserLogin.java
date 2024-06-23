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
import com.entity.User;

@WebServlet("/userLogin")
public class UserLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String pass = request.getParameter("password");

		try {
			HttpSession session = request.getSession();

			UserDao dao = new UserDao(DBconnect.getConnection());
			User user = dao.login(email, pass);

			if (user != null) {
				session.setAttribute("userObj", user);
				response.sendRedirect("index.jsp");
			} else {
				session.setAttribute("error", "Inavlid credentials.");
				response.sendRedirect("user_login.jsp");
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
