package com.narayana.timesheet.dao;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.narayana.timesheet.model.Timesheet;
import com.narayana.timesheet.model.TimesheetHours;

public interface TimesheetDAO {
	// Time sheet table
	public boolean addTimesheet(String id, String client_name, String sdate, String edate, int hours,
			MultipartFile file);

	// time sheet hourly table
	public boolean addTimesheetHourly(String id, String[] d, int[] rt, int[] ot, int[] pv, int[] uv);

	// get all time sheets
	public ArrayList<Timesheet> getAllTimesheets(String id);

	// get all time sheets
	public ArrayList<TimesheetHours> getSearchedTimesheets(String id, String sdate, String edate);

}
