package com.narayana.timesheet.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.narayana.timesheet.model.Documents;
import com.narayana.timesheet.model.Education;
import com.narayana.timesheet.model.Resume;
import com.narayana.timesheet.model.Skills;

public class EducationDAOImpl implements EducationDAO {

	DataSource dataSource;
	JdbcTemplate jdbcTemplate;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public Education getEducation(String id) {
		Education education = new Education();
		try {
			Connection connection = dataSource.getConnection();
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from education where employee_id='" + id + "'");
			if (resultSet.next()) {
				education.setEmployee_id(resultSet.getString(1));
				education.setUniversity(resultSet.getString(2));
				education.setDegree(resultSet.getString(3));
				education.setSpecialization(resultSet.getString(4));
				education.setGpa(resultSet.getString(5));
				education.setGyear(resultSet.getString(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return education;
	}

	@Override
	public boolean setEducation(Education e) {
		boolean taskDone = false;
		String query = "update education set university=?, degree=?, specialization=?, gpa=?, graduation_year=? where employee_id=?";
		Object[] args = new Object[] { e.getUniversity(), e.getDegree(), e.getSpecialization(), e.getGpa(),
				e.getGyear(), e.getEmployee_id() };

		int n = jdbcTemplate.update(query, args);
		if (n > 0) {
			taskDone = true;
		} else {
			query = "insert into education values (?,?,?,?,?,?)"; // for first timer
			args = new Object[] { e.getEmployee_id(), e.getUniversity(), e.getDegree(), e.getSpecialization(),
					e.getGpa(), e.getGyear() };
			n = jdbcTemplate.update(query, args);
			if (n > 0) {
				taskDone = true;
			}
		}
		return taskDone;
	}

	@Override
	public Skills getSkills(String id) {
		Skills skills = new Skills(id);
		try {
			Connection connection = dataSource.getConnection();
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from skills where employee_id='" + id + "'");
			if (resultSet.next()) {
				skills.setEmployee_id(resultSet.getString(1));
				skills.setSkill_name(new ArrayList<String>(Arrays.asList(resultSet.getString(2).split(";;;"))));
				skills.setExp_years(new ArrayList<String>(Arrays.asList(resultSet.getString(3).split(";;;"))));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return skills;
	}

	@Override
	public boolean setSkills(String id, String s, String e, Skills skills) {
		boolean taskDone = false;
		String query = "";
		if (skillsVacent(id)) {
			query = "insert into skills (skills,experience,employee_id) values (?,?,?)"; // for first timer
		} else {
			query = "update skills set skills=?, experience=? where employee_id=?";
		}
		String ss = "";
		for (String t : skills.getSkill_name()) {
			ss += t + ";;;";
		}
		ss += s;
		String es = "";
		for (String t : skills.getExp_years()) {
			es += t + ";;;";
		}
		es += e;

		Object[] args = new Object[] { ss, es, id };

		int n = jdbcTemplate.update(query, args);
		if (n > 0) {
			taskDone = true;
		}
		return taskDone;
	}

	@Override
	public ArrayList<Documents> getDocuments(String id) {
		ArrayList<Documents> all = new ArrayList<Documents>();
		try {
			Connection connection = dataSource.getConnection();
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from documents where employee_id='" + id + "'");
			while (rs.next()) {
				all.add(new Documents(rs.getString(1), rs.getString(2),
						new SimpleDateFormat("MM/dd/yyyy").format(rs.getDate(3)),
						(rs.getTimestamp(4) != null) ? new SimpleDateFormat("MM/dd/yyyy").format(rs.getDate(4)) : "",
						rs.getBytes(5)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return all;
	}

	@Override
	public boolean setDocuments(String id, String title, String exp_date, MultipartFile file) {
		boolean taskDone = false;
		try {
			Connection connection = dataSource.getConnection();
			String query = "insert into documents values (?,?,date(now()),?,?)";
			PreparedStatement pstmt = connection.prepareStatement(query);

			pstmt.setString(1, id);
			pstmt.setString(2, title);
			if (exp_date.equals("")) {
				pstmt.setNull(3, java.sql.Types.DATE);
			} else {
				pstmt.setDate(3, new java.sql.Date(new SimpleDateFormat("MM/dd/yyyy").parse(exp_date).getTime()));
			}
			pstmt.setBytes(4, file.getBytes());

			int n = pstmt.executeUpdate();
			if (n > 0) {
				taskDone = true;
			}
			pstmt.close();
			connection.close();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return taskDone;
	}

	@Override
	public Resume getResume(String id) {
		Resume resume = new Resume(id);
		try {
			Connection connection = dataSource.getConnection();
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from resume where employee_id='" + id + "'");
			if (rs.next()) {
				resume = new Resume(rs.getString(1), rs.getString(2), rs.getBytes(3));
			}
			rs.close();
			statement.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resume;
	}

	@Override
	public boolean setResume(String id, String title, MultipartFile file) {
		boolean taskDone = false;
		try {
			String query = "update resume set title=?, resume=? where employee_id=?";
			Object[] args = new Object[] { title, file.getBytes(), id };
			int n = jdbcTemplate.update(query, args);
			if (n > 0) {
				taskDone = true;
			} else {
				query = "insert into resume values(?,?,?)"; // for first timer
				args = new Object[] { id, title, file.getBytes() };
				n = jdbcTemplate.update(query, args);
				if (n > 0) {
					taskDone = true;
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return taskDone;
	}

	private boolean skillsVacent(String id) {
		boolean vacent = true;
		try {
			Connection connection = dataSource.getConnection();
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from skills where employee_id='" + id + "'");
			if (resultSet.next()) {
				vacent = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vacent;
	}
}
