package com.mvc.bean;

public class StaffBean {
	int staffID;
	String staffName;
	String staffAddress;
	String staffPhone;
	String staffMail;
	String staffPass;

	public StaffBean(){
		staffID = 0;
		staffName = "";
		staffAddress = "";
		staffPhone = "";
		staffMail = "";
		staffPass = "";
	}

	public StaffBean(int staffID, String staffName, String staffAddress, String staffPhone, String staffMail,
			String staffPass) {
		super();
		this.staffID = staffID;
		this.staffName = staffName;
		this.staffAddress = staffAddress;
		this.staffPhone = staffPhone;
		this.staffMail = staffMail;
		this.staffPass = staffPass;
	}

	public int getStaffID() {
		return staffID;
	}

	public void setStaffID(int staffID) {
		this.staffID = staffID;
	}

	public String getStaffName() {
		return staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	public String getStaffAddress() {
		return staffAddress;
	}

	public void setStaffAddress(String staffAddress) {
		this.staffAddress = staffAddress;
	}

	public String getStaffPhone() {
		return staffPhone;
	}

	public void setStaffPhone(String staffPhone) {
		this.staffPhone = staffPhone;
	}

	public String getStaffMail() {
		return staffMail;
	}

	public void setStaffMail(String staffMail) {
		this.staffMail = staffMail;
	}

	public String getStaffPass() {
		return staffPass;
	}

	public void setStaffPass(String staffPass) {
		this.staffPass = staffPass;
	}
}
