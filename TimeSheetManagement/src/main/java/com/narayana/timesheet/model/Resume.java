package com.narayana.timesheet.model;

public class Resume {
	String employee_id;
	String title;
	byte[] file;

	public Resume() {
		super();
	}

	public Resume(String employee_id) {
		super();
		this.employee_id = employee_id;
		this.title=null;
	}

	public Resume(String employee_id, String title, byte[] file) {
		super();
		this.employee_id = employee_id;
		this.title = title;
		this.file = file;
	}

	public String getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public byte[] getFile() {
		return file;
	}

	public void setFile(byte[] file) {
		this.file = file;
	}

}
