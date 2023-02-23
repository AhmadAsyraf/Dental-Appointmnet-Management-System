package com.mvc.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvc.bean.StaffBean;
import com.mvc.engine.StaffEngine;

/**
 * Servlet implementation class StaffServlet
 */
@WebServlet("/StaffServlet")
public class StaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StaffServlet() {
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
		String address = request.getParameter("address");
		String phoneNumber = request.getParameter("phoneNumber");
		String staffMail = request.getParameter("mail");
		String staffPass = request.getParameter("pass");

		StaffBean st = new StaffBean();

		st.setStaffName(name);
		st.setStaffAddress(address);
		st.setStaffPhone(phoneNumber);
		st.setStaffMail(staffMail);
		st.setStaffPass(staffPass);

		StaffEngine sm = new StaffEngine();
		try {
			sm.addStaff(st);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		//session.setAttribute("status", "row added");
		session.setAttribute("success", "You've successfully added staff data.");

		response.sendRedirect("Staff.jsp");
	}

}
