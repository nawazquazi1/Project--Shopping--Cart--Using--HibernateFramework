package org.project.controller;

import java.io.IOException;
import java.io.PrintWriter;

import org.project.DAO.UserDao;
import org.project.entities.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class registration
 */
@WebServlet("/registration")
public class registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {
//          fetch all form data
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String contact = request.getParameter("contact");
			// create user object and set all data to that object..
			User user = new User(name, contact, email, password);
			UserDao dao = new UserDao();
			if (dao.addUser(user)) {
				request.setAttribute("status", "success");
			} else {
				request.setAttribute("status", "failed");
			}
			request.getRequestDispatcher("registration.jsp").forward(request, response);

		}

	}

}
