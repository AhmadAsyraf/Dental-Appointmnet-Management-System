package com.mvc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvc.bean.LoginBean;
import com.mvc.engine.LoginEngine;

/**
 * Servlet implementation class login_engine
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
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
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		LoginBean loginBean = new LoginBean();
		loginBean.setEmail(email);
		loginBean.setPassword(password);
		
		LoginEngine loginEngine = new LoginEngine();
		
		String userValidate = loginEngine.authenticateUser(loginBean);
		
		if(userValidate.equals("Success-Staff")){
			HttpSession session = request.getSession();
			session.setAttribute("email", email);
			session.setAttribute("status", "loggedin");
			session.setAttribute("role", "admin");
			session.setAttribute("success", "You've successfully logged in.");
			//request.getRequestDispatcher("/index.jsp").forward(request, response);
			response.sendRedirect("dashboard.jsp");
		}else if(userValidate.equals("Success-Patient")){
			HttpSession session = request.getSession();
			session.setAttribute("email", email);
			session.setAttribute("status", "loggedin");
			session.setAttribute("role", "patient");
			session.setAttribute("success", "You've successfully logged in.");
			//request.getRequestDispatcher("/index.jsp").forward(request, response);
			response.sendRedirect("index.jsp");
		}else{
			request.setAttribute("errMessage", userValidate);
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			//response.sendRedirect("login.jsp");
		}
	}
}
