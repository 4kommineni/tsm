package com.narayana.timesheet.extra;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

public class SendGmail {
	private MailSender mailSender;

	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}

	

	public void sendMail(String from, String to, String name, String id, String pswd) throws Exception{
		// creating message
		
		String msg = "Dear "+name+",\n\n" + "You have been added as an user of Vision Square Employee Access. "
				+ "Vision Square Employee Access will give you the ability to upload / edit Timesheets, "
				+ "Personnel Information Management, Employee self-service, legal, documentation, leave, time and benefits. "
				+ "It helps to reduce the burden of data entry in different places and gives a chance to look at all "
				+ "the information at one place without boundaries. Information can be accessed from web anywhere at any time.\n\n"
				+ "Your temporary Login information into Vision Square Employee Access.\n\n" + "User ID: "+id+"\n"
				+ "Password: "+pswd+"\n\n"
				+ "Use Employee login from our website http://www.visionsquareinc.com on the top right hand corner. "
				+ "It is very critical to fill in all the data to be in compliant with all new immigration rules "
				+ "such as Employer - Employee, LCA's, INS,DOL etc.\n\n"
				+ "Thank you and feel free to contact Krishna Reddy for more details.\n\n" + "HR\n" + "Krishna Reddy\n"
				+ "O: 704-978-7769 Ext: 103\n" + "E: krishna@visionsquareinc.com.com\n" + "http://www.visionsquareinc.com";
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom(from);
		message.setTo(to);
		message.setSubject("VisionSquare : Your Registration Details");
		System.out.println(msg);
		message.setText(msg);
		mailSender.send(message);
	}
}
