package com.narayana.timesheet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.narayana.timesheet.dao.ImmigrationDAO;
import com.narayana.timesheet.model.Immigration;

@Controller
@SessionAttributes({ "immigration" })
public class ImmigrationController {

	@Autowired
	ImmigrationDAO immigrationDAO;

	@RequestMapping(value = "immigrationSubmit", method = RequestMethod.POST)
	public String immigrationSubmit(@ModelAttribute("immigration") Immigration immigration, Model model) {

		if (immigrationDAO.setImmigration(immigration)) {
			model.addAttribute("updateMsg", "Updated Succesfully");
			model.addAttribute("immigration", immigrationDAO.getImmigration(immigration.getEmployee_id()));
		} else {
			model.addAttribute("updateMsg", "Sry, Please Try again");
		}
		model.addAttribute("IActive2", "active");
		return "immigration";
	}
}
