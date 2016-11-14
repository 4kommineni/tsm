package com.narayana.timesheet.model;

public class Immigration {
	String employee_id;
	String work_permit;
	String start_date;
	String end_date;
	String passport_number;
	String p_issue_date;
	String p_exp_date;
	String us_entry_date;
	String l9_status;
	String w4_status;

	public Immigration(String employee_id) {
		super();
		this.employee_id = employee_id;
	}

	public Immigration(String employee_id, String work_permit, String start_date, String end_date,
			String passport_number, String p_issue_date, String p_exp_date, String us_entry_date, String l9_status,
			String w4_status) {
		super();
		this.employee_id = employee_id;
		this.work_permit = work_permit;
		this.start_date = start_date;
		this.end_date = end_date;
		this.passport_number = passport_number;
		this.p_issue_date = p_issue_date;
		this.p_exp_date = p_exp_date;
		this.us_entry_date = us_entry_date;
		this.l9_status = l9_status;
		this.w4_status = w4_status;
	}

	public String getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}

	public String getWork_permit() {
		return work_permit;
	}

	public void setWork_permit(String work_permit) {
		this.work_permit = work_permit;
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

	public String getPassport_number() {
		return passport_number;
	}

	public void setPassport_number(String passport_number) {
		this.passport_number = passport_number;
	}

	public String getP_issue_date() {
		return p_issue_date;
	}

	public void setP_issue_date(String p_issue_date) {
		this.p_issue_date = p_issue_date;
	}

	public String getP_exp_date() {
		return p_exp_date;
	}

	public void setP_exp_date(String p_exp_date) {
		this.p_exp_date = p_exp_date;
	}

	public String getUs_entry_date() {
		return us_entry_date;
	}

	public void setUs_entry_date(String us_entry_date) {
		this.us_entry_date = us_entry_date;
	}

	public String getL9_status() {
		return l9_status;
	}

	public void setL9_status(String l9_status) {
		this.l9_status = l9_status;
	}

	public String getW4_status() {
		return w4_status;
	}

	public void setW4_status(String w4_status) {
		this.w4_status = w4_status;
	}

}
