package org.project.controller;

import java.io.IOException;

import org.project.DAO.UserDao;
import org.project.entities.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginControlle")
public class LoginControlle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userEmail = request.getParameter("email");
		String userPassword = request.getParameter("password");
		UserDao dao = new UserDao();
		User user = dao.userLogin(userEmail, userPassword);
		if (user == null) {
			request.setAttribute("status", "faild");
			response.sendRedirect("login.jsp");
		} else {
			session.setAttribute("auth", user);
			response.sendRedirect("index.jsp");
		}
	}

}
