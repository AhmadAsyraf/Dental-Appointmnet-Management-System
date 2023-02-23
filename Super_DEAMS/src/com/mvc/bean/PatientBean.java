package com.mvc.bean;

public class PatientBean {
	int patientID;
	String patientName;
	int patientAge;
	String patientGender;
	String patientPhone;
	String patientMail;
	String patientPass;
	
	public PatientBean() {
		patientID = 0;
		patientName = "";
		patientAge = 0;
		patientGender = "";
		patientPhone = "";
		patientMail = "";
		patientPass = "";
	}

	public PatientBean(int patientID, String patientName, int patientAge, String patientGender, 
					String patientPhone, String patientMail, String patientPass) {
		super();
		this.patientID = patientID;
		this.patientName = patientName;
		this.patientAge = patientAge;
		this.patientGender = patientGender;
		this.patientPhone = patientPhone;
		this.patientMail = patientMail;
		this.patientPass = patientPass;
	}

	public int getPatientID() {
		return patientID;
	}

	public void setPatientID(int patientID) {
		this.patientID = patientID;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public int getPatientAge() {
		return patientAge;
	}

	public void setPatientAge(int patientAge) {
		this.patientAge = patientAge;
	}

	public String getPatientGender() {
		return patientGender;
	}

	public void setPatientGender(String patientGender) {
		this.patientGender = patientGender;
	}

	public String getPatientPhone() {
		return patientPhone;
	}

	public void setPatientPhone(String patientPhone) {
		this.patientPhone = patientPhone;
	}
	
	public String getPatientMail() {
		return patientMail;
	}

	public void setPatientMail(String patientMail) {
		this.patientMail = patientMail;
	}
	public String getPatientPass() {
		return patientPass;
	}

	public void setPatientPass(String patientPass) {
		this.patientPass = patientPass;
	}
}
