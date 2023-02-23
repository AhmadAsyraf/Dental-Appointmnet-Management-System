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
import com.mvc.engine.PatientEngine;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String phoneNumber = request.getParameter("phoneNumber");
		String mail = request.getParameter("email");
		String pass = request.getParameter("password");

		PatientBean patientBean = new PatientBean();

		patientBean.setPatientName(name);
		patientBean.setPatientAge(age);
		patientBean.setPatientGender(gender);
		patientBean.setPatientPhone(phoneNumber);
		patientBean.setPatientMail(mail);
		patientBean.setPatientPass(pass);

		PatientEngine patientEngine = new PatientEngine();
		try {
			patientEngine.addPatient(patientBean);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("status", "row added");
		session.setAttribute("success", "You've successfully added patient data.");

		response.sendRedirect("login.jsp");
	}

}
