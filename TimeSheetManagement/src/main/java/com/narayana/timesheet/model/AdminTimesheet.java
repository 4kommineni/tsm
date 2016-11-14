package com.narayana.timesheet.model;

import java.util.ArrayList;

public class AdminTimesheet {
	String employee_id;
	int timesheet_id;
	String client_name;
	String start_date;
	String end_date;
	int hours;
	byte[] file;
	String status;
	String update_date;
	String file_mime_type;
	String file_name;
	ArrayList<TimesheetHours> tsh;

	public AdminTimesheet(String employee_id,int timesheet_id, String client_name, String start_date,
			String end_date, int hours, byte[] file, String status, String update_date, String file_mime_type,
			String file_name, ArrayList<TimesheetHours> tsh) {
		super();
		this.employee_id = employee_id;
		this.timesheet_id = timesheet_id;
		this.client_name = client_name;
		this.start_date = start_date;
		this.end_date = end_date;
		this.hours = hours;
		this.file = file;
		this.status = status;
		this.update_date = update_date;
		this.file_mime_type = file_mime_type;
		this.file_name = file_name;
		this.tsh = tsh;
	}

	public AdminTimesheet(String employee_id, int timesheet_id, String client_name, String start_date,
			String end_date, int hours, byte[] file, String status, String update_date, String file_mime_type,
			String file_name) {
		super();
		this.employee_id = employee_id;
		this.timesheet_id = timesheet_id;
		this.client_name = client_name;
		this.start_date = start_date;
		this.end_date = end_date;
		this.hours = hours;
		this.file = file;
		this.status = status;
		this.update_date = update_date;
		this.file_mime_type = file_mime_type;
		this.file_name = file_name;
		this.tsh = null;
	}

	public String getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}
	
	public int getTimesheet_id() {
		return timesheet_id;
	}

	public void setTimesheet_id(int timesheet_id) {
		this.timesheet_id = timesheet_id;
	}

	public String getClient_name() {
		return client_name;
	}

	public void setClient_name(String client_name) {
		this.client_name = client_name;
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

	public byte[] getFile() {
		return file;
	}

	public void setFile(byte[] file) {
		this.file = file;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}

	public String getFile_mime_type() {
		return file_mime_type;
	}

	public void setFile_mime_type(String file_mime_type) {
		this.file_mime_type = file_mime_type;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public ArrayList<TimesheetHours> getTsh() {
		return tsh;
	}

	public void setTsh(ArrayList<TimesheetHours> tsh) {
		this.tsh = tsh;
	}
}
