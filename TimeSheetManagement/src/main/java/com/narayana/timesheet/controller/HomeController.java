package com.narayana.timesheet.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.narayana.timesheet.dao.EducationDAO;
import com.narayana.timesheet.dao.ImmigrationDAO;
import com.narayana.timesheet.dao.OthersDAO;
import com.narayana.timesheet.dao.ProfileDAO;
import com.narayana.timesheet.dao.TimesheetDAO;
import com.narayana.timesheet.model.GeneralProfile;
import com.narayana.timesheet.model.Timesheet;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes({ "name", "id", "generalprofile", "personalprofile", "clientprofile", "alltimesheets", "education",
		"skills", "resume", "documents", "immigration", "paystubs", "dependents", "emergencycontact" })
public class HomeController {

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	ProfileDAO profileDAO;
	@Autowired
	TimesheetDAO timesheetDAO;
	@Autowired
	EducationDAO educationDAO;
	@Autowired
	ImmigrationDAO immigrationDAO;
	@Autowired
	OthersDAO othersDAO;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String landing() {
		return "landing";
	}

	@RequestMapping(value = "/loginSubmit", method = RequestMethod.POST)
	public String homepage1(@RequestParam("user_login") String email, @RequestParam("user_password") String password,
			Model model) {
		String id;
		id = profileDAO.isValidUser(email, password);
		if (!id.equals("No")) {
			GeneralProfile gp = profileDAO.getGeneralDetails(id);
			model.addAttribute("generalprofile", gp);
			model.addAttribute("id", gp.getEmployee_id());
			model.addAttribute("name", gp.getFirst_name() + " " + gp.getLast_name());

			model.addAttribute("personalprofile", profileDAO.getPersonalDetails(gp.getEmployee_id()));
			model.addAttribute("clientprofile", profileDAO.getClientDetails(gp.getEmployee_id()));
			model.addAttribute("alltimesheets", timesheetDAO.getAllTimesheets(gp.getEmployee_id()));
			model.addAttribute("searchedtimesheets", new ArrayList<Timesheet>());
			model.addAttribute("education", educationDAO.getEducation(gp.getEmployee_id()));
			model.addAttribute("skills", educationDAO.getSkills(gp.getEmployee_id()));
			model.addAttribute("resume", educationDAO.getResume(gp.getEmployee_id()));
			model.addAttribute("documents", educationDAO.getDocuments(gp.getEmployee_id()));
			model.addAttribute("immigration", immigrationDAO.getImmigration(gp.getEmployee_id()));
			model.addAttribute("paystubs", othersDAO.getPayStubs(gp.getEmployee_id()));
			model.addAttribute("dependents", othersDAO.getDependents(gp.getEmployee_id()));
			model.addAttribute("emergencycontact", othersDAO.getEmergencyContact(gp.getEmployee_id()));

			model.addAttribute("homeActive", "active");
			return "home";
		} else {
			model.addAttribute("errormsg", "Invalid Credentials");
			return "landing";
		}
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String homepage2(@Value("#{session.getAttribute('id')}") String id, Model model) {
		if (id == null) {
			return "landing";
		}
		model.addAttribute("homeActive", "active");
		return "home";
	}

	@RequestMapping(value = "/generalProfile", method = RequestMethod.GET)
	public String generalProfile(@Value("#{session.getAttribute('id')}") String id, Model model) {
		if (id == null) {
			return "landing";
		}
		model.addAttribute("PActive1", "active");
		return "generalprofile";
	}

	@RequestMapping(value = "/personalProfile", method = RequestMethod.GET)
	public String personalProfile(@Value("#{session.getAttribute('id')}") String id, Model model) {
		if (id == null) {
			return "landing";
		}
		model.addAttribute("PActive2", "active");
		return "personalprofile";
	}

	@RequestMapping(value = "/clientProfile", method = RequestMethod.GET)
	public String clientProfile(@Value("#{session.getAttribute('id')}") String id, Model model) {
		if (id == null) {
			return "landing";
		}
		model.addAttribute("PActive3", "active");
		return "clientprofile";
	}

	@RequestMapping(value = "/addtimesheet", method = RequestMethod.GET)
	public String addTimesheet(@Value("#{session.getAttribute('id')}") String id, Model model) {
		if (id == null) {
			return "landing";
		}
		model.addAttribute("TActive1", "active");
		return "addtimesheet";
	}

	@RequestMapping(value = "/pendingtimesheet", method = RequestMethod.GET)
	public String pendingTimesheet(@Value("#{session.getAttribute('id')}") String id, Model model) {
		if (id == null) {
			return "landing";
		}
		model.addAttribute("TActive2", "active");
		return "pendingtimesheet";
	}

	@RequestMapping(value = "/approvedtimesheet", method = RequestMethod.GET)
	public String approvedTimesheet(@Value("#{session.getAttribute('id')}") String id, Model model) {
		if (id == null) {
			return "landing";
		}
		model.addAttribute("TActive3", "active");
		return "approvedtimesheet";
	}

	@RequestMapping(value = "/searchtimesheet", method = RequestMethod.GET)
	public String searchTimesheet(@Value("#{session.getAttribute('id')}") String id, Model model) {
		if (id == null) {
			return "landing";
		}
		model.addAttribute("TActive4", "active");
		return "searchtimesheet";
	}

	@RequestMapping(value = "/education", method = RequestMethod.GET)
	public String education(@Value("#{session.getAttribute('id')}") String id, Model model) {
		if (id == null) {
			return "landing";
		}
		model.addAttribute("EActive1", "active");
		return "education";
	}

	@RequestMapping(value = "/skills", method = RequestMethod.GET)
	public String skills(@Value("#{session.getAttribute('id')}") String id, Model model) {
		if (id == null) {
			return "landing";
		}
		model.addAttribute("EActive2", "active");
		return "skills";
	}

	@RequestMapping(value = "/resume", method = RequestMethod.GET)
	public String resume(@Value("#{session.getAttribute('id')}") String id, Model model) {
		if (id == null) {
			return "landing";
		}
		model.addAttribute("EActive3", "active");
		return "resume";
	}

	@RequestMapping(value = "/documents", method = RequestMethod.GET)
	public String documents(@Value("#{session.getAttribute('id')}") String id, Model model) {
		if (id == null) {
			return "landing";
		}
		model.addAttribute("EActive4", "active");
		return "documents";
	}

	@RequestMapping(value = "/immigration_faq", method = RequestMethod.GET)
	public String immigration_faq(@Value("#{session.getAttribute('id')}") String id, Model model) {
		if (id == null) {
			return "landing";
		}
		model.addAttribute("IActive1", "active");
		return "immigration_faq";
	}

	@RequestMapping(value = "/immigration", method = RequestMethod.GET)
	public String immigration(@Value("#{session.getAttribute('id')}") String id, Model model) {
		if (id == null) {
			return "landing";
		}
		model.addAttribute("IActive2", "active");
		return "immigration";
	}

	@RequestMapping(value = "/paystubs", method = RequestMethod.GET)
	public String paystubs(@Value("#{session.getAttribute('id')}") String id, Model model) {
		if (id == null) {
			return "landing";
		}
		model.addAttribute("PSActive", "active");
		return "paystubs";
	}

	@RequestMapping(value = "/dependents", method = RequestMethod.GET)
	public String dependents(@Value("#{session.getAttribute('id')}") String id, Model model) {
		if (id == null) {
			return "landing";
		}
		model.addAttribute("DPActive", "active");
		return "dependents";
	}

	@RequestMapping(value = "/emergencycontact", method = RequestMethod.GET)
	public String emergencycontact(@Value("#{session.getAttribute('id')}") String id, Model model) {
		if (id == null) {
			return "landing";
		}
		model.addAttribute("ECActive", "active");
		return "emergencycontact";
	}

	@RequestMapping(value = "/changepassword", method = RequestMethod.GET)
	public String changepassword(@Value("#{session.getAttribute('id')}") String id, Model model) {
		if (id == null) {
			return "landing";
		}
		return "changepassword";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(SessionStatus status) {
		status.setComplete();
		return "landing";
	}

}
