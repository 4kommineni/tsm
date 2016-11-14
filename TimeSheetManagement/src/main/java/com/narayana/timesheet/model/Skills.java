package com.narayana.timesheet.model;

import java.util.ArrayList;

public class Skills {
	String employee_id;
	ArrayList<String> skill_name;
	ArrayList<String> exp_years;

	public Skills() {
		super();
	}

	public Skills(String employee_id) {
		super();
		this.employee_id = employee_id;
		skill_name = new ArrayList<String>();
		exp_years = new ArrayList<String>();
	}

	public Skills(String employee_id, ArrayList<String> skill_name, ArrayList<String> exp_years) {
		super();
		this.employee_id = employee_id;
		this.skill_name.clear();
		this.skill_name.addAll(skill_name);
		this.exp_years.clear();
		this.exp_years.addAll(exp_years);
	}

	public String getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}

	public ArrayList<String> getSkill_name() {
		return skill_name;
	}

	public void setSkill_name(ArrayList<String> skill_name) {
		this.skill_name = skill_name;
	}

	public ArrayList<String> getExp_years() {
		return exp_years;
	}

	public void setExp_years(ArrayList<String> exp_years) {
		this.exp_years = exp_years;
	}
}
