package utils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.pdfbox.exceptions.InvalidPasswordException;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.font.PDFontDescriptor;
import org.apache.pdfbox.util.PDFTextStripper;
import org.apache.pdfbox.util.TextPosition;

public class MyTextStripper extends PDFTextStripper {

	private String title = "";
	private String author = "";
	private boolean find = false;
	private boolean finish = false;
	private boolean newfind = false;
	private boolean newfinish = false;
	private boolean findauthor = false;
	private boolean finishauthor = false;
	int sizeAuthor = 0;
	int flag = 0;
	private List<TextPosition> tp = new ArrayList<TextPosition>();

	public MyTextStripper() throws IOException {
		super();
		super.setSortByPosition(true);
	}

	@Override
	protected void processTextPosition(TextPosition text)  {
		this.tp.add(text);
	}

	public int getMaxFontWeight() throws Exception {
		int maxWeight = 0;
		for (TextPosition t : this.tp) {
			PDFontDescriptor font = t.getFont().getFontDescriptor();
			if (font == null) {
				continue;
			}
			if (font.getFontWeight() > maxWeight) {
				maxWeight = (int) (font.getFontWeight());
			}
		}
		return maxWeight;
	}

	public int getMaxFontSize() throws Exception {
		int maxSize = 0;
		for (TextPosition t : this.tp) {
			if (t.getFontSizeInPt() > maxSize) {
				maxSize = (int) (t.getFontSizeInPt());
			}
		}
		return maxSize;
	}

	public String getTitle() throws Exception {
		int maxSize = this.getMaxFontSize();
		int maxWeight = this.getMaxFontWeight();
		for (TextPosition t : this.tp) {
			// PDFontDescriptor font = t.getFont().getFontDescriptor();

			if (!this.finish && !this.find && (int) (t.getFontSizeInPt()) == maxSize) {
				this.find = true;
			}
			if (this.find && (!((int) (t.getFontSizeInPt()) == maxSize) || t.getCharacter().equals("\n"))) {
				this.find = false;
				this.finish = true;

			}

			if (this.find) {
				this.title += t.getCharacter();
			}

		}
		this.title = this.title.trim();
		return this.title;
	}

	public String getAuthor() throws Exception {
		int maxSize = this.getMaxFontSize();
		int maxWeight = this.getMaxFontWeight();
		for (TextPosition t : this.tp) {
			if (!this.newfinish && !this.newfind && (int) (t.getFontSizeInPt()) == maxSize) {
				this.newfind = true;
			}
			if (this.newfind && (!((int) (t.getFontSizeInPt()) == maxSize) || t.getCharacter().equals("\n"))) {
				this.newfind = false;
				this.newfinish = true;

			}

			if (this.newfinish) {
				if (t.getCharacter().trim() != "" && !this.finishauthor && !this.findauthor) {
					this.findauthor = true;
				}
				if (this.findauthor && (t.getCharacter().equals("\n") || (int) t.getFontSizeInPt() != sizeAuthor)) {
					this.findauthor = false;
					this.finishauthor = true;
				}
				if (this.findauthor && !this.finishauthor) {
					this.author += t.getCharacter();
				}

			}
		}
		this.author = this.author.trim();
		return this.author;
	}
	
	public static String setTitle(String filepdfPath) throws Exception {
		File input = new File(filepdfPath);
		PDDocument document = PDDocument.load(input);
		List<PDPage> pages = document.getDocumentCatalog().getAllPages();
		PDPage page = pages.get(0);
		MyTextStripper stripper = new MyTextStripper();
		stripper.processStream(page, page.getResources(), page.getContents().getStream());
		return stripper.getTitle();
	}

}
