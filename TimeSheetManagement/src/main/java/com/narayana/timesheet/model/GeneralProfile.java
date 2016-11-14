package com.narayana.timesheet.model;

import com.narayana.timesheet.validator.Phone;

public class GeneralProfile {

	private String employee_id;

	private String first_name;
	 
	private String middle_name;

	private String last_name;

	private String primary_email;

	private String secondary_email;

	@Phone(message = "Invalid Phone Number")
	private String work_phone;

	@Phone(message = "Invalid Phone Number")
	private String mobile_phone;

	private String date_of_birth;

	private String ssn;

	private String dl_number;

	private String license_expiry;

	private String gender;
	private String marital_status;
	private String current_status;
	private String employee_type;

	private byte[] image;

	public String getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getMiddle_name() {
		return middle_name;
	}

	public void setMiddle_name(String middle_name) {
		this.middle_name = middle_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getPrimary_email() {
		return primary_email;
	}

	public void setPrimary_email(String primary_email) {
		this.primary_email = primary_email;
	}

	public String getSecondary_email() {
		return secondary_email;
	}

	public void setSecondary_email(String secondary_email) {
		this.secondary_email = secondary_email;
	}

	public String getWork_phone() {
		return work_phone;
	}

	public void setWork_phone(String work_phone) {
		this.work_phone = work_phone;
	}

	public String getMobile_phone() {
		return mobile_phone;
	}

	public void setMobile_phone(String mobile_phone) {
		this.mobile_phone = mobile_phone;
	}

	public String getDate_of_birth() {
		return date_of_birth;
	}

	public void setDate_of_birth(String date_of_birth) {
		this.date_of_birth = date_of_birth;
	}

	public String getSsn() {
		return ssn;
	}

	public void setSsn(String ssn) {
		this.ssn = ssn;
	}

	public String getDl_number() {
		return dl_number;
	}

	public void setDl_number(String dl_number) {
		this.dl_number = dl_number;
	}

	public String getLicense_expiry() {
		return license_expiry;
	}

	public void setLicense_expiry(String license_expiry) {
		this.license_expiry = license_expiry;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMarital_status() {
		return marital_status;
	}

	public void setMarital_status(String marital_status) {
		this.marital_status = marital_status;
	}

	public String getCurrent_status() {
		return current_status;
	}

	public void setCurrent_status(String current_status) {
		this.current_status = current_status;
	}

	public String getEmployee_type() {
		return employee_type;
	}

	public void setEmployee_type(String employee_type) {
		this.employee_type = employee_type;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

}
