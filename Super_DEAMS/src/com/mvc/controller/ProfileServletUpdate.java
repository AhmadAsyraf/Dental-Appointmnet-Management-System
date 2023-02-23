package com.mvc.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvc.bean.PatientBean;
import com.mvc.bean.StaffBean;
import com.mvc.engine.PatientEngine;
import com.mvc.engine.StaffEngine;

/**
 * Servlet implementation class ProfileServletUpdate
 */
@WebServlet("/ProfileServletUpdate")
public class ProfileServletUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProfileServletUpdate() {
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

		String role = request.getParameter("role");

		if(role.equals("patient")){
			int id = Integer.parseInt(request.getParameter("id"));
			String patientName = request.getParameter("name");
			int patientAge = Integer.parseInt(request.getParameter("age"));
			String patientGender = request.getParameter("gender");
			String patientPhone = request.getParameter("phone");
			String patientMail = request.getParameter("mail");
			String patientPass = request.getParameter("pass");

			PatientBean pt = new PatientBean();

			pt.setPatientID(id);
			pt.setPatientName(patientName);
			pt.setPatientAge(patientAge);
			pt.setPatientGender(patientGender);
			pt.setPatientPhone(patientPhone);
			pt.setPatientMail(patientMail);
			pt.setPatientPass(patientPass);

			PatientEngine pm = new PatientEngine();
			try {
				pm.updatePatient(pt);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(role.equals("admin")){
			int id = Integer.parseInt(request.getParameter("id"));
			String staffName = request.getParameter("name");
			String staffAddress = request.getParameter("address");
			String staffPhone = request.getParameter("phone");
			String staffMail = request.getParameter("mail");
			String staffPass = request.getParameter("pass");

			StaffBean st = new StaffBean();

			st.setStaffID(id);
			st.setStaffName(staffName);
			st.setStaffAddress(staffAddress);
			st.setStaffPhone(staffPhone);
			st.setStaffMail(staffMail);
			st.setStaffPass(staffPass);

			StaffEngine sm = new StaffEngine();
			try {
				sm.updateStaff(st);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("im here to update data in updateUser Details");

		HttpSession session = request.getSession();
		//session.setAttribute("status", "row added");
		session.setAttribute("success", "You've successfully update profile data.");

		response.sendRedirect("Profile.jsp");
	}

}
