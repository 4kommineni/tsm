package com.narayana.timesheet.model;

public class PayStubs {
	String payslip_date;
	String start_date;
	String end_date;
	int hours;

	public PayStubs(String payslip_date, String start_date, String end_date, int hours) {
		super();
		this.payslip_date = payslip_date;
		this.start_date = start_date;
		this.end_date = end_date;
		this.hours = hours;
	}

	public String getPayslip_date() {
		return payslip_date;
	}

	public void setPayslip_date(String payslip_date) {
		this.payslip_date = payslip_date;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public int getHours() {
		return hours;
	}

	public void setHours(int hours) {
		this.hours = hours;
	}

}
