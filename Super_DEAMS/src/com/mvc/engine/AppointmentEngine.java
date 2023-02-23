package com.mvc.engine;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.mvc.bean.AppointmentBean;
import com.mvc.bean.PatientBean;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class AppointmentEngine {
	private Statement statement;
	private PreparedStatement ps;
	private Connection connection;

	public AppointmentEngine() {
		super();
	}

	public void initJDBC() throws SQLException{

		try {
			// Load the JDBC driver
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver loaded - Appointment Engine");

			// Connect to a database
			connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/dental_express" , "root", "");
			System.out.println("Database connected  - Appointment Engine");

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<AppointmentBean> viewAppointment(){

		ArrayList<AppointmentBean> apList= null;

		try{
			initJDBC();
			apList = new ArrayList<AppointmentBean>();
			statement = (Statement) connection.createStatement();

			// Execute a statement
			ResultSet rs = statement.executeQuery("select a.*, s.staffName , p.patientName, v.serviceName from appointment a "
					+ "join staff s on a.staffID=s.staffID "
					+ "join patient p on a.patientID=p.patientID "
					+ "join services v on a.serviceID=v.serviceID");

			while(rs.next()){
				AppointmentBean ap = new AppointmentBean();
				ap.setAppID(rs.getInt("appID"));
				ap.setAppDate(rs.getString("appDate"));
				ap.setAppTime(rs.getString("appTime"));
				ap.setStaffName(rs.getString("staffName"));
				ap.setPatientName(rs.getString("patientName"));
				ap.setServiceName(rs.getString("serviceName"));

				apList.add(ap);
			}

			// Close the connection
			connection.close();
		}catch(Exception ex){
			System.out.println("viewPatient(): "+ex);
			ex.printStackTrace();	
		}
		return apList;
	}

	public ArrayList<AppointmentBean> viewAppointmentIdentity(String UserName){

		ArrayList<AppointmentBean> apList= null;

		try{
			initJDBC();
			apList = new ArrayList<AppointmentBean>();
			statement = (Statement) connection.createStatement();

			// Execute a statement
			ResultSet rs = statement.executeQuery("select a.*, s.staffName , p.patientName, v.serviceName from appointment a "
					+ "join staff s on a.staffID=s.staffID "
					+ "join patient p on a.patientID=p.patientID "
					+ "join services v on a.serviceID=v.serviceID WHERE p.patientName ='"+UserName+"'");

			while(rs.next()){
				AppointmentBean ap = new AppointmentBean();
				ap.setAppID(rs.getInt("appID"));
				ap.setAppDate(rs.getString("appDate"));
				ap.setAppTime(rs.getString("appTime"));
				ap.setStaffName(rs.getString("staffName"));
				ap.setPatientName(rs.getString("patientName"));
				ap.setServiceName(rs.getString("serviceName"));

				apList.add(ap);
			}

			// Close the connection
			connection.close();
		}catch(Exception ex){
			System.out.println("viewPatient(): "+ex);
			ex.printStackTrace();	
		}
		return apList;
	}

	public String addAppointment(AppointmentBean ap) throws SQLException{
		initJDBC();
		int counter = 0;
		int counter2 = 0;
		try{
			String sqlCnt = "SELECT count(appDate) AS counter,count(appTime) AS counter2, appDate, appTime "
					+ "FROM appointment WHERE appDate='"+ap.getAppDate()+"' AND appTime='"+ap.getAppTime()+"'";
			ps = connection.prepareStatement(sqlCnt);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				counter = rs.getInt("counter");
				counter2 = rs.getInt("counter2");
				System.out.println("The insert date : "+ap.getAppDate());
				System.out.println("The insert Time : "+ap.getAppTime());
				System.out.println("The DB Date :"+ rs.getString("appDate"));
				System.out.println("The DB Time :"+ rs.getString("appTime"));
				System.out.println("The counter Date value : "+counter);
				System.out.println("The counter Time value : "+counter2);
			}
			rs.close();

			if(counter > 0 && counter2 > 0){
				System.out.println("this slot is already full");
				return "full";
			}else{

				String sql = "INSERT INTO appointment (appDate, appTime, staffID, serviceID, patientID) "
						+ "VALUES ( ?, ?, ?, ?, ?)";

				ps = connection.prepareStatement(sql);
				ps.setString(1, ap.getAppDate());
				ps.setString(2, ap.getAppTime());
				ps.setInt(3, ap.getStaffID());
				ps.setInt(4, ap.getServiceID());
				ps.setInt(5, ap.getPatientID());

				int rowsInserted = ps.executeUpdate();

				if (rowsInserted > 0) {
					System.out.println("A new appointment was inserted successfully!");
				}
			}
		}catch(Exception ex){
			System.out.println("addAppointment(): "+ex);
			ex.printStackTrace();	
		}
		return "finish";
	}

	public ArrayList<AppointmentBean> viewAppointmentById(){

		ArrayList<AppointmentBean> apList= null;
		try{
			initJDBC();
			apList = new ArrayList<AppointmentBean>();
			statement = (Statement) connection.createStatement();

			// Execute a statement
			ResultSet rs = statement.executeQuery("SELECT * FROM appointment WHERE appID = '?'");

			while(rs.next()){
				AppointmentBean ap = new AppointmentBean();
				ap.setAppID(rs.getInt("appID"));
				ap.setAppDate(rs.getString("appDate"));
				ap.setAppTime(rs.getString("appTime"));
				ap.setStaffID(rs.getInt("staffId"));
				ap.setPatientID(rs.getInt("patientId"));

				apList.add(ap);
			}

			// Close the connection
			connection.close();
		}catch(Exception ex){
			System.out.println("viewAppointmentById(): "+ex);
			ex.printStackTrace();	
		}
		return apList;
	}

	public AppointmentBean getAppointmentById(int id){

		AppointmentBean apObj = new AppointmentBean();
		try {
			initJDBC();

			String sqlRet = "select a.*, s.staffName , p.patientName, v.serviceName from appointment a "
					+ "join staff s on a.staffID=s.staffID "
					+ "join patient p on a.patientID=p.patientID "
					+ "join services v on a.serviceID=v.serviceID WHERE appID ="+id;

			ps = connection.prepareStatement(sqlRet);
			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				apObj.setAppID(rs.getInt("appID"));
				apObj.setAppDate(rs.getString("appDate"));
				apObj.setAppTime(rs.getString("appTime"));
				apObj.setServiceID(rs.getInt("serviceID"));
				apObj.setStaffID(rs.getInt("staffID"));
				apObj.setPatientID(rs.getInt("patientID"));
				apObj.setStaffName(rs.getString("staffName"));
				apObj.setPatientName(rs.getString("patientName"));
				apObj.setServiceName(rs.getString("serviceName"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return apObj;
	}

	public void updateAppointment(AppointmentBean ap) throws SQLException{
		initJDBC();
		try{			
			String sqlUpdate = "UPDATE appointment SET appDate = ?, appTime = ?,"
					+ " staffID = ?, serviceID = ?, patientID = ?"
					+ " WHERE appID = ?";

			ps = connection.prepareStatement(sqlUpdate);

			ps.setString(1, ap.getAppDate());
			ps.setString(2, ap.getAppTime());
			ps.setInt(3, ap.getStaffID());
			ps.setInt(4, ap.getServiceID());
			ps.setInt(5, ap.getPatientID());
			ps.setInt(6, ap.getAppID());

			//ps.executeUpdate();
			int i = ps.executeUpdate();

			if(i > 0)
			{
				System.out.println("Record Updated Successfully - appointment");
			}
			else
			{
				System.out.println("There is a problem in updating Record.");
			} 

			System.out.println("update done");
		}catch(Exception ex){
			System.out.println("updateAppointment(): "+ex);
			ex.printStackTrace();	
		}
	}

	public void deleteAppointmentById(int id){
		AppointmentBean apObj = new AppointmentBean();
		try {
			initJDBC();

			String sqlDel = "DELETE FROM appointment WHERE appID ="+id;
			ps = connection.prepareStatement(sqlDel);
			ps.executeUpdate(sqlDel);

		} catch(Exception ex){
			System.out.println("deleteAppointment(): "+ex);
			ex.printStackTrace();	
		}
	}

	public int countAppointment(){
		int counter = 0;
		try {
			initJDBC();

			String sqlCnt = "SELECT count(*) FROM Appointment";
			ps = connection.prepareStatement(sqlCnt);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				counter = rs.getInt("count(*)");
			}
		} catch(Exception ex){
			System.out.println("countAppointment(): "+ex);
			ex.printStackTrace();	
		}
		return counter;
	}
}
