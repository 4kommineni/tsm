package com.narayana.timesheet.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.narayana.timesheet.dao.AdminDAO;
import com.narayana.timesheet.extra.SendGmail;
import com.narayana.timesheet.extra.SendServerMail;
import com.narayana.timesheet.model.AdminTimesheet;

@Controller
@SessionAttributes({ "id", "newuserid", "allprofiles", "allclients", "pendingtimesheets" })
public class AdminController {

	@Autowired
	AdminDAO adminDAO;
	@Autowired
	SendGmail sendGmail;
	@Autowired
	SendServerMail sendServerMail;

	@RequestMapping(value = "/getAdminUploadedFile/{tid}", method = RequestMethod.GET)
	public void getAdminApprovedFile(@PathVariable("tid") int tid,
			@ModelAttribute("pendingtimesheets") ArrayList<AdminTimesheet> timesheets, HttpServletResponse response) {
		for (AdminTimesheet t : timesheets) {
			if (t.getTimesheet_id() == tid) {
				try {
					response.setContentType(t.getFile_mime_type());
					response.setHeader("Content-Disposition",
							String.format("inline; filename=\"" + t.getFile_name() + "\""));

					// response.setHeader("Content-Disposition",
					// String.format("attachment; filename=\"" +
					// t.getFile_name() + "\""));
					response.setContentLength(t.getFile().length);
					FileCopyUtils.copy(t.getFile(), response.getOutputStream());
				} catch (IOException ioe) {
					ioe.printStackTrace();
				}
				break;
			}
		}
	}

	@RequestMapping(value = "/adminLoginSubmit", method = RequestMethod.POST)
	public String homepage1(@RequestParam("admin_login") String email, @RequestParam("admin_password") String password,
			Model model) {
		if (adminDAO.checkForAdmin(email, password)) {
			model.addAttribute("newuserid", adminDAO.getNewUserId());
			model.addAttribute("allprofiles", adminDAO.getallProfiles());
			model.addAttribute("allclients", adminDAO.getallClients());
			model.addAttribute("pendingtimesheets", adminDAO.getAllPendingTimesheets());
			model.addAttribute("id", "admin");
			model.addAttribute("profilesActive", "active");
			return "adminallprofiles";
		} else {
			model.addAttribute("errormsg", "Invalid Credentials");
			return "adminlogin";
		}
	}

	@RequestMapping(value = "/addnewuser", method = RequestMethod.POST)
	public String adminAddNewUser(@RequestParam String user_id, @RequestParam String email,
			@RequestParam String password, @RequestParam String first_name, @RequestParam String last_name,
			Model model) {
		String returnMsg = "";
		boolean status = true;
		try {
			adminDAO.addNewUser(user_id, email, password, first_name, last_name);
		} catch (Exception e) {
			e.printStackTrace();
			status = false;
			returnMsg = "DB Connection Error";
		}
		if (status) {
			String sender = "visionsquaretsm@gmail.com";
			String receiver = email;
			try {
				sendGmail.sendMail(sender, receiver, first_name + " " + last_name, email, password);
				// sendServermail.sendMail(sender, receiver, first_name + " " +
				// last_name, email, password);
				returnMsg = "New User Added Succesfully";
			} catch (Exception e) {
				e.printStackTrace();
				status = false;
				returnMsg = "Invitation mail not send";
			}
		}
		if (!status) {
			adminDAO.deleteNewUser(user_id);
		}
		model.addAttribute("updateMsg", returnMsg);
		model.addAttribute("allprofiles", adminDAO.getallProfiles());
		model.addAttribute("profilesActive", "active");
		return "adminallprofiles";
	}

	@RequestMapping(value = "/adminPendingTS", method = RequestMethod.POST)
	public String pendingTimesheets(@RequestParam String task, Model model) {
		if (adminDAO.adminApproveDeny(task)) {
			model.addAttribute("updateMsg", task.split("-")[0]);
		} else {
			model.addAttribute("updateMsg", task.split("-")[0]);
		}
		model.addAttribute("pendingtimesheets", adminDAO.getAllPendingTimesheets());
		model.addAttribute("PTActive", "active");
		return "adminpendingtimesheets";
	}

	@RequestMapping(value = "/adminSearchTS", method = RequestMethod.POST)
	public String searchTimesheets(@RequestParam("start_date") String start_date,
			@RequestParam("end_date") String end_date, Model model) {
		model.addAttribute("searchedtimesheets", adminDAO.adminSearchtimesheet(start_date, end_date));
		model.addAttribute("s_date", start_date);
		model.addAttribute("e_date", end_date);
		model.addAttribute("RPActive", "active");
		return "adminrunpayslips";
	}

	@RequestMapping(value = "/adminPay", method = RequestMethod.POST)
	public String adminPay(@RequestParam String pay, @RequestParam("start_date1") String start_date,
			@RequestParam("end_date1") String end_date, Model model) {

		adminDAO.payUser(pay);
		model.addAttribute("updateMsg", "Payment Completed");
		model.addAttribute("searchedtimesheets", adminDAO.adminSearchtimesheet(start_date, end_date));
		model.addAttribute("s_date", start_date);
		model.addAttribute("e_date", end_date);
		model.addAttribute("RPActive", "active");
		return "adminrunpayslips";
	}

	@RequestMapping(value = "/adminCP", method = RequestMethod.POST)
	public String adminCP(@Value("#{session.getAttribute('id')}") String id,
			@RequestParam("user_password") String old_pswd, @RequestParam("user_password1") String new_pswd,
			Model model) {
		model.addAttribute("updateMsg", adminDAO.changepassword(id, old_pswd, new_pswd));
		model.addAttribute("CPActive", "active");
		return "adminchangepassword";
	}

	@RequestMapping(value = "/adminlogin", method = RequestMethod.GET)
	public String adminLanding() {
		return "adminlogin";
	}

	@RequestMapping(value = "/a_all_profiles", method = RequestMethod.GET)
	public String adminallprofiles(@Value("#{session.getAttribute('id')}") String id, Model model) {
		if (id == null) {
			return "adminlogin";
		}
		model.addAttribute("profilesActive", "active");
		return "adminallprofiles";
	}

	@RequestMapping(value = "/a_clients", method = RequestMethod.GET)
	public String adminclients(@Value("#{session.getAttribute('id')}") String id, Model model) {
		if (id == null) {
			return "adminlogin";
		}
		model.addAttribute("clientsActive", "active");
		return "adminclients";
	}

	@RequestMapping(value = "/a_pt_sheets", method = RequestMethod.GET)
	public String adminpendingtimesheets(@Value("#{session.getAttribute('id')}") String id, Model model) {
		if (id == null) {
			return "adminlogin";
		}
		model.addAttribute("PTActive", "active");
		return "adminpendingtimesheets";
	}

	@RequestMapping(value = "/a_run_payslips", method = RequestMethod.GET)
	public String adminrunpayslips(@Value("#{session.getAttribute('id')}") String id, Model model) {
		if (id == null) {
			return "adminlogin";
		}
		model.addAttribute("RPActive", "active");
		return "adminrunpayslips";
	}

	@RequestMapping(value = "/a_c_password", method = RequestMethod.GET)
	public String adminchangepassword(@Value("#{session.getAttribute('id')}") String id, Model model) {
		if (id == null) {
			return "adminlogin";
		}
		model.addAttribute("CPActive", "active");
		return "adminchangepassword";
	}

	@RequestMapping(value = "/adminlogout", method = RequestMethod.GET)
	public String logout(SessionStatus status) {
		status.setComplete();
		return "adminlogin";
	}
}
