package com.narayana.timesheet.dao;

import com.narayana.timesheet.model.ClientProfile;
import com.narayana.timesheet.model.GeneralProfile;
import com.narayana.timesheet.model.PersonalProfile;

public interface ProfileDAO {

	// login verification
	public String isValidUser(String uname,String password);
	
	// General Profile
	public GeneralProfile getGeneralDetails(String id);

	public boolean updateGeneralDetails(GeneralProfile g);

	// Peronal Profile
	public PersonalProfile getPersonalDetails(String id);

	public boolean updatePersonalDetails(PersonalProfile p);

	// Client Profile
	public ClientProfile getClientDetails(String id);

	public boolean updateClientDetails(ClientProfile c);
}
