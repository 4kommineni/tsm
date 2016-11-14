package com.narayana.timesheet.extra;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;

import com.itextpdf.io.font.FontConstants;
import com.itextpdf.io.source.ByteArrayOutputStream;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.TextAlignment;
import com.narayana.timesheet.model.TimesheetHours;

public class CreatePDF {

	int hours = 0;

	public byte[] createPdf(String name, String id, String client, String sdate, String edate, String status,
			String update_date, ArrayList<TimesheetHours> tsh) {

		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		try {
			Document document = new Document(new PdfDocument(new PdfWriter(baos)), PageSize.A4);
			PdfFont font = PdfFontFactory.createFont(FontConstants.COURIER_BOLD);
			document.setMargins(20, 20, 50, 50);

			Table table = new Table(5);
			table.setWidthPercent(100);
			document.add(new Paragraph("Time Sheet Management, Inc!").setBold().setFontSize(16)
					.setTextAlignment(TextAlignment.CENTER));
			document.add(
					new Paragraph("Time Sheet details!\n\n").setFontSize(12).setTextAlignment(TextAlignment.CENTER));
			fillTable(table, tsh);
			String info = String.format("%-20s:%s%n%-20s:%s%n%-20s:%s%n%-20s:%s%n%-20s:%s%n%-20s:%d%n%-20s:%s%n%n%n",
					"Name", name, "Employee Id", id, "Client", client, "Start Date", sdate, "End Date", edate, "Hours",
					hours, "Status", (status + " ( on " + update_date + " )"));

			document.add(new Paragraph(info).setFontSize(14).setFont(font));
			document.add(table.setTextAlignment(TextAlignment.CENTER));
			document.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return baos.toByteArray();
	}

	public void fillTable(Table table, ArrayList<TimesheetHours> tsh) {
		table.addHeaderCell(new Cell().add(new Paragraph("Date").setBold()));
		table.addHeaderCell(new Cell().add(new Paragraph("Regular Time").setBold()));
		table.addHeaderCell(new Cell().add(new Paragraph("Over Time").setBold()));
		table.addHeaderCell(new Cell().add(new Paragraph("Paid Vocation").setBold()));
		table.addHeaderCell(new Cell().add(new Paragraph("Unpaid Vocation").setBold()));

		int total_gt = 0;
		int total_ot = 0;
		int total_pv = 0;
		int total_uv = 0;

		for (TimesheetHours t : tsh) {
			table.addCell(new Cell().add(new Paragraph(t.getDate())));
			table.addCell(new Cell().add(new Paragraph("" + t.getRt())));
			table.addCell(new Cell().add(new Paragraph("" + t.getOt())));
			table.addCell(new Cell().add(new Paragraph("" + t.getPv())));
			table.addCell(new Cell().add(new Paragraph("" + t.getUv())));
			total_gt += t.getRt();
			total_ot += t.getOt();
			total_pv += t.getPv();
			total_uv += t.getUv();
		}
		
		hours=total_gt+total_ot+total_pv+total_uv;

		table.addCell(new Cell().add(new Paragraph("Total").setBold()));
		table.addCell(new Cell().add(new Paragraph("" + total_gt)));
		table.addCell(new Cell().add(new Paragraph("" + total_ot)));
		table.addCell(new Cell().add(new Paragraph("" + total_pv)));
		table.addCell(new Cell().add(new Paragraph("" + total_uv)));

		table.addCell(new Cell().add(new Paragraph("Grand Total").setBold().setFontSize(14)));
		table.addCell(new Cell().add(new Paragraph("" + hours).setBold().setFontSize(14)));
		table.addCell(new Cell().add(new Paragraph("")));
		table.addCell(new Cell().add(new Paragraph("")));
		table.addCell(new Cell().add(new Paragraph("")));
	}
}
