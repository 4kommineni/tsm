package com.narayana.timesheet.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import com.narayana.timesheet.dao.ProfileDAO;
import com.narayana.timesheet.model.ClientProfile;
import com.narayana.timesheet.model.GeneralProfile;
import com.narayana.timesheet.model.PersonalProfile;

@SessionAttributes({ "generalprofile", "personalprofile", "clientprofile" })
@Controller
public class ProfileController {

	@Autowired
	ProfileDAO profileDAO;

	@RequestMapping(value = "/GPImage", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<byte[]> loadImage(@ModelAttribute("generalprofile") GeneralProfile generalprofile) {
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		return new ResponseEntity<byte[]>(generalprofile.getImage(), headers, HttpStatus.CREATED);
	}

	@RequestMapping(value = "/generalProfileSubmit", method = RequestMethod.POST, params = { "update" })
	public String generalProfileSubmit(@Valid @ModelAttribute("generalprofile") GeneralProfile generalprofile,
			BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("PActive1", "active");
			return "generalprofile";
		}

		if (generalprofile.getImage().length < 5000000) {
			if (profileDAO.updateGeneralDetails(generalprofile)) {
				model.addAttribute("updateMsg", "Updated Succesfully");
				model.addAttribute("generalprofile", profileDAO.getGeneralDetails(generalprofile.getEmployee_id()));
			} else {
				model.addAttribute("updateMsg", "Sry, Please Try again");
			}
		} else {
			model.addAttribute("imageError", "Image too large");
		}
		model.addAttribute("PActive1", "active");
		return "generalprofile";
	}

	@RequestMapping(value = "/generalProfileSubmit", method = RequestMethod.POST, params = { "reset" })
	public String generalProfileReset(@ModelAttribute("generalprofile") GeneralProfile gp, Model model) {
		model.addAttribute("generalprofile", profileDAO.getGeneralDetails(gp.getEmployee_id()));
		model.addAttribute("PActive1", "active");
		return "generalprofile";
	}

	@RequestMapping(value = "/personalProfileSubmit", method = RequestMethod.POST, params = { "update" })
	public String personalProfileSubmit(@Valid @ModelAttribute("personalprofile") PersonalProfile personalprofile,
			BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("PActive2", "active");
			return "personalprofile";
		}

		if (profileDAO.updatePersonalDetails(personalprofile)) {
			model.addAttribute("updateMsg", "Updated Succesfully");
			model.addAttribute("personalprofile", profileDAO.getPersonalDetails(personalprofile.getEmployee_id()));
		} else {
			model.addAttribute("updateMsg", "Sry, Please Try again");
		}
		model.addAttribute("PActive2", "active");
		return "personalprofile";
	}

	@RequestMapping(value = "/personalProfileSubmit", method = RequestMethod.POST, params = { "reset" })
	public String personalProfileReset(@ModelAttribute("personalprofile") PersonalProfile pp, Model model) {
		model.addAttribute("personalprofile", profileDAO.getPersonalDetails(pp.getEmployee_id()));
		model.addAttribute("PActive2", "active");
		return "personalprofile";
	}

	@RequestMapping(value = "/clientProfileSubmit", method = RequestMethod.POST, params = { "update" })
	public String clientProfileSubmit(@Valid @ModelAttribute("clientprofile") ClientProfile clientprofile,
			BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("PActive3", "active");
			return "clientprofile";
		}

		if (profileDAO.updateClientDetails(clientprofile)) {
			model.addAttribute("updateMsg", "Updated Succesfully");
			model.addAttribute("clientprofile", profileDAO.getClientDetails(clientprofile.getEmployee_id()));
		} else {
			model.addAttribute("updateMsg", "Sry, Please Try again");
		}
		model.addAttribute("PActive3", "active");
		return "clientprofile";
	}

	@RequestMapping(value = "/clientProfileSubmit", method = RequestMethod.POST, params = { "reset" })
	public String clientProfileReset(@ModelAttribute("clientprofile") ClientProfile cp, Model model) {
		model.addAttribute("clientprofile", profileDAO.getClientDetails(cp.getEmployee_id()));
		model.addAttribute("PActive3", "active");
		return "clientprofile";
	}

	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws ServletException {
		binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
	}
}
