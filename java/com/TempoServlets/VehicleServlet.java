package com.TempoServlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import com.TempoEntities.*;
import com.TempoHelper.ConnectionProvider;
import com.TempoHelper.Helper;
import com.TempoDao.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class VehicleServlet extends HttpServlet {

	public void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String vType =request.getParameter(("vType"));
		String vModel = request.getParameter("vModel"); 
		String vPlate = request.getParameter("vPlate");
		Part Photo = request.getPart("vPhoto");
		
		String vPhoto = Photo.getSubmittedFileName();
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("currentUser");
		int userId = user.getuId();
		System.out.println(userId);
		VehicleDao vDao = new VehicleDao(ConnectionProvider.getConnection()); 
		Vehicle vehicle = new Vehicle(vType,vModel,vPlate,vPhoto,userId);
		
		if(vDao.saveVehicle(vehicle)) {
			
			String path = "D:\\Eclipse_workspace\\Tempo\\src\\main\\webapp\\TempoPics"+File.separator+vPhoto;
			if(Helper.saveFile(Photo.getInputStream(),path)) {
			out.println("done");
			Message message = new Message("success", "Vehicle Registered Successfully");
			session.setAttribute("Message", message);
			response.sendRedirect("DriverProfile.jsp");
			}else {
				Message message = new Message("alert", "Something went wrong!!");
				session.setAttribute("Message", message);
				response.sendRedirect("VehicleRegistration.jsp");
			}
		}
		else {
			Message message = new Message("alert", "Something went wrong!!");
			session.setAttribute("Message", message);
			response.sendRedirect("VehicleRegistration.jsp");
		}
		
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
	
	
}
