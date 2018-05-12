package bean;

import java.io.Serializable;

public class Paper implements Serializable {
	private Integer id;
	private String title;
	private String author;
	private String DOI;
	private String classification1;
	private String classification2;
	private String classification3;
	private String abs;
	private String pubDate;
	private String uploadDate;
	private String url;
	private int user_id;
	private int flag; // 默认0 收藏1 删除2
	private String notes;
	private int watches;
	private int downloadcnt;
	private int ifRead;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDOI() {
		return DOI;
	}

	public void setDOI(String dOI) {
		DOI = dOI;
	}

	public String getClassification1() {
		return classification1;
	}

	@Override
	public String toString() {
		return "Paper [id=" + id + ", title=" + title + ", author=" + author + ", DOI=" + DOI + ", classification1="
				+ classification1 + ", classification2=" + classification2 + ", classification3=" + classification3
				+ ", abs=" + abs + ", pubDate=" + pubDate + ", uploadDate=" + uploadDate + ", url=" + url + ", user_id="
				+ user_id + ", flag=" + flag + ", notes=" + notes + ", watches=" + watches + ", downloadcnt="
				+ downloadcnt + ", ifRead=" + ifRead + "]";
	}

	public void setClassification1(String classification1) {
		this.classification1 = classification1;
	}

	public String getClassification2() {
		return classification2;
	}

	public void setClassification2(String classification2) {
		this.classification2 = classification2;
	}

	public String getClassification3() {
		return classification3;
	}

	public void setClassification3(String classification3) {
		this.classification3 = classification3;
	}

	public String getAbs() {
		return abs;
	}

	public void setAbs(String abs) {
		this.abs = abs;
	}

	public String getPubDate() {
		return pubDate;
	}

	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}

	public String getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Paper() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public int getWatches() {
		return watches;
	}

	public void setWatches(int watches) {
		this.watches = watches;
	}

	public int getDownloadcnt() {
		return downloadcnt;
	}

	public void setDownloadcnt(int downloadcnt) {
		this.downloadcnt = downloadcnt;
	}
	

	public int getIfRead() {
		return ifRead;
	}

	public void setIfRead(int ifRead) {
		this.ifRead = ifRead;
	}

	public Paper(Integer id, String title, String author, String dOI, String classification1, String classification2,
			String classification3, String abs, String pubDate, String uploadDate, String url, int user_id, int flag,
			String notes,int watches,int downloadcnt,int ifRead ) {
		super();
		this.id = id;
		this.title = title;
		this.author = author;
		DOI = dOI;
		this.classification1 = classification1;
		this.classification2 = classification2;
		this.classification3 = classification3;
		this.abs = abs;
		this.pubDate = pubDate;
		this.uploadDate = uploadDate;
		this.url = url;
		this.user_id = user_id;
		this.flag = flag;
		this.notes = notes;
		this.watches = watches;
		this.downloadcnt = downloadcnt;
		this.ifRead = ifRead;
	}

}
