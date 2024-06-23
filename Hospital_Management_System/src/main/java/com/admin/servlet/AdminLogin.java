package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.User;

@WebServlet("/adminLogin")
public class AdminLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		
		HttpSession session = request.getSession();
		
		if(email.equals("admin@gmail.com") && pass.equals("admin")){
			session.setAttribute("adminObj", new User());
			response.sendRedirect("admin/index.jsp");
		}
		else {
			session.setAttribute("error", "Inavlid credentials.");
			response.sendRedirect("admin_login.jsp");
		}
	}

}
