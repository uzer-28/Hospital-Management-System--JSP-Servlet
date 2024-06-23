package com.user.servlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBconnect;
import com.entity.User;

@WebServlet("/user_register")
public class UserRegister extends HttpServlet{
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String pass = request.getParameter("password");
			
			User user = new User(name, email, pass);
			
			UserDao dao = new UserDao(DBconnect.getConnection());
			boolean res = dao.insert(user);
			
			HttpSession session = request.getSession();
			
			if(res) {
				session.setAttribute("success", "Register successfully, please login.");
				response.sendRedirect("user_login.jsp");
			}
			else {
				session.setAttribute("error", "Something went wrong.");
				response.sendRedirect("singup.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	

}
