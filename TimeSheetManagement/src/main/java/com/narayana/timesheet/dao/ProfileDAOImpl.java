package com.narayana.timesheet.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.narayana.timesheet.model.ClientProfile;
import com.narayana.timesheet.model.GeneralProfile;
import com.narayana.timesheet.model.PersonalProfile;

public class ProfileDAOImpl implements ProfileDAO {

	DataSource dataSource;
	JdbcTemplate jdbcTemplate;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public String isValidUser(String uname, String password) {
		String validUser = "No";
		try {
			Connection connection = dataSource.getConnection();
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement
					.executeQuery("select * from user where email_id='" + uname + "' and password='" + password + "'");
			if (resultSet.next()) {
				validUser = resultSet.getString("employee_id");
			}
			resultSet.close();
			statement.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return validUser;
	}

	@Override
	public GeneralProfile getGeneralDetails(String id) {
		GeneralProfile generalProfile = new GeneralProfile();
		try {
			Connection connection = dataSource.getConnection();
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from generalprofile where employee_id='" + id + "'");
			if (resultSet.next()) {
				generalProfile.setEmployee_id(id);
				generalProfile.setFirst_name((resultSet.getString(2)));
				generalProfile.setMiddle_name(resultSet.getString(3));
				generalProfile.setLast_name(resultSet.getString(4));
				generalProfile.setPrimary_email(resultSet.getString(5));
				generalProfile.setSecondary_email(resultSet.getString(6));
				generalProfile.setWork_phone(resultSet.getString(7));
				generalProfile.setMobile_phone(resultSet.getString(8));
				generalProfile.setDate_of_birth((resultSet.getDate(9) == null) ? ""
						: (new SimpleDateFormat("MM/dd/yyyy").format(resultSet.getDate(9))));
				generalProfile.setSsn(resultSet.getString(10));
				generalProfile.setDl_number(resultSet.getString(11));
				generalProfile.setLicense_expiry((resultSet.getDate(12) == null) ? ""
						: (new SimpleDateFormat("MM/dd/yyyy").format(resultSet.getDate(12))));
				generalProfile.setGender(resultSet.getString(13));
				generalProfile.setMarital_status(resultSet.getString(14));
				generalProfile.setCurrent_status(resultSet.getString(15));
				generalProfile.setEmployee_type(resultSet.getString(16));
				generalProfile.setImage(resultSet.getBytes(17));
			}

			resultSet.close();
			statement.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return generalProfile;
	}

	@SuppressWarnings("deprecation")
	@Override
	public boolean updateGeneralDetails(GeneralProfile g) {
		boolean updated = false;
		String query = "";
		Object[] args = null;
		if ((g.getImage().length == 0)) {
			query = "update generalprofile set first_name=?,middle_name=?,last_name=?,primary_email=?,secondary_email=?,"
					+ "work_phone=?,mobile_phone=?,dob=?,ssn=?,dl_number=?,license_exp=?,gender=?,"
					+ "marital_status=?,current_status=?,employee_type=? where employee_id=?";

			args = new Object[] { g.getFirst_name(), g.getMiddle_name(), g.getLast_name(), g.getPrimary_email(),
					g.getSecondary_email(), g.getWork_phone(), g.getMobile_phone(),
					new java.sql.Date(new java.util.Date(g.getDate_of_birth()).getTime()), g.getSsn(), g.getDl_number(),
					new java.sql.Date(new java.util.Date(g.getLicense_expiry()).getTime()), g.getGender(),
					g.getMarital_status(), g.getCurrent_status(), g.getEmployee_type(), g.getEmployee_id() };
		} else {
			query = "update generalprofile set first_name=?,middle_name=?,last_name=?,primary_email=?,secondary_email=?,"
					+ "work_phone=?,mobile_phone=?,dob=?,ssn=?,dl_number=?,license_exp=?,gender=?,"
					+ "marital_status=?,current_status=?,employee_type=?,image=? where employee_id=?";

			args = new Object[] { g.getFirst_name(), g.getMiddle_name(), g.getLast_name(), g.getPrimary_email(),
					g.getSecondary_email(), g.getWork_phone(), g.getMobile_phone(),
					new java.sql.Date(new java.util.Date(g.getDate_of_birth()).getTime()), g.getSsn(), g.getDl_number(),
					new java.sql.Date(new java.util.Date(g.getLicense_expiry()).getTime()), g.getGender(),
					g.getMarital_status(), g.getCurrent_status(), g.getEmployee_type(), g.getImage(),
					g.getEmployee_id() };
		}
		int n = jdbcTemplate.update(query, args);
		if (n > 0) {
			updated = true;
		}
		return updated;
	}

	@Override
	public PersonalProfile getPersonalDetails(String id) {
		PersonalProfile personalProfile = new PersonalProfile();
		try {
			Connection connection = dataSource.getConnection();
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement
					.executeQuery("select * from personalprofile where employee_id='" + id + "'");
			if (resultSet.next()) {
				personalProfile.setEmployee_id(id);
				personalProfile.setCopyAdrs(resultSet.getString(4));

				if (resultSet.getString(2) != null) {
					String address1[] = resultSet.getString(2).split(";;;");
					personalProfile.setApt1(address1[0].equals("-") ? "" : address1[0]);
					personalProfile.setCity1(address1[1].equals("-") ? "" : address1[1]);
					personalProfile.setState1(address1[2].equals("-") ? "" : address1[2]);
					personalProfile.setCountry1(address1[3].equals("-") ? "" : address1[3]);
					personalProfile.setZipcode1(Integer.parseInt(address1[4].equals("-") ? "0" : address1[4]));
					personalProfile.setHome_phone1(address1[5].equals("-") ? "" : address1[5]);
				}

				if (resultSet.getString(3) != null) {
					String address2[] = resultSet.getString(3).split(";;;");
					personalProfile.setApt2(address2[0].equals("-") ? "" : address2[0]);
					personalProfile.setCity2(address2[1].equals("-") ? "" : address2[1]);
					personalProfile.setState2(address2[2].equals("-") ? "" : address2[2]);
					personalProfile.setCountry2(address2[3].equals("-") ? "" : address2[3]);
					personalProfile.setZipcode2(Integer.parseInt(address2[4].equals("-") ? "0" : address2[4]));
					personalProfile.setHome_phone2(address2[5].equals("-") ? "" : address2[5]);
				}
			}

			resultSet.close();
			statement.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return personalProfile;
	}

	@Override
	public boolean updatePersonalDetails(PersonalProfile p) {
		boolean updated = false;
		String query = "update personalprofile set address1=?, address2=?, copyaddress=? where employee_id=?";
		String address1 = "" + (p.getApt1().equals(null) ? "-" : p.getApt1()) + ";;;";
		address1 += (p.getCity1().equals("") ? "-" : p.getCity1()) + ";;;";
		address1 += (p.getState1().equals("") ? "-" : p.getState1()) + ";;;";
		address1 += (p.getCountry1().equals("") ? "-" : p.getCountry1()) + ";;;";
		address1 += ((p.getZipcode1() == 0) ? "-" : "" + p.getZipcode1()) + ";;;";
		address1 += (p.getHome_phone1().equals("") ? "-" : p.getHome_phone1());

		String address2 = "" + (p.getApt2().equals(null) ? "-" : p.getApt2()) + ";;;";
		address2 += (p.getCity2().equals("") ? "-" : p.getCity2()) + ";;;";
		address2 += (p.getState2().equals("") ? "-" : p.getState2()) + ";;;";
		address2 += (p.getCountry2().equals("") ? "-" : p.getCountry2()) + ";;;";
		address2 += ((p.getZipcode2() == 0) ? "-" : "" + p.getZipcode2()) + ";;;";
		address2 += (p.getHome_phone2().equals("") ? "-" : p.getHome_phone2());

		Object[] args = new Object[] { address1, address2, p.getCopyAdrs(), p.getEmployee_id() };

		int n = jdbcTemplate.update(query, args);
		if (n > 0) {
			updated = true;
		}
		return updated;
	}

	@Override
	public ClientProfile getClientDetails(String id) {
		ClientProfile clientProfile = new ClientProfile();
		try {
			Connection connection = dataSource.getConnection();
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from clientprofile where employee_id='" + id + "'");
			if (resultSet.next()) {
				clientProfile.setEmployee_id(id);
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
			}

			resultSet.close();
			statement.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return clientProfile;
	}

	@SuppressWarnings("deprecation")
	@Override
	public boolean updateClientDetails(ClientProfile c) {
		boolean updated = false;
		String query = "update clientprofile set client_name=?, address=?, city=?, state=?, country=?, zipcode=?, position=?, work_email=?, "
				+ "desk_phone=?, supervisor_name=?, supervisor_email=?, supervisor_phone=?, start_date=?, employment_status=? where employee_id=?";
		Object[] args = new Object[] { c.getClient_name(), c.getAddress(), c.getCity(), c.getState(), c.getCountry(),
				c.getZipcode(), c.getPosition(), c.getWork_email(), c.getDesk_phone(), c.getSupervisor_name(),
				c.getSupervisor_email(), c.getSupervisor_phone(),
				new java.sql.Date(new java.util.Date(c.getStart_date()).getTime()), c.getEmployment_status(),
				c.getEmployee_id() };

		int n = jdbcTemplate.update(query, args);
		if (n > 0) {
			updated = true;
		}
		return updated;
	}

}
