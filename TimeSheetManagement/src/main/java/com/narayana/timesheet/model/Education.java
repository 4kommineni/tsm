package com.narayana.timesheet.model;

public class Education {

	String employee_id;
	String university;
	String degree;
	String specialization;
	String gpa;
	String gyear;

	public Education() {
		super();
	}

	public Education(String employee_id, String university, String degree, String specialization, String gpa, String gyear) {
		super();
		this.employee_id = employee_id;
		this.university = university;
		this.degree = degree;
		this.specialization = specialization;
		this.gpa = gpa;
		this.gyear = gyear;
	}

	public String getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}

	public String getUniversity() {
		return university;
	}

	public void setUniversity(String university) {
		this.university = university;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getSpecialization() {
		return specialization;
	}

	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}

	public String getGpa() {
		return gpa;
	}

	public void setGpa(String gpa) {
		this.gpa = gpa;
	}

	public String getGyear() {
		return gyear;
	}

	public void setGyear(String gyear) {
		this.gyear = gyear;
	}
}
