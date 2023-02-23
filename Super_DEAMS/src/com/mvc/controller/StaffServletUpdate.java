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
 * Servlet implementation class StaffServletUpdate
 */
@WebServlet("/StaffServletUpdate")
public class StaffServletUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StaffServletUpdate() {
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
		
		System.out.println("im here to update data in updateStaff");
		
		HttpSession session = request.getSession();
		//session.setAttribute("status", "row added");
		session.setAttribute("success", "You've successfully update staff data.");
		
		response.sendRedirect("Staff.jsp");
	}

}
