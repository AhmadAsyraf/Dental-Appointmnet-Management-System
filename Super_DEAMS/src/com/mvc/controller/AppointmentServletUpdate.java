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
 * Servlet implementation class AppointmentServletUpdate
 */
@WebServlet("/AppointmentServletUpdate")
public class AppointmentServletUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AppointmentServletUpdate() {
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
		
		int appID = Integer.parseInt(request.getParameter("appID"));
		String appDate = request.getParameter("date");
		String appTime = request.getParameter("time");
		int serviceID = Integer.parseInt(request.getParameter("serviceID"));
		int staffID = Integer.parseInt(request.getParameter("staffID"));
		int patientID = Integer.parseInt(request.getParameter("patientID"));

		AppointmentBean ap = new AppointmentBean();
		
		ap.setAppID(appID);
		ap.setAppDate(appDate);
		ap.setAppTime(appTime);
		ap.setServiceID(serviceID);
		ap.setStaffID(staffID);
		ap.setPatientID(patientID);

		AppointmentEngine pm = new AppointmentEngine();
		try {
			pm.updateAppointment(ap);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		HttpSession session = request.getSession();
		//session.setAttribute("status", "row added");
		session.setAttribute("success", "You've successfully update appointment data.");

		response.sendRedirect("Appointment.jsp");
	}

}
