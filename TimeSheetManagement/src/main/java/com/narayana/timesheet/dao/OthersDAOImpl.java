package com.narayana.timesheet.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.narayana.timesheet.model.Dependents;
import com.narayana.timesheet.model.EmergencyContact;
import com.narayana.timesheet.model.PayStubs;

public class OthersDAOImpl implements OthersDAO {

	DataSource dataSource;
	JdbcTemplate jdbcTemplate;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public ArrayList<PayStubs> getPayStubs(String id) {
		String query = "SELECT timesheet_id FROM timesheet where employee_id='" + id + "'";
		List<Integer> ids = this.jdbcTemplate.query(query, new RowMapper<Integer>() {
			@Override
			public Integer mapRow(ResultSet rs, int arg1) throws SQLException {
				return rs.getInt("timesheet_id");
			}
		});

		List<PayStubs> allps = new ArrayList<PayStubs>();

		for (Integer tid : ids) {
			query = "SELECT payslip_date,min(date) as start_date,max(date) as end_date,sum(total) as total FROM tsm.timesheet_hourly "
					+ "where status='PAID' and timesheet_id=" + tid + " group by payslip_date;";
			List<PayStubs> ps = this.jdbcTemplate.query(query, new RowMapper<PayStubs>() {
				@Override
				public PayStubs mapRow(ResultSet rs, int arg1) throws SQLException {
					return new PayStubs(new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").format(rs.getDate("payslip_date")),
							new SimpleDateFormat("MM/dd/yyyy").format(rs.getDate("start_date")),
							new SimpleDateFormat("MM/dd/yyyy").format(rs.getDate("end_date")), rs.getInt("total"));
				}
			});
			allps.addAll(ps);
		}
		return new ArrayList<PayStubs>(allps);
	}

	@Override
	public Dependents getDependents(String id) {
		Dependents d = new Dependents(id);
		try {
			Connection connection = dataSource.getConnection();
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from dependents where employee_id='" + id + "'");
			if (resultSet.next()) {
				d.setEmployee_id(resultSet.getString(1));
				d.setDependent_name(new ArrayList<String>(Arrays.asList(resultSet.getString(2).split(";;;"))));
				d.setRelation(new ArrayList<String>(Arrays.asList(resultSet.getString(3).split(";;;"))));
				d.setDob(new ArrayList<String>(Arrays.asList(resultSet.getString(4).split(";;;"))));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return d;
	}

	@Override
	public boolean setDependents(String id, String name, String relation, String dob, Dependents dependents) {
		boolean taskDone = false;

		String query = "";

		if (isVacent("dependents", id)) {
			query = "insert into dependents (dependent_name,relation,dob,employee_id) values (?,?,?,?) ";// for
																											// first
																											// timer
		} else {
			query = "update dependents set dependent_name=?, relation=?, dob=? where employee_id=?";
		}

		String dps = "";
		for (String t : dependents.getDependent_name()) {
			dps += t + ";;;";
		}
		dps += name;

		String rls = "";
		for (String t : dependents.getRelation()) {
			rls += t + ";;;";
		}
		rls += relation;

		String dbs = "";
		for (String t : dependents.getDob()) {
			dbs += t + ";;;";
		}
		dbs += dob;

		Object[] args = new Object[] { dps, rls, dbs, id };

		int n = jdbcTemplate.update(query, args);
		if (n > 0) {
			taskDone = true;
		}

		return taskDone;
	}

	@Override
	public EmergencyContact getEmergencyContact(String id) {
		EmergencyContact ec = new EmergencyContact(id);
		try {
			Connection connection = dataSource.getConnection();
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from emergencycontact where employee_id='" + id + "'");
			if (rs.next()) {
				ec = new EmergencyContact(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6));
			}
			rs.close();
			statement.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ec;
	}

	@Override
	public boolean setEmergencyContact(EmergencyContact ec) {
		boolean taskDone = false;

		String query = "";

		if (isVacent("emergencycontact", ec.getEmployee_id())) { // for first
																	// timer
			query = "insert into emergencycontact (name,relation,work_phone,mobile,home_phone,employee_id) values (?,?,?,?,?,?) ";
		} else {
			query = "update emergencycontact set name=?, relation=?,work_phone=?,mobile=?,home_phone=? where employee_id=?";
		}

		Object[] args = new Object[] { ec.getName(), ec.getRelation(), ec.getWork_phone(), ec.getMobile(),
				ec.getHome_phone(), ec.getEmployee_id() };

		int n = jdbcTemplate.update(query, args);
		if (n > 0) {
			taskDone = true;
		}

		return taskDone;
	}

	@Override
	public String changepassword(String id, String op, String np) {
		String toreturn = "invalid";
		try {
			Connection connection = dataSource.getConnection();
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement
					.executeQuery("select * from user where employee_id='" + id + "' and password='" + op + "'");
			if (resultSet.next()) {
				String query = "update user set password=? where employee_id=?";
				Object[] args = new Object[] { np, id };
				int n = jdbcTemplate.update(query, args);
				if (n > 0) {
					toreturn = "updated";
				} else {
					toreturn = "db error";
				}
			}
			resultSet.close();
			statement.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return toreturn;
	}

	private boolean isVacent(String table, String id) {
		boolean vacent = true;
		try {
			Connection connection = dataSource.getConnection();
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from " + table + " where employee_id='" + id + "'");
			if (resultSet.next()) {
				vacent = false;
			}
			resultSet.close();
			statement.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vacent;
	}
}
