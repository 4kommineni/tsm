package com.narayana.timesheet.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.narayana.timesheet.model.AdminTimesheet;
import com.narayana.timesheet.model.AdminTimesheetHours;
import com.narayana.timesheet.model.AllProfiles;
import com.narayana.timesheet.model.ClientProfile;

public class AdminDAOImpl implements AdminDAO {
	DataSource dataSource;
	JdbcTemplate jdbcTemplate;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public boolean checkForAdmin(String email, String password) {
		boolean to_return = false;
		int rowCount = this.jdbcTemplate.queryForObject("select count(*) from admin where username=? and password=?",
				new Object[] { email, password }, Integer.class);
		if (rowCount == 1) {
			to_return = true;
		}
		return to_return;
	}

	@Override
	public String getNewUserId() {
		String id = this.jdbcTemplate.queryForObject(
				"select employee_id from generalprofile order by employee_id desc limit 1", new Object[] {},
				String.class);
		String newid = id.substring(0, 2) + String.format("%03d", (Integer.parseInt(id.substring(2)) + 1));
		return newid;
	}

	@Override
	public void addNewUser(String id, String email, String pswd, String fname, String lname) throws Exception {
		String query = "insert into user values (?,?,?)";
		this.jdbcTemplate.update(query, new Object[] { email, id, pswd });

		query = "insert into generalprofile (employee_id,first_name,last_name,primary_email) values (?,?,?,?)";
		this.jdbcTemplate.update(query, new Object[] { id, fname, lname, email });

		query = "insert into personalprofile (employee_id) values (?)";
		this.jdbcTemplate.update(query, new Object[] { id });

		query = "insert into clientprofile (employee_id) values (?)";
		this.jdbcTemplate.update(query, new Object[] { id });
	}

	@Override
	public void deleteNewUser(String id) {
		String query = "delete from user where employee_id=?";
		this.jdbcTemplate.update(query, new Object[] { id });

		query = "delete from generalprofile where employee_id=?";
		this.jdbcTemplate.update(query, new Object[] { id });

		query = "delete from personalprofile where employee_id=?";
		this.jdbcTemplate.update(query, new Object[] { id });

		query = "delete from clientprofile where employee_id=?";
		this.jdbcTemplate.update(query, new Object[] { id });

	}

	@Override
	public ArrayList<AllProfiles> getallProfiles() {
		String query = "select g.employee_id,first_name,middle_name,last_name,primary_email,mobile_phone,dob,ssn,address1 "
				+ "from generalprofile g, personalprofile p where g.employee_id=p.employee_id";
		List<AllProfiles> all = this.jdbcTemplate.query(query, new RowMapper<AllProfiles>() {
			public AllProfiles mapRow(ResultSet rs, int rowNum) throws SQLException {
				AllProfiles a = new AllProfiles();

				a.setId(rs.getString("employee_id"));
				String name = rs.getString("first_name");
				name += ((rs.getString("middle_name") == null) ? "" : (" " + rs.getString("middle_name")));
				name += " " + rs.getString("last_name");
				a.setName(name);
				a.setEmail(rs.getString("primary_email"));
				a.setPhone(rs.getString("mobile_phone"));
				a.setDob((rs.getDate("dob") == null) ? ""
						: (new SimpleDateFormat("MM/dd/yyyy").format(rs.getDate("dob"))));
				a.setSsn(rs.getString("ssn"));
				String address = "";
				if (rs.getString("address1") != null) {
					String adrs[] = rs.getString("address1").split(";;;");
					address = adrs[0];
					for (int i = 1; i < adrs.length - 1; i++) {
						address += "<br/>" + adrs[i];
					}
				}
				a.setAddress(address);
				return a;
			}
		});
		return new ArrayList<AllProfiles>(all);
	}

	@Override
	public ArrayList<ClientProfile> getallClients() {
		String query = "select * from clientprofile";
		List<ClientProfile> all = this.jdbcTemplate.query(query, new RowMapper<ClientProfile>() {
			@Override
			public ClientProfile mapRow(ResultSet resultSet, int rowNum) throws SQLException {
				ClientProfile clientProfile = new ClientProfile();
				clientProfile.setEmployee_id(resultSet.getString("employee_id"));
				clientProfile.setClient_name(resultSet.getString("client_name"));
				clientProfile.setAddress(resultSet.getString("address"));
				clientProfile.setCity(resultSet.getString("city"));
				clientProfile.setState(resultSet.getString("state"));
				clientProfile.setCountry(resultSet.getString("country"));
				clientProfile.setZipcode(resultSet.getInt("zipcode"));
				clientProfile.setPosition(resultSet.getString("position"));
				clientProfile.setWork_email(resultSet.getString("work_email"));
				clientProfile.setDesk_phone(resultSet.getString("desk_phone"));
				clientProfile.setSupervisor_name(resultSet.getString("supervisor_name"));
				clientProfile.setSupervisor_email(resultSet.getString("supervisor_email"));
				clientProfile.setSupervisor_phone(resultSet.getString("supervisor_phone"));
				clientProfile.setStart_date((resultSet.getDate("start_date") == null) ? ""
						: (new SimpleDateFormat("MM/dd/yyyy").format(resultSet.getDate("start_date"))));
				clientProfile.setEmployment_status(resultSet.getString("employment_status"));
				return clientProfile;
			}
		});
		return new ArrayList<ClientProfile>(all);
	}

	@Override
	public ArrayList<AdminTimesheet> getAllPendingTimesheets() {
		ArrayList<AdminTimesheet> all = new ArrayList<AdminTimesheet>();
		try {
			Connection connection = dataSource.getConnection();
			Statement statement = connection.createStatement();
			ResultSet rs = statement
					.executeQuery("select * from timesheet where status='pending' order by enddate asc");
			while (rs.next()) {
				all.add(new AdminTimesheet(rs.getString(2), rs.getInt(1), rs.getString(3),
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
		return all;
	}

	@Override
	public boolean adminApproveDeny(String task) {
		String query = "update timesheet set status=?,update_date=now() where timesheet_id= ?";
		int n = jdbcTemplate.update(query, new Object[] { task.split("-")[0], Integer.parseInt(task.split("-")[1]) });
		return (n > 0);
	}

	@Override
	public ArrayList<AdminTimesheetHours> adminSearchtimesheet(String s_date, String e_date) {

		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy");
		LocalDate date1 = LocalDate.parse(s_date, dtf);
		LocalDate date2 = LocalDate.parse(e_date, dtf);

		LocalDate prevSun = date1.with(TemporalAdjusters.previous(DayOfWeek.SUNDAY));
		LocalDate nextSun = date2.with(TemporalAdjusters.next(DayOfWeek.SUNDAY));

		String query = "SELECT ts.employee_id,concat(first_name,' ',last_name) as name,"
				+ "min(date),max(date),sum(rt)+sum(ot)+sum(pv)+sum(uv) FROM "
				+ "timesheet_hourly tsh, timesheet ts,generalprofile g where ts.timesheet_id=tsh.timesheet_id and "
				+ "ts.employee_id=g.employee_id and ts.status='approved' and tsh.status='PENDING' and "
				+ "ts.enddate>='" + java.sql.Date.valueOf(prevSun) + "' and ts.startdate<='"
				+ java.sql.Date.valueOf(nextSun) + "' and date>='" + java.sql.Date.valueOf(date1) + "' and date<='"
				+ java.sql.Date.valueOf(date2) + "' group by employee_id";

		List<AdminTimesheetHours> all = this.jdbcTemplate.query(query, new RowMapper<AdminTimesheetHours>() {
			@Override
			public AdminTimesheetHours mapRow(ResultSet rs, int rowNum) throws SQLException {
				return new AdminTimesheetHours(rs.getString(1), rs.getString("name"),
						new SimpleDateFormat("MM/dd/yyyy").format(rs.getDate(3)),
						new SimpleDateFormat("MM/dd/yyyy").format(rs.getDate(4)), rs.getInt(5));
			}
		});
		return new ArrayList<AdminTimesheetHours>(all);
	}

	@Override
	public void payUser(String pay) {
		String[] data = pay.split("::");

		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy");

		LocalDate date1 = LocalDate.parse(data[1], dtf);
		LocalDate date2 = LocalDate.parse(data[2], dtf);

		String query = "SELECT id FROM tsm.timesheet_hourly tsh,timesheet ts where ts.timesheet_id=tsh.timesheet_id and "
				+ "date>='" + java.sql.Date.valueOf(date1) + "' and date<='" + java.sql.Date.valueOf(date2)
				+ "' and ts.employee_id='" + data[0] + "'";
		List<Integer> ids = this.jdbcTemplate.query(query, new RowMapper<Integer>() {
			@Override
			public Integer mapRow(ResultSet rs, int arg1) throws SQLException {
				return rs.getInt("id");
			}
		});
		for (Integer id : ids) {
			query = "update timesheet_hourly set status='PAID' , payslip_date=now() where id=" + id;
			this.jdbcTemplate.update(query);
		}
	}

	@Override
	public String changepassword(String uname, String old_pswd, String new_pswd) {
		String pswd = this.jdbcTemplate.queryForObject("select password from admin where username=?",
				new Object[] { uname }, String.class);
		if (pswd.equals(old_pswd)) {
			String query = "update admin set password=? where username= ?";
			int n = jdbcTemplate.update(query, new Object[] { new_pswd, uname });
			if (n > 0) {
				return "Updated Succesfully";
			} else {
				return "DB ERROR";
			}
		} else {
			return "Invalid Old Password";
		}
	}
}
