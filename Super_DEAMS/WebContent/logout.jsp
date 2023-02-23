<%@ page import="com.mvc.engine.*" %>
<%
	if(session.getAttribute("status") != null){
		session.removeAttribute("status");
		session.removeAttribute("role");
		response.sendRedirect("login.jsp");
	}
%>