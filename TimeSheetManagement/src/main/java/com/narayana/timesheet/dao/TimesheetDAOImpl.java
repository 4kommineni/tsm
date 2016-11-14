package com.narayana.timesheet.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.narayana.timesheet.model.Timesheet;
import com.narayana.timesheet.model.TimesheetHours;

public class TimesheetDAOImpl implements TimesheetDAO {
	DataSource dataSource;
	JdbcTemplate jdbcTemplate;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@SuppressWarnings("deprecation")
	@Override
	public boolean addTimesheet(String id, String client_name, String sdate, String edate, int hours,
			MultipartFile file) {
		boolean taskDone = false;

		if (timeSheetAlreadyPresent(id, sdate)) {
			return false;
		}
		String query = "insert into timesheet (employee_id,client_name, startdate, enddate, hours, file, status, update_date, file_mime_type, file_name) values (?,?,?,?,?,?,?,now(),?,?)";
		try {
			Object[] args = new Object[] { id, client_name, new java.sql.Date(new java.util.Date(sdate).getTime()),
					new java.sql.Date(new java.util.Date(edate).getTime()), hours, file.getBytes(), "PENDING",
					file.getContentType(), file.getOriginalFilename() };

			int n = jdbcTemplate.update(query, args);
			if (n > 0) {
				taskDone = true;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return taskDone;
	}

	@Override
	public boolean addTimesheetHourly(String id, String[] d, int[] rt, int[] ot, int[] pv, int[] uv) {
		boolean taskDone = false;
		try {
			Connection connection = dataSource.getConnection();
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement
					.executeQuery("select max(timesheet_id) from timesheet where employee_id='" + id + "'");
			resultSet.next();
			int ts_id = resultSet.getInt(1);
			resultSet.close();
			statement.close();
			connection.close();

			String query = "insert into timesheet_hourly (timesheet_id,date,status,rt,ot,pv,uv,total,payslip_date) values (?,?,?,?,?,?,?,?,now())";
			Object[] args;
			int updatedRows = 0;
			for (int i = 0; i < rt.length; i++) {
				args = new Object[] { ts_id,
						new java.sql.Date(new SimpleDateFormat("MM/dd/yyyy").parse(d[i]).getTime()), "PENDING", rt[i],
						ot[i], pv[i], uv[i], (rt[i] + ot[i] + pv[i] + uv[i]) };
				updatedRows += jdbcTemplate.update(query, args);
			}
			if (updatedRows == rt.length) {
				taskDone = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return taskDone;
	}

	@Override
	public ArrayList<Timesheet> getAllTimesheets(String id) {
		ArrayList<Timesheet> allTimesheets = new ArrayList<Timesheet>();
		try {
			Connection connection = dataSource.getConnection();
			Statement statement = connection.createStatement();
			ResultSet rs = statement
					.executeQuery("select * from timesheet where employee_id='" + id + "' order by enddate desc");
			while (rs.next()) {
				allTimesheets.add(new Timesheet(rs.getInt(1), rs.getString(3),
						new SimpleDateFormat("MM/dd/yyyy").format(rs.getDate(4)),
						new SimpleDateFormat("MM/dd/yyyy").format(rs.getDate(5)), rs.getInt(6), rs.getBytes(7),
						rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11)));
			}
			rs.close();
			statement.close();
			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return allTimesheets;
	}

	@Override
	public ArrayList<TimesheetHours> getSearchedTimesheets(String id, String sdate, String edate) {
		ArrayList<TimesheetHours> tsh = new ArrayList<TimesheetHours>();
		try {
			Connection connection = dataSource.getConnection();
			Statement statement1 = connection.createStatement();
			Statement statement2 = connection.createStatement();
			String query = "select timesheet_id,startdate from timesheet where employee_id='" + id + "' and enddate>='"
					+ new java.sql.Date(new SimpleDateFormat("MM/dd/yyyy").parse(sdate).getTime())
					+ "' and startdate<='"
					+ new java.sql.Date(new SimpleDateFormat("MM/dd/yyyy").parse(edate).getTime())
					+ "' order by startdate asc";

			ResultSet rs = statement1.executeQuery(query);

			int timesheet_id;
			ResultSet rst;
			while (rs.next()) {
				timesheet_id = rs.getInt(1);
				query = "select * from timesheet_hourly where timesheet_id=" + timesheet_id;
				rst = statement2.executeQuery(query);
				while (rst.next()) {
					tsh.add(new TimesheetHours(rst.getInt("id"), rst.getInt("timesheet_id"),
							new SimpleDateFormat("MM/dd/yyyy").format(rst.getDate("date")), rst.getString("status"),
							rst.getInt("RT"), rst.getInt("OT"), rst.getInt("PV"), rst.getInt("UV"),
							rst.getInt("total")));
				}
			}
			rs.close();
			statement1.close();
			statement2.close();
			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return tsh;
	}

	private boolean timeSheetAlreadyPresent(String id, String start_date) {
		ArrayList<Timesheet> ts = getAllTimesheets(id);
		for (Timesheet t : ts) {
			if (t.getStart_date().equals(start_date)) {
				return true;
			}
		}
		return false;
	}
}
