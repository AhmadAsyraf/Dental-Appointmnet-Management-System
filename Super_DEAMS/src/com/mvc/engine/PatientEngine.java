package com.mvc.engine;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mvc.bean.PatientBean;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class PatientEngine {
	
	private Statement statement;
	private PreparedStatement ps;
	private Connection connection;

	public PatientEngine() {
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

	public ArrayList<PatientBean> viewPatient(){

		ArrayList<PatientBean> patientList= null;

		try{
			initJDBC();
			patientList = new ArrayList<PatientBean>();
			statement = (Statement) connection.createStatement();

			// Execute a statement
			ResultSet rs = statement.executeQuery("SELECT * FROM patient");

			while(rs.next()){
				PatientBean patientBean = new PatientBean();
				patientBean.setPatientID(rs.getInt("patientID"));
				patientBean.setPatientName(rs.getString("patientName"));
				patientBean.setPatientAge(rs.getInt("patientAge"));
				patientBean.setPatientGender(rs.getString("patientGender"));
				patientBean.setPatientPhone(rs.getString("patientPhone"));
				patientBean.setPatientMail(rs.getString("patientMail"));
				patientBean.setPatientPass(rs.getString("patientPass"));

				patientList.add(patientBean);
			}

			// Close the connection
			connection.close();
		}catch(Exception ex){
			System.out.println("viewPatient(): "+ex);
			ex.printStackTrace();	
		}
		return patientList;
	}

	public void addPatient(PatientBean patientBean) throws SQLException{
		initJDBC();
		try{
			String sql = "INSERT INTO patient (patientName, patientAge, patientGender, patientPhone, patientMail, patientPass) "
					+ "VALUES (?, ?, ?, ?, ?, ?)";

			ps = connection.prepareStatement(sql);
			ps.setString(1, patientBean.getPatientName());
			ps.setInt(2, patientBean.getPatientAge());
			ps.setString(3, patientBean.getPatientGender());
			ps.setString(4, patientBean.getPatientPhone());
			ps.setString(5, patientBean.getPatientMail());
			ps.setString(6, patientBean.getPatientPass());

			int rowsInserted = ps.executeUpdate();

			if (rowsInserted > 0) {
				System.out.println("A new patient was inserted successfully!");
			}

		}catch(Exception ex){
			System.out.println("addPatient(): "+ex);
			ex.printStackTrace();	
		}
	}
	
	public ArrayList<PatientBean> viewPatientById(){

		ArrayList<PatientBean> patientBean= null;
		try{
			initJDBC();
			patientBean = new ArrayList<PatientBean>();
			statement = (Statement) connection.createStatement();

			// Execute a statement
			ResultSet rs = statement.executeQuery("SELECT * FROM patient WHERE patientID = '?'");
			
			while(rs.next()){
				PatientBean pt = new PatientBean();
				pt.setPatientID(rs.getInt("patientID"));
				pt.setPatientName(rs.getString("patientName"));
				pt.setPatientAge(rs.getInt("patientAge"));
				pt.setPatientGender(rs.getString("patientGender"));
				pt.setPatientPhone(rs.getString("patientPhone"));
				pt.setPatientMail(rs.getString("patientMail"));
				pt.setPatientPass(rs.getString("patientPass"));

				patientBean.add(pt);
			}

			// Close the connection
			connection.close();
		}catch(Exception ex){
			System.out.println("viewPatient(): "+ex);
			ex.printStackTrace();	
		}
		return patientBean;
	}
	
	public PatientBean getPatientById(int id){

		PatientBean ptObj = new PatientBean();
		try {
			initJDBC();
				
			String sqlRet = "SELECT * FROM patient WHERE patientID ="+id;
			ps = connection.prepareStatement(sqlRet);

			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				ptObj.setPatientID(rs.getInt(1));
				ptObj.setPatientName(rs.getString(2));
				ptObj.setPatientAge(rs.getInt(3));
				ptObj.setPatientGender(rs.getString(4));
				ptObj.setPatientPhone(rs.getString(5));
				ptObj.setPatientMail(rs.getString(6));
				ptObj.setPatientPass(rs.getString(7));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ptObj;
	}
	
	public void updatePatient(PatientBean pt) throws SQLException{
		initJDBC();
		try{			
			String sqlUpdate = "UPDATE patient SET patientName = ?, patientAge = ?,"
					+ " patientGender = ?, patientPhone = ?, patientMail = ?, patientPass = ?"
					+ " WHERE patientID = ?";
			
			ps = connection.prepareStatement(sqlUpdate);
			
			ps.setString(1, pt.getPatientName());
			ps.setInt(2, pt.getPatientAge());
			ps.setString(3, pt.getPatientGender());
			ps.setString(4, pt.getPatientPhone());
			ps.setString(5, pt.getPatientMail());
			ps.setString(6, pt.getPatientPass());
			ps.setInt(7, pt.getPatientID());
			
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

//			int rowsInserted = ps.executeUpdate();

//			if (rowsInserted > 0) {
//				System.out.println("A new update data was inserted successfully!");
//			}
			System.out.println("update done");
		}catch(Exception ex){
			System.out.println("updateInventory(): "+ex);
			ex.printStackTrace();	
		}
	}
	
	public void deletePatientById(int id){
		try {
			initJDBC();
				
			String sqlDel = "DELETE FROM patient WHERE patientID ="+id;
			ps = connection.prepareStatement(sqlDel);
			ps.executeUpdate(sqlDel);
			
		} catch(Exception ex){
			System.out.println("deletePatient(): "+ex);
			ex.printStackTrace();	
		}
	}

	public PatientBean identitySummary(String email){
		PatientBean apid = new PatientBean();
		try {
			initJDBC();
			String sqlID = "select * FROM patient WHERE patientMail ='"+email+"'";
			ps = connection.prepareStatement(sqlID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				apid.setPatientID(rs.getInt("patientID"));
				apid.setPatientName(rs.getString("patientName"));
				apid.setPatientAge(rs.getInt("patientAge"));
				apid.setPatientGender(rs.getString("patientGender"));
				apid.setPatientPhone(rs.getString("patientPhone"));
				apid.setPatientMail(rs.getString("patientMail"));
				apid.setPatientPass(rs.getString("patientPass"));
			}
			
		} catch(Exception ex){
			ex.printStackTrace();	
		}
		return apid;
	}
	
	public int countPatient(){
		int counter = 0;
		try {
			initJDBC();

			String sqlCnt = "SELECT count(*) FROM patient";
			ps = connection.prepareStatement(sqlCnt);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				counter = rs.getInt("count(*)");
			}
		} catch(Exception ex){
			System.out.println("countPatient(): "+ex);
			ex.printStackTrace();	
		}
		return counter;
	}
}
