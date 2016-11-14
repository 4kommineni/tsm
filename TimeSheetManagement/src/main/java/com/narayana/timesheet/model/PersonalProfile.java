package com.narayana.timesheet.model;

import com.narayana.timesheet.validator.Phone;

public class PersonalProfile {

	private String employee_id;

	private String apt1;

	private String city1;

	private String state1;

	private String country1;

	private int zipcode1;

	@Phone(message = "Invalid Phone Number")
	private String home_phone1;

	private String copyAdrs;

	private String apt2;

	private String city2;

	private String state2;

	private String country2;

	private int zipcode2;

	private String home_phone2;

	public String getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}

	public String getApt1() {
		return apt1;
	}

	public void setApt1(String apt1) {
		this.apt1 = apt1;
	}

	public String getCity1() {
		return city1;
	}

	public void setCity1(String city1) {
		this.city1 = city1;
	}

	public String getState1() {
		return state1;
	}

	public void setState1(String state1) {
		this.state1 = state1;
	}

	public String getCountry1() {
		return country1;
	}

	public void setCountry1(String country1) {
		this.country1 = country1;
	}

	public int getZipcode1() {
		return zipcode1;
	}

	public void setZipcode1(int zipcode1) {
		this.zipcode1 = zipcode1;
	}

	public String getHome_phone1() {
		return home_phone1;
	}

	public void setHome_phone1(String home_phone1) {
		this.home_phone1 = home_phone1;
	}

	public String getCopyAdrs() {
		return copyAdrs;
	}

	public void setCopyAdrs(String copyAdrs) {
		this.copyAdrs = copyAdrs;
	}

	public String getApt2() {
		return apt2;
	}

	public void setApt2(String apt2) {
		this.apt2 = apt2;
	}

	public String getCity2() {
		return city2;
	}

	public void setCity2(String city2) {
		this.city2 = city2;
	}

	public String getState2() {
		return state2;
	}

	public void setState2(String state2) {
		this.state2 = state2;
	}

	public String getCountry2() {
		return country2;
	}

	public void setCountry2(String country2) {
		this.country2 = country2;
	}

	public int getZipcode2() {
		return zipcode2;
	}

	public void setZipcode2(int zipcode2) {
		this.zipcode2 = zipcode2;
	}

	public String getHome_phone2() {
		return home_phone2;
	}

	public void setHome_phone2(String home_phone2) {
		this.home_phone2 = home_phone2;
	}

}