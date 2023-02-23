package com.mvc.engine;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mvc.bean.PatientBean;
import com.mvc.bean.StaffBean;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class StaffEngine {
	private Statement statement;
	private PreparedStatement ps;
	private Connection connection;

	public StaffEngine() {
		super();
	}

	public void initJDBC() throws SQLException{

		try {
			// Load the JDBC driver
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver loaded");

			// Connect to a database
			connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/dental_express" , "root", "");
			System.out.println("Database connected");

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public  ArrayList<StaffBean> viewStaff(){

		ArrayList<StaffBean> stList= null;

		try{
			initJDBC();
			stList = new ArrayList<StaffBean>();
			statement = (Statement) connection.createStatement();

			// Execute a statement
			ResultSet rs = statement.executeQuery("SELECT * FROM staff");

			while(rs.next()){
				StaffBean st = new StaffBean();
				st.setStaffID(rs.getInt("staffID"));
				st.setStaffName(rs.getString("staffName"));
				st.setStaffAddress(rs.getString("staffAddress"));
				st.setStaffPhone(rs.getString("staffPhone"));

				stList.add(st);
			}

			// Close the connection
			connection.close();
		}catch(Exception ex){
			System.out.println("viewPatient(): "+ex);
			ex.printStackTrace();	
		}
		return stList;
	}

	public void addStaff(StaffBean st) throws SQLException{
		initJDBC();
		try{
			String sql = "INSERT INTO staff (staffName, staffAddress, staffPhone, staffMail, staffPass) "
					+ "VALUES (?, ?, ?, ?, ?)";

			ps = connection.prepareStatement(sql);
			ps.setString(1, st.getStaffName());
			ps.setString(2, st.getStaffAddress());
			ps.setString(3, st.getStaffPhone());
			ps.setString(4, st.getStaffMail());
			ps.setString(5, st.getStaffPass());

			int rowsInserted = ps.executeUpdate();

			if (rowsInserted > 0) {
				System.out.println("A new staff was inserted successfully!");
			}

		}catch(Exception ex){
			System.out.println("addStaff(): "+ex);
			ex.printStackTrace();	
		}
	}

	public ArrayList<StaffBean> viewStaffById(){

		ArrayList<StaffBean> stList= null;
		try{
			initJDBC();
			stList = new ArrayList<StaffBean>();
			statement = (Statement) connection.createStatement();

			// Execute a statement
			ResultSet rs = statement.executeQuery("SELECT * FROM staff WHERE staffID = '?'");

			while(rs.next()){
				StaffBean st = new StaffBean();
				st.setStaffID(rs.getInt("staffID"));
				st.setStaffName(rs.getString("staffName"));
				st.setStaffAddress(rs.getString("staffAge"));
				st.setStaffPhone(rs.getString("staffPhone"));
				st.setStaffMail(rs.getString("staffMail"));
				st.setStaffPass(rs.getString("StaffPass"));

				stList.add(st);
			}

			// Close the connection
			connection.close();
		}catch(Exception ex){
			System.out.println("viewStaff(): "+ex);
			ex.printStackTrace();	
		}
		return stList;
	}

	public StaffBean getStaffById(int id){

		StaffBean stObj = new StaffBean();
		try {
			initJDBC();

			String sqlRet = "SELECT * FROM staff WHERE staffID ="+id;
			ps = connection.prepareStatement(sqlRet);

			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				stObj.setStaffID(rs.getInt(1));
				stObj.setStaffName(rs.getString(2));
				stObj.setStaffAddress(rs.getString(3));
				stObj.setStaffPhone(rs.getString(4));
				stObj.setStaffMail(rs.getString(5));
				stObj.setStaffPass(rs.getString(6));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return stObj;
	}

	public void updateStaff(StaffBean st) throws SQLException{
		initJDBC();
		try{			
			String sqlUpdate = "UPDATE staff SET staffName = ?, staffAddress = ?,"
					+ " staffPhone = ?, staffMail = ?, staffPass = ?"
					+ " WHERE staffID = ?";

			ps = connection.prepareStatement(sqlUpdate);

			ps.setString(1, st.getStaffName());
			ps.setString(2, st.getStaffAddress());
			ps.setString(3, st.getStaffPhone());
			ps.setString(4, st.getStaffMail());
			ps.setString(5, st.getStaffPass());
			ps.setInt(6, st.getStaffID());

			//ps.executeUpdate();
			int i = ps.executeUpdate();

			if(i > 0)
			{
				System.out.println("Record Updated Successfully");
			}
			else
			{
				System.out.println("There is a problem in updating Record.");
			} 
			System.out.println("update done");
		}catch(Exception ex){
			System.out.println("updateStaff(): "+ex);
			ex.printStackTrace();	
		}
	}

	public void deleteStaffById(int id){

		StaffBean stObj = new StaffBean();
		try {
			initJDBC();

			String sqlDel = "DELETE FROM staff WHERE staffID ="+id;
			ps = connection.prepareStatement(sqlDel);
			ps.executeUpdate(sqlDel);

		} catch(Exception ex){
			System.out.println("deleteStaff(): "+ex);
			ex.printStackTrace();	
		}
	}
	
	public StaffBean identitySummary(String email){
		StaffBean apid = new StaffBean();
		try {
			initJDBC();
			String sqlID = "select * FROM staff WHERE staffMail ='"+email+"'";
			ps = connection.prepareStatement(sqlID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				apid.setStaffID(rs.getInt("staffID"));
				apid.setStaffName(rs.getString("staffName"));
				apid.setStaffAddress(rs.getString("staffAddress"));
				apid.setStaffPhone(rs.getString("staffPhone"));
				apid.setStaffMail(rs.getString("staffMail"));
				apid.setStaffPass(rs.getString("staffPass"));
			}
			
		} catch(Exception ex){
			ex.printStackTrace();	
		}
		return apid;
	}

	public int countStaff(){
		int counter = 0;
		try {
			initJDBC();

			String sqlCnt = "SELECT count(*) FROM staff";
			ps = connection.prepareStatement(sqlCnt);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				counter = rs.getInt("count(*)");
			}
		} catch(Exception ex){
			System.out.println("countStaff(): "+ex);
			ex.printStackTrace();	
		}
		return counter;
	}
}
