package com.mvc.bean;

public class AppointmentBean {
	
		int appID;
		String appDate;
		String appTime;
		int staffID;
		int serviceID;
		int patientID;
		String staffName;
		String patientName;
		String serviceName;
		
		public AppointmentBean() {
			super();
		}

		public AppointmentBean(int appID, String appDate, String appTime, int staffID, int serviceID, int patientID,
				String staffName, String patientName, String serviceName) {
			super();
			this.appID = appID;
			this.appDate = appDate;
			this.appTime = appTime;
			this.staffID = staffID;
			this.serviceID = serviceID;
			this.patientID = patientID;
			this.staffName = staffName;
			this.patientName = patientName;
			this.serviceName = serviceName;
		}

		public int getAppID() {
			return appID;
		}

		public void setAppID(int appID) {
			this.appID = appID;
		}

		public String getAppDate() {
			return appDate;
		}

		public void setAppDate(String appDate) {
			this.appDate = appDate;
		}

		public String getAppTime() {
			return appTime;
		}

		public void setAppTime(String appTime) {
			this.appTime = appTime;
		}

		public int getStaffID() {
			return staffID;
		}

		public void setStaffID(int staffID) {
			this.staffID = staffID;
		}

		public int getServiceID() {
			return serviceID;
		}

		public void setServiceID(int serviceID) {
			this.serviceID = serviceID;
		}

		public int getPatientID() {
			return patientID;
		}

		public void setPatientID(int patientID) {
			this.patientID = patientID;
		}

		public String getStaffName() {
			return staffName;
		}

		public void setStaffName(String staffName) {
			this.staffName = staffName;
		}

		public String getPatientName() {
			return patientName;
		}

		public void setPatientName(String patientName) {
			this.patientName = patientName;
		}

		public String getServiceName() {
			return serviceName;
		}

		public void setServiceName(String serviceName) {
			this.serviceName = serviceName;
		}
		
}
