package com.mvc.bean;

public class TimeBean {
	
		int bookingTimeId;
		String bookingTimeSlot;
		
		public TimeBean() {
			super();
		}

		public TimeBean(int bookingTimeId, String bookingTimeSlot) {
			super();
			this.bookingTimeId = bookingTimeId;
			this.bookingTimeSlot = bookingTimeSlot;
		}

		public int getBookingTimeId() {
			return bookingTimeId;
		}

		public void setBookingTimeId(int bookingTimeId) {
			this.bookingTimeId = bookingTimeId;
		}

		public String getBookingTimeSlot() {
			return bookingTimeSlot;
		}

		public void setBookingTimeSlot(String bookingTimeSlot) {
			this.bookingTimeSlot = bookingTimeSlot;
		}
}
