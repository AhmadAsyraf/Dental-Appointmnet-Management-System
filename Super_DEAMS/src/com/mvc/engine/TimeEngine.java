package com.mvc.engine;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mvc.bean.TimeBean;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class TimeEngine {
	
		private Statement statement;
		private PreparedStatement ps;
		private Connection connection;
		
		public TimeEngine() {
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
		
		public ArrayList<TimeBean> viewBookingTime(){

			ArrayList<TimeBean> btList= null;

			try{
				initJDBC();
				btList = new ArrayList<TimeBean>();
				statement = (Statement) connection.createStatement();

				// Execute a statement
				ResultSet rs = statement.executeQuery("SELECT * FROM bookingtime");

				while(rs.next()){
					TimeBean bt = new TimeBean();
					bt.setBookingTimeId(rs.getInt("bookingTimeId"));
					bt.setBookingTimeSlot(rs.getString("bookingTimeSlot"));

					btList.add(bt);
				}

				// Close the connection
				connection.close();
			}catch(Exception ex){
				System.out.println("viewBookingTime(): "+ex);
				ex.printStackTrace();	
			}
			return btList;
		}
		
		public void addBookingTime(TimeBean bt) throws SQLException{
			initJDBC();
			try{
				String sql = "INSERT INTO bookingtime (bookingTimeslot) "
						+ "VALUES ( ?, ?)";

				ps = connection.prepareStatement(sql);
				ps.setString(1, bt.getBookingTimeSlot());

				int rowsInserted = ps.executeUpdate();

				if (rowsInserted > 0) {
					System.out.println("A new appointment was inserted successfully!");
				}

			}catch(Exception ex){
				System.out.println("addBookingTime(): "+ex);
				ex.printStackTrace();	
			}
		}
}
