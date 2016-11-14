package com.narayana.timesheet.model;

public class TimesheetHours {
	int id;
	int tid;
	String date;
	String status;
	int rt;
	int ot;
	int pv;
	int uv;
	int total;

	public TimesheetHours(int id, int tid, String date, String status, int rt, int ot, int pv, int uv, int total) {
		super();
		this.id = id;
		this.tid = tid;
		this.date = date;
		this.status = status;
		this.rt = rt;
		this.ot = ot;
		this.pv = pv;
		this.uv = uv;
		this.total = total;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getRt() {
		return rt;
	}

	public void setRt(int rt) {
		this.rt = rt;
	}

	public int getOt() {
		return ot;
	}

	public void setOt(int ot) {
		this.ot = ot;
	}

	public int getPv() {
		return pv;
	}

	public void setPv(int pv) {
		this.pv = pv;
	}

	public int getUv() {
		return uv;
	}

	public void setUv(int uv) {
		this.uv = uv;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

}