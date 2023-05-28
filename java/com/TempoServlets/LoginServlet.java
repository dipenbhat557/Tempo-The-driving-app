package com.TempoServlets;

import java.io.IOException;
import java.io.PrintWriter;
import com.TempoDao.*;
import com.TempoEntities.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.TempoHelper.ConnectionProvider;

@MultipartConfig
public class LoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	public void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		UserDao uDao = new UserDao(ConnectionProvider.getConnection());
		User user = uDao.getUserByEmailAndPassword(email, password);

		if (user == null) {
			Message message = new Message("alert","Sorry!! Try with another email or password");
			HttpSession session = request.getSession();
			session.setAttribute("Message",message);
			response.sendRedirect("Login.jsp");
		} else {
			
			if (user.getCategory().equals("Driver")) {
				
				HttpSession session = request.getSession();
				Message message = new Message("success","Successfully Logged in !!");
				session.setAttribute("Message",message);
				session.setAttribute("currentUser",user);
				
				response.sendRedirect("DriverProfile.jsp");
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("currentUser",user);
				Message message = new Message("success","Successfully Logged in !!");
				session.setAttribute("Message",message);
				response.sendRedirect("CustomerProfile.jsp");
			}
		}

	}
}
