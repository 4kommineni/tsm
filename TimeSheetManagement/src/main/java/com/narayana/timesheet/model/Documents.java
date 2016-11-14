package com.narayana.timesheet.model;

public class Documents {

	String employee_id;
	String title;
	String upload_date;
	String exp_date;
	byte[] file;

	public Documents() {

	}

	public Documents(String employee_id, String title, String upload_date, String exp_date, byte[] file) {
		super();
		this.employee_id = employee_id;
		this.title = title;
		this.upload_date = upload_date;
		this.exp_date = exp_date;
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

	public String getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(String upload_date) {
		this.upload_date = upload_date;
	}

	public String getExp_date() {
		return exp_date;
	}

	public void setExp_date(String exp_date) {
		this.exp_date = exp_date;
	}

	public byte[] getFile() {
		return file;
	}

	public void setFile(byte[] file) {
		this.file = file;
	}

}
