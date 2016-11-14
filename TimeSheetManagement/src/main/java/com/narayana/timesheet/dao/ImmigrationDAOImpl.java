package com.narayana.timesheet.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.narayana.timesheet.model.Immigration;

public class ImmigrationDAOImpl implements ImmigrationDAO {
	DataSource dataSource;
	JdbcTemplate jdbcTemplate;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public Immigration getImmigration(String id) {
		Immigration i = new Immigration(id);
		try {
			Connection con = dataSource.getConnection();
			Statement stmt = con.createStatement();
			String query = "select * from immigration where employee_id='" + id + "'";
			ResultSet rs = stmt.executeQuery(query);
			if (rs.next()) {
				i = new Immigration(rs.getString(1), rs.getString(2),
						new SimpleDateFormat("MM/dd/yyyy").format(rs.getDate(3)),
						new SimpleDateFormat("MM/dd/yyyy").format(rs.getDate(4)), rs.getString(5),
						new SimpleDateFormat("MM/dd/yyyy").format(rs.getDate(6)),
						new SimpleDateFormat("MM/dd/yyyy").format(rs.getDate(7)),
						new SimpleDateFormat("MM/dd/yyyy").format(rs.getDate(8)), rs.getString(9), rs.getString(10));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public boolean setImmigration(Immigration i) {
		boolean taskDone = false;
		try {
			String query = "update immigration set work_permit=?,start_date=?,end_date=?,"
					+ "passport_number=?, p_issue_date=?, p_exp_date=?, us_entry_date=?, l9_status=?, w4_status=? "
					+ "where employee_id=?";
			Object[] args = { i.getWork_permit(),
					new java.sql.Date(new SimpleDateFormat("MM/dd/yyyy").parse(i.getStart_date()).getTime()),
					new java.sql.Date(new SimpleDateFormat("MM/dd/yyyy").parse(i.getEnd_date()).getTime()),
					i.getPassport_number(),
					new java.sql.Date(new SimpleDateFormat("MM/dd/yyyy").parse(i.getP_issue_date()).getTime()),
					new java.sql.Date(new SimpleDateFormat("MM/dd/yyyy").parse(i.getP_exp_date()).getTime()),
					new java.sql.Date(new SimpleDateFormat("MM/dd/yyyy").parse(i.getUs_entry_date()).getTime()),
					i.getL9_status(), i.getW4_status(), i.getEmployee_id() };

			int n = jdbcTemplate.update(query, args);
			if (n > 0) {
				taskDone = true;
			} else {
				query = "insert into immigration values (?,?,?,?,?,?,?,?,?,?)"; // for first timer
				Object[] args1 = { i.getEmployee_id(), i.getWork_permit(),
						new java.sql.Date(new SimpleDateFormat("MM/dd/yyyy").parse(i.getStart_date()).getTime()),
						new java.sql.Date(new SimpleDateFormat("MM/dd/yyyy").parse(i.getEnd_date()).getTime()),
						i.getPassport_number(),
						new java.sql.Date(new SimpleDateFormat("MM/dd/yyyy").parse(i.getP_issue_date()).getTime()),
						new java.sql.Date(new SimpleDateFormat("MM/dd/yyyy").parse(i.getP_exp_date()).getTime()),
						new java.sql.Date(new SimpleDateFormat("MM/dd/yyyy").parse(i.getUs_entry_date()).getTime()),
						i.getL9_status(), i.getW4_status() };

				n = jdbcTemplate.update(query, args1);
				if (n > 0) {
					taskDone = true;
				}
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return taskDone;
	}

}
