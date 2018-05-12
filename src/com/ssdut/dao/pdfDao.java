package com.ssdut.dao;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.io.File;
import java.io.IOException;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.util.PDFTextStripper;
import org.junit.Test;

public class pdfDao {
	public String pdf(String filePath) {
		File pdfFile = new File(filePath);
		PDDocument document = null;
		try {
			document = PDDocument.load(pdfFile);
			// 读文本内容
			PDFTextStripper stripper = new PDFTextStripper();
			// 设置按顺序输出
			stripper.setSortByPosition(true);
			stripper.setStartPage(1);
			stripper.setEndPage(1);
			String content = stripper.getText(document);
			return content;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			return "";
		}
	}

	public String getDOI(String text) {
		String pattern = "(DOI|Doi|doi):? *([^ \\n]*)";
		Pattern r = Pattern.compile(pattern);
		Matcher m = r.matcher(text);
		if (m.find()) {
			return m.group(2);
		} else {
			return "";
		}
	}

	public String getAbstract(String text) {
		String[] lines = text.split("\\n");
		String result = "";
		boolean find = false;
		for (String line : lines) {
			line = line.trim();
			if (line.startsWith("Abstract:") || line.startsWith("ABSTRACT:") || line.startsWith("摘要：")) {
				find = true;
			}
			if (find && (line.startsWith("Key words") || line.startsWith("关键词"))) {
				find = false;
			}
			if (find && !line.isEmpty()) {
				if (line.endsWith("-")) {
					line = line.substring(0, line.length() - 1);
					result += line;
				} else {
					result += line + " ";
				}
			}
		}
		result = result.replaceFirst("(Abstract|ABSTRACT|摘要):? *", "");
		return result;
	}

	@Test
	public void pdfDaotest() {
		String filePath = "E://Workspaces//PaperManagement//WebContent//upload//2018050307310146.pdf";
		pdf(filePath);
	}

	@Test
	public void getDOItest() {
		String filePath = "E://Workspaces//PaperManagement//WebContent//upload//2018050307310146.pdf";
		System.out.println(getDOI(pdf(filePath)));
	}

	@Test
	public void getAbstracttest() {
		String filePath = "E://Workspaces//PaperManagement//WebContent//upload//2018050307310146.pdf";
		System.out.println(getAbstract(pdf(filePath)));
	}
}
