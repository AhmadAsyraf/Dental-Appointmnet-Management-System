package com.mvc.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvc.bean.AppointmentBean;
import com.mvc.engine.AppointmentEngine;
/**
 * Servlet implementation class AppointmentServlet
 */
@WebServlet("/AppointmentServlet")
public class AppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AppointmentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String appDate = request.getParameter("date");
		String appTime = request.getParameter("time");
		int staffID = Integer.parseInt(request.getParameter("staffID"));
		int serviceID = Integer.parseInt(request.getParameter("services"));
		int patientID = Integer.parseInt(request.getParameter("patientID"));

		AppointmentBean ap = new AppointmentBean();

		ap.setAppDate(appDate);
		ap.setAppTime(appTime);
		ap.setStaffID(staffID);
		ap.setServiceID(serviceID);
		ap.setPatientID(patientID);

		AppointmentEngine pm = new AppointmentEngine();
		
		try {
			String validate = pm.addAppointment(ap);
			if(validate.equals("full")){
				HttpSession session = request.getSession();
				session.setAttribute("success", "The Date and Time Slot is Already Full.");
				response.sendRedirect("index.jsp");
			}else{
				HttpSession session = request.getSession();
				session.setAttribute("success", "You've successfully added appointment data.");
				response.sendRedirect("index.jsp");
			}
			//pm.addAppointment(ap);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
