package com.mvc.engine;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mvc.bean.LoginBean;
import com.mvc.util.DBConnection;

import com.mysql.jdbc.Connection;

public class LoginEngine {

	public String authenticateUser(LoginBean loginBean){

		String email = loginBean.getEmail();
		String password = loginBean.getPassword();

		Connection con = null;
		Statement statement = null;
		Statement statement2 = null;
		ResultSet resultSet = null;
		ResultSet resultSet2 = null;

		String emailDB = "";
		String passwordDB = "";

		try{
			con = DBConnection.createConnection();
			statement = con.createStatement();
			resultSet = statement.executeQuery("select staffMail, staffPass from staff");

			while(resultSet.next()){
				emailDB = resultSet.getString("staffMail");
				passwordDB = resultSet.getString("staffPass");

				if(email.equals(emailDB) && password.equals(passwordDB)){
					return "Success-Staff";
				}
			}
			statement2 = con.createStatement();
			resultSet2 = statement2.executeQuery("select patientMail, patientPass from patient");
			while(resultSet2.next()){
				emailDB = resultSet2.getString("patientMail");
				passwordDB = resultSet2.getString("patientPass");

				if(email.equals(emailDB) && password.equals(passwordDB)){
					return "Success-Patient";
				}
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return "Invalid user credentials";
	}
}

