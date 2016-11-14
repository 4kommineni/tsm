package com.narayana.timesheet.model;

public class AdminTimesheetHours {
	String employee_id;
	String name;
	String start_date;
	String end_date;
	int total;

	public AdminTimesheetHours(String employee_id, String name, String start_date, String end_date, int total) {
		super();
		this.employee_id = employee_id;
		this.name = name;
		this.start_date = start_date;
		this.end_date = end_date;
		this.total = total;
	}

	public String getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

}
