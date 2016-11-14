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
import org.springframework.web.multipart.MultipartFile;

import com.narayana.timesheet.dao.TimesheetDAO;
import com.narayana.timesheet.extra.CreatePDF;
import com.narayana.timesheet.model.ClientProfile;
import com.narayana.timesheet.model.Timesheet;
import com.narayana.timesheet.model.TimesheetHours;

@Controller
@SessionAttributes({ "alltimesheets" })
public class TimesheetController {

	@Autowired
	TimesheetDAO timesheetDAO;

	@RequestMapping(value = "/getClearTimeSheet/{tid}", method = RequestMethod.GET)
	public void getUploadedFile(@Value("#{session.getAttribute('id')}") String id,
			@Value("#{session.getAttribute('name')}") String name, @PathVariable("tid") int tid,
			@ModelAttribute("alltimesheets") ArrayList<Timesheet> timesheets, HttpServletResponse response) {
		for (Timesheet t : timesheets) {
			if (t.getTimesheet_id() == tid) {
				try {
					byte[] b = new CreatePDF().createPdf(name, id, t.getClient_name(), t.getStart_date(),
							t.getEnd_date(), t.getStatus(), t.getUpdate_date(),
							timesheetDAO.getSearchedTimesheets(id, t.getStart_date(), t.getEnd_date()));
					response.setContentType("application/pdf");
					response.setHeader("Content-Disposition", String.format("attachment; filename=\"timesheet.pdf\""));
					response.setContentLength(b.length);
					FileCopyUtils.copy(b, response.getOutputStream());
				} catch (IOException ioe) {
					ioe.printStackTrace();
				}
				break;
			}
		}
	}

	@RequestMapping(value = "/getUploadedFile/{tid}", method = RequestMethod.GET)
	public void getApprovedFile(@PathVariable("tid") int tid,
			@ModelAttribute("alltimesheets") ArrayList<Timesheet> timesheets, HttpServletResponse response) {
		for (Timesheet t : timesheets) {
			if (t.getTimesheet_id() == tid) {
				try {
					response.setContentType(t.getFile_mime_type());
					// response.setHeader("Content-Disposition",String.format("inline;
					// filename=\"" + t.getFile_name() + "\""));

					response.setHeader("Content-Disposition",
							String.format("attachment; filename=\"" + t.getFile_name() + "\""));
					response.setContentLength(t.getFile().length);
					FileCopyUtils.copy(t.getFile(), response.getOutputStream());
				} catch (IOException ioe) {
					ioe.printStackTrace();
				}
				break;
			}
		}
	}

	@RequestMapping(value = "/addTimesheetSubmit", method = RequestMethod.POST, params = { "submit" })
	public String addTimeSheetSubmit(@RequestParam("employee_id") String id,
			@Value("#{session.getAttribute('clientprofile')}") ClientProfile clientprofile,
			@RequestParam("file") MultipartFile file, @RequestParam("start_date") String start_date,
			@RequestParam("end_date") String end_date, @RequestParam("hours") String hours,
			@RequestParam("d[]") String[] d, @RequestParam("rt[]") int[] rt, @RequestParam("ot[]") int[] ot,
			@RequestParam("pv[]") int[] pv, @RequestParam("uv[]") int[] uv, Model model) {
		String info = "";

		int total_hours = 0;
		for (int i = 0; i < rt.length; i++) {
			total_hours += rt[i] + ot[i] + pv[i] + uv[i];
		}

		if (total_hours != Integer.parseInt(hours)) {
			info = "Total Working Hours Did Not Match";
		} else {
			if (timesheetDAO.addTimesheet(id, clientprofile.getClient_name(), start_date, end_date,
					Integer.parseInt(hours), file)) {
				if (timesheetDAO.addTimesheetHourly(id, d, rt, ot, pv, uv)) {
					info = "Time Sheet Added Succefully";
				} else {
					info = "Some prob with DB at stage 2, Please try after some time";
				}
			} else {
				info = "Timesheet Already Present for given Dates";
			}
		}
		model.addAttribute("alltimesheets", timesheetDAO.getAllTimesheets(id));
		model.addAttribute("updateMsg", info);
		model.addAttribute("TActive1", "active");
		return "addtimesheet";
	}

	@RequestMapping(value = "/searchTimesheetSubmit", method = RequestMethod.POST)
	public String searchTimeSheetSubmit(@RequestParam("employee_id") String id,
			@RequestParam("start_date") String start_date, @RequestParam("end_date") String end_date, Model model) {
		ArrayList<TimesheetHours> tsh = timesheetDAO.getSearchedTimesheets(id, start_date, end_date);
		int total = 0, trt = 0, tot = 0, tpv = 0, tuv = 0;
		for (TimesheetHours t : tsh) {
			trt += t.getRt();
			tot += t.getOt();
			tpv += t.getPv();
			tuv += t.getUv();
			total += t.getTotal();
		}

		model.addAttribute("trt", trt);
		model.addAttribute("tot", tot);
		model.addAttribute("tpv", tpv);
		model.addAttribute("tuv", tuv);
		model.addAttribute("total", total);
		model.addAttribute("searchedtimesheets", tsh);
		model.addAttribute("TActive4", "active");
		return "searchtimesheet";
	}
}
