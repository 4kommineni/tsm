package com.narayana.timesheet.dao;

import com.narayana.timesheet.model.Immigration;

public interface ImmigrationDAO {

	public Immigration getImmigration(String id);
	public boolean setImmigration(Immigration i);
}
