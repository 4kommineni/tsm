package com.narayana.timesheet.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.narayana.timesheet.dao.EducationDAO;
import com.narayana.timesheet.model.Documents;
import com.narayana.timesheet.model.Education;
import com.narayana.timesheet.model.Resume;
import com.narayana.timesheet.model.Skills;

@Controller
@SessionAttributes({ "education", "skills", "resume", "documents" })
public class EducationController {

	@Autowired
	EducationDAO educationDAO;

	@RequestMapping(value = "/getUploadedDocument/{title}", method = RequestMethod.GET)
	public void getUploadedDocument(@PathVariable("title") String title,
			@ModelAttribute("documents") ArrayList<Documents> all, HttpServletResponse response) {
		for (Documents d : all) {
			if (d.getTitle().equals(title)) {
				try {
					response.setContentType("application/pdf");
					// response.setHeader("Content-Disposition",String.format("inline;
					// filename=\"" + t.getFile_name() + "\""));
					response.setHeader("Content-Disposition",
							String.format("attachment; filename=\"" + d.getTitle() + "\""));
					response.setContentLength(d.getFile().length);
					FileCopyUtils.copy(d.getFile(), response.getOutputStream());
				} catch (IOException ioe) {
					ioe.printStackTrace();
				}
			}
		}
	}

	@RequestMapping(value = "/getResume", method = RequestMethod.GET)
	public void getResume(@Value("#{session.getAttribute('id')}") String id, @ModelAttribute("resume") Resume resume,
			HttpServletResponse response) {
		if (resume.getFile().length != 0) {
			try {
				response.setContentType("application/pdf");
				// response.setHeader("Content-Disposition",String.format("inline;
				// filename=\"" + t.getFile_name() + "\""));
				response.setHeader("Content-Disposition",
						String.format("attachment; filename=\"" + resume.getTitle() + "\""));
				response.setContentLength(resume.getFile().length);
				FileCopyUtils.copy(resume.getFile(), response.getOutputStream());
			} catch (IOException ioe) {
				ioe.printStackTrace();
			}
		}
	}

	@RequestMapping(value = "/educationSubmit", method = RequestMethod.POST, params = { "update" })
	public String educationSubmit(@Valid @ModelAttribute("education") Education education, BindingResult bindingResult,
			Model model) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("EActive1", "active");
			return "education";
		}

		if (educationDAO.setEducation(education)) {
			model.addAttribute("updateMsg", "Updated Succesfully");
			model.addAttribute("education", educationDAO.getEducation(education.getEmployee_id()));
		} else {
			model.addAttribute("updateMsg", "Db Connection Error");
		}
		model.addAttribute("EActive1", "active");
		return "education";
	}

	@RequestMapping(value = "/educationSubmit", method = RequestMethod.POST, params = { "reset" })
	public String educationReset(@ModelAttribute("id") String id, Model model) {
		model.addAttribute("education", educationDAO.getEducation(id));
		model.addAttribute("EActive1", "active");
		return "education";
	}

	@RequestMapping(value = "/skillsSubmit", method = RequestMethod.POST, params = { "update" })
	public String skillsSubmit(@RequestParam("employee_id") String id, @RequestParam("skill_name") String s,
			@RequestParam("exp_years") String e, @Value("#{session.getAttribute('skills')}") Skills skills,
			Model model) {

		if (educationDAO.setSkills(id, s, e, skills)) {
			model.addAttribute("updateMsg", "Updated Succesfully");
			model.addAttribute("skills", educationDAO.getSkills(id));
		} else {
			model.addAttribute("updateMsg", "Db Connection Error");
		}
		model.addAttribute("EActive2", "active");
		return "skills";
	}

	@RequestMapping(value = "/documentsSubmit", method = RequestMethod.POST, params = { "update" })
	public String documentsSubmit(@RequestParam("employee_id") String id, @RequestParam("title") String title,
			@RequestParam(value = "exp_date", required = false) String exp_date,
			@RequestParam("file") MultipartFile file, Model model) {

		if (educationDAO.setDocuments(id, title, exp_date, file)) {
			model.addAttribute("updateMsg", "Updated Succesfully");
			model.addAttribute("documents", educationDAO.getDocuments(id));
		} else {
			model.addAttribute("updateMsg", "Db Connection Error");
		}
		model.addAttribute("EActive4", "active");
		return "documents";
	}

	@RequestMapping(value = "/resumeSubmit", method = RequestMethod.POST, params = { "update" })
	public String resumeSubmit(@RequestParam("employee_id") String id, @RequestParam("title") String title,
			@RequestParam("file") MultipartFile file, Model model) {

		if (educationDAO.setResume(id, title, file)) {
			model.addAttribute("updateMsg", "Updated Succesfully");
			model.addAttribute("resume", educationDAO.getResume(id));
		} else {
			model.addAttribute("updateMsg", "Db Connection Error");
		}
		model.addAttribute("EActive3", "active");
		return "resume";
	}
}
