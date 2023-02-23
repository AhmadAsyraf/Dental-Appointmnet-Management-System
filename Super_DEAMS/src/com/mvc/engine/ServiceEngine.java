package com.mvc.engine;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mvc.bean.ServiceBean;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class ServiceEngine {
	private Statement statement;
	private PreparedStatement ps;
	private Connection connection;
	
	public ServiceEngine() {
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
	
	public  ArrayList<ServiceBean> viewServices(){
		
		ArrayList<ServiceBean> svList= null;

		try{
			initJDBC();
			svList = new ArrayList<ServiceBean>();
			statement = (Statement) connection.createStatement();

			// Execute a statement
			ResultSet rs = statement.executeQuery("SELECT * FROM services");

			while(rs.next()){
				ServiceBean sv = new ServiceBean();
				sv.setServiceID(rs.getInt("serviceID"));
				sv.setServiceName(rs.getString("serviceName"));
				sv.setServicePrice(rs.getInt("servicePrice"));

				svList.add(sv);
			}
			
			// Close the connection
			connection.close();
		}catch(Exception ex){
			System.out.println("viewServices(): "+ex);
			ex.printStackTrace();	
		}
		return svList;
	}
	
	public void addServices(ServiceBean sv) throws SQLException{
		initJDBC();
		try{
			String sql = "INSERT INTO services (serviceName, servicePrice) VALUES (?, ?)";
			 
			ps = connection.prepareStatement(sql);
			ps.setString(1, sv.getServiceName());
			ps.setInt(2, sv.getServicePrice());
			
			int rowsInserted = ps.executeUpdate();
			
			if (rowsInserted > 0) {
			    System.out.println("A new services was inserted successfully!");
			}
			
		}catch(Exception ex){
			System.out.println("addServices(): "+ex);
			ex.printStackTrace();	
		}
	}
	
	public ArrayList<ServiceBean> viewServicesById(){

		ArrayList<ServiceBean> svList= null;
		try{
			initJDBC();
			svList = new ArrayList<ServiceBean>();
			statement = (Statement) connection.createStatement();

			// Execute a statement
			ResultSet rs = statement.executeQuery("SELECT * FROM services WHERE serviceID = '?'");
			
			while(rs.next()){
				ServiceBean sv = new ServiceBean();
				sv.setServiceID(rs.getInt("serviceID"));
				sv.setServiceName(rs.getString("serviceName"));
				sv.setServicePrice(rs.getInt("servicePrice"));

				svList.add(sv);
			}

			// Close the connection
			connection.close();
		}catch(Exception ex){
			System.out.println("viewServicesById(): "+ex);
			ex.printStackTrace();	
		}
		return svList;
	}
	
	public ServiceBean getServicesById(int id){

		ServiceBean svObj = new ServiceBean();
		try {
			initJDBC();
				
			String sqlRet = "SELECT * FROM services WHERE serviceID ="+id;
			ps = connection.prepareStatement(sqlRet);

			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				svObj.setServiceID(rs.getInt(1));
				svObj.setServiceName(rs.getString(2));
				svObj.setServicePrice(rs.getInt(3));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return svObj;
	}
	
	public void updateServices(ServiceBean sv) throws SQLException{
		initJDBC();
		try{			
			String sqlUpdate = "UPDATE services SET serviceName = ?, servicePrice = ?"
							 + " WHERE serviceID = ?";
			
			ps = connection.prepareStatement(sqlUpdate);
			
			ps.setString(1, sv.getServiceName());
			ps.setInt(2, sv.getServicePrice());
			ps.setInt(3, sv.getServiceID());
			
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
			System.out.println("updateServices(): "+ex);
			ex.printStackTrace();	
		}
	}
	
	public void deleteServicesById(int id){

		ServiceBean svObj = new ServiceBean();
		try {
			initJDBC();
				
			String sqlDel = "DELETE FROM services WHERE serviceID ="+id;
			ps = connection.prepareStatement(sqlDel);
			ps.executeUpdate(sqlDel);
			
		} catch(Exception ex){
			System.out.println("deleteServices(): "+ex);
			ex.printStackTrace();	
		}
	}
}
