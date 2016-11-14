package com.narayana.timesheet.model;

import java.util.ArrayList;

public class Dependents {

	String employee_id;
	ArrayList<String> dependent_name;
	ArrayList<String> relation;
	ArrayList<String> dob;

	public Dependents() {
		super();
	}

	public Dependents(String employee_id) {
		super();
		this.employee_id = employee_id;
		dependent_name = new ArrayList<String>();
		relation = new ArrayList<String>();
		dob = new ArrayList<String>();
	}

	public Dependents(String employee_id, ArrayList<String> dependent_name, ArrayList<String> relation,
			ArrayList<String> dob) {
		super();
		this.employee_id = employee_id;
		this.dependent_name.clear();
		this.dependent_name.addAll(dependent_name);
		this.relation.clear();
		this.relation.addAll(relation);
		this.dob.clear();
		this.dob.addAll(dob);
	}

	public String getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}

	public ArrayList<String> getDependent_name() {
		return dependent_name;
	}

	public void setDependent_name(ArrayList<String> dependent_name) {
		this.dependent_name = dependent_name;
	}

	public ArrayList<String> getRelation() {
		return relation;
	}

	public void setRelation(ArrayList<String> relation) {
		this.relation = relation;
	}

	public ArrayList<String> getDob() {
		return dob;
	}

	public void setDob(ArrayList<String> dob) {
		this.dob = dob;
	}

}
