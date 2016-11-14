package com.narayana.timesheet.model;

public class EmergencyContact {
	String employee_id;
	String name;
	String relation;
	String work_phone;
	String mobile;
	String home_phone;

	public EmergencyContact() {
		super();
	}

	public EmergencyContact(String employee_id) {
		super();
		this.employee_id = employee_id;
	}

	public EmergencyContact(String employee_id, String name, String relation, String work_phone, String mobile,
			String home_phone) {
		super();
		this.employee_id = employee_id;
		this.name = name;
		this.relation = relation;
		this.work_phone = work_phone;
		this.mobile = mobile;
		this.home_phone = home_phone;
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

	public String getRelation() {
		return relation;
	}

	public void setRelation(String relation) {
		this.relation = relation;
	}

	public String getWork_phone() {
		return work_phone;
	}

	public void setWork_phone(String work_phone) {
		this.work_phone = work_phone;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getHome_phone() {
		return home_phone;
	}

	public void setHome_phone(String home_phone) {
		this.home_phone = home_phone;
	}

}
