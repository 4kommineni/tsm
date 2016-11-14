package com.narayana.timesheet.dao;

import java.util.ArrayList;

import com.narayana.timesheet.model.AdminTimesheet;
import com.narayana.timesheet.model.AdminTimesheetHours;
import com.narayana.timesheet.model.AllProfiles;
import com.narayana.timesheet.model.ClientProfile;

public interface AdminDAO {

	public boolean checkForAdmin(String email, String password);

	public String getNewUserId();

	public void addNewUser(String id, String email, String pswd, String fname, String lname) throws Exception;
	
	public void deleteNewUser(String id);
	
	public ArrayList<AllProfiles> getallProfiles();

	public ArrayList<ClientProfile> getallClients();

	public ArrayList<AdminTimesheet> getAllPendingTimesheets();

	public boolean adminApproveDeny(String task);

	public ArrayList<AdminTimesheetHours> adminSearchtimesheet(String s_date, String e_date);

	public void payUser(String pay);

	public String changepassword(String uname, String old_pswd, String new_pswd);
}
