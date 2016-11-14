package com.narayana.timesheet.model;

import com.narayana.timesheet.validator.Phone;

public class ClientProfile {

	private String employee_id;
	private String client_name;
	private String address;
	private String city;
	private String state;
	private String country;
	private int zipcode;
	private String position;
	private String work_email;

	@Phone(message = "Invalid Desk Phone Number")
	private String desk_phone;
	private String supervisor_name;
	private String supervisor_email;

	@Phone(message = "Invalid Supervisor Phone Number")
	private String supervisor_phone;
	private String start_date;
	private String employment_status;

	public String getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}

	public String getClient_name() {
		return client_name;
	}

	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public int getZipcode() {
		return zipcode;
	}

	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getWork_email() {
		return work_email;
	}

	public void setWork_email(String work_email) {
		this.work_email = work_email;
	}

	public String getDesk_phone() {
		return desk_phone;
	}

	public void setDesk_phone(String desk_phone) {
		this.desk_phone = desk_phone;
	}

	public String getSupervisor_name() {
		return supervisor_name;
	}

	public void setSupervisor_name(String supervisor_name) {
		this.supervisor_name = supervisor_name;
	}

	public String getSupervisor_email() {
		return supervisor_email;
	}

	public void setSupervisor_email(String supervisor_email) {
		this.supervisor_email = supervisor_email;
	}

	public String getSupervisor_phone() {
		return supervisor_phone;
	}

	public void setSupervisor_phone(String supervisor_phone) {
		this.supervisor_phone = supervisor_phone;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEmployment_status() {
		return employment_status;
	}

	public void setEmployment_status(String employment_status) {
		this.employment_status = employment_status;
	}

}
