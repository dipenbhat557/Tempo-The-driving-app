package com.TempoServlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.TempoDao.*;
import com.TempoEntities.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.TempoHelper.ConnectionProvider;
import com.TempoHelper.Helper;

@MultipartConfig
public class DriverRegistrationServlet extends HttpServlet {

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
		Part liscence = request.getPart("liscenceName");
		Part profile = request.getPart("profileName");
		String check = request.getParameter("check");

		String liscenceName = liscence.getSubmittedFileName();
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
			User user = new User(name, phoneno, gender, email, password1, liscenceName, profileName, "Driver");
			if (uDao.saveUser(user)) {
				String path1="D:\\Eclipse_workspace\\Tempo\\src\\main\\webapp\\TempoPics"+File.separator+liscenceName;
				String path2="D:\\Eclipse_workspace\\Tempo\\src\\main\\webapp\\TempoPics"+File.separator+profileName;
				
				Helper.saveFile(liscence.getInputStream(),path1);
				Helper.saveFile(profile.getInputStream(), path2);
				
				Connection conn = ConnectionProvider.getConnection();
				int uId=0;
				try {
					PreparedStatement pstmt = conn.prepareStatement("select uId from user where email=? and password=?");
					pstmt.setString(1, email);
					pstmt.setString(2, password1);
					ResultSet set=pstmt.executeQuery();
					if(set.next()) {
						uId=set.getInt("uId");
					}
				} catch (SQLException e) { 
					e.printStackTrace();
				}
				
				user.setuId(uId);
				HttpSession session = request.getSession();
				session.setAttribute("currentUser",user);
				out.println("done");

			} else {
				Message message = new Message("alert", "Sorry!! Something went wrong");
				HttpSession session = request.getSession();
				session.setAttribute("Message", message);

				response.sendRedirect("DriverRegister.jsp");
			}

		}
		else {
			Message message = new Message("alert", "Password does not Match!!");
			HttpSession session = request.getSession();
			session.setAttribute("Message", message);

			response.sendRedirect("DriverRegister.jsp");			
		}
	}
}
