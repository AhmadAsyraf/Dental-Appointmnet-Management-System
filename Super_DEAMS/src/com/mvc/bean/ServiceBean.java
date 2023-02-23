package com.mvc.bean;

public class ServiceBean {
	int serviceID;
	String serviceName;
	int servicePrice;
	
	public ServiceBean() {
		super();
	}

	public ServiceBean(int serviceID, String serviceName, int servicePrice) {
		super();
		this.serviceID = serviceID;
		this.serviceName = serviceName;
		this.servicePrice = servicePrice;
	}

	public int getServiceID() {
		return serviceID;
	}

	public void setServiceID(int serviceID) {
		this.serviceID = serviceID;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public int getServicePrice() {
		return servicePrice;
	}

	public void setServicePrice(int servicePrice) {
		this.servicePrice = servicePrice;
	}
}
