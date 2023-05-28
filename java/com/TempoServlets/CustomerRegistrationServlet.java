package com.TempoServlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.TempoDao.UserDao;
import com.TempoEntities.Message;
import com.TempoEntities.User;
import com.TempoHelper.ConnectionProvider;
import com.TempoHelper.Helper;
@MultipartConfig
public class CustomerRegistrationServlet extends HttpServlet {

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

		// getting values
		String fName = request.getParameter("fName");
		String lName = request.getParameter("lName");
		String name = fName + " " + lName;
		String phoneno = request.getParameter("phoneno");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");

		Part profile = request.getPart("profile");
		String check = request.getParameter("check");

		String profileName = profile.getSubmittedFileName();

		UserDao uDao = new UserDao(ConnectionProvider.getConnection());

		if (check == null) {
			Message message = new Message("alert", "Please accept Terms and Conditions!!");
			HttpSession session = request.getSession();
			session.setAttribute("Message", message);

			response.sendRedirect("DriverRegister.jsp");
			return;
		}

		if (password1.equals(password2)) {
			User user = new User(name, phoneno, gender, email, password1, profileName, "Customer");

			if (uDao.saveUser(user)) {
				String path = "D:\\Eclipse_workspace\\Tempo\\src\\main\\webapp\\TempoPics"+File.separator+profileName;
				Helper.saveFile(profile.getInputStream(),path);
				HttpSession session = request.getSession();
				session.setAttribute("currentUser",user);

				out.println("done");

			} else {
				Message message = new Message("alert", "Sorry!! Something went wrong");
				HttpSession session = request.getSession();
				session.setAttribute("Message", message);

				response.sendRedirect("CustomerRegister.jsp");
			}
		}
		else {
			Message message = new Message("alert", "Password does not Match!!");
			HttpSession session = request.getSession();
			session.setAttribute("Message", message);

			response.sendRedirect("CustomerRegister.jsp");
		}
	}

}
