package com.narayana.timesheet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.narayana.timesheet.dao.OthersDAO;
import com.narayana.timesheet.model.Dependents;
import com.narayana.timesheet.model.EmergencyContact;

@Controller
@SessionAttributes({ "dependents", "emergencycontact" })
public class OthersController {

	@Autowired
	OthersDAO othersDAO;

	@RequestMapping(value = "/dependentsSubmit", method = RequestMethod.POST, params = { "update" })
	public String dependentsSubmit(@RequestParam("employee_id") String id, @RequestParam("name") String name,
			@RequestParam("relation") String relation, @RequestParam("dob") String dob,
			@Value("#{session.getAttribute('dependents')}") Dependents dependents, Model model) {

		if (othersDAO.setDependents(id, name, relation, dob, dependents)) {
			model.addAttribute("updateMsg", "Updated Succesfully");
			model.addAttribute("dependents", othersDAO.getDependents(id));
		} else {
			model.addAttribute("updateMsg", "Db Connection Error");
		}
		model.addAttribute("DPActive", "active");
		return "dependents";
	}

	@RequestMapping(value = "/emergencycontactSubmit", method = RequestMethod.POST, params = { "update" })
	public String emergencycontactSubmit(@ModelAttribute("emergencycontact") EmergencyContact ec, Model model) {

		if (othersDAO.setEmergencyContact(ec)) {
			model.addAttribute("updateMsg", "Updated Succesfully");
			model.addAttribute("dependents", othersDAO.getEmergencyContact(ec.getEmployee_id()));
		} else {
			model.addAttribute("updateMsg", "Db Connection Error");
		}
		model.addAttribute("ECActive", "active");
		return "emergencycontact";
	}

	@RequestMapping(value = "/changepasswordSubmit", method = RequestMethod.POST, params = { "update" })
	public String changepasswordSubmit(@RequestParam("employee_id") String employee_id,
			@RequestParam("user_password") String oldpassword, @RequestParam("user_password1") String newpassword,
			Model model, SessionStatus status) {

		String reply = othersDAO.changepassword(employee_id, oldpassword, newpassword);
		String msg = "DB Connection Error";
		
		if (reply.equals("invalid")) {
			msg = "Invalid Old Password";
		} else if (reply.equals("updated")) {
			msg = "Updated Succesfully";
		}
		
		model.addAttribute("updateMsg", msg);
		return "changepassword";
	}

}
