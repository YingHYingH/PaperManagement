package bean;

public class User {
	private Integer id;
	private String username;
	private String psw;
	private String email;
	private String intro;
	private String academicstatus;
	private String discipline;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPsw() {
		return psw;
	}

	public void setPsw(String psw) {
		this.psw = psw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getAcademicstatus() {
		return academicstatus;
	}

	public User(Integer id, String username, String psw, String email, String intro, String academicstatus,
			String discipline) {
		super();
		this.id = id;
		this.username = username;
		this.psw = psw;
		this.email = email;
		this.intro = intro;
		this.academicstatus = academicstatus;
		this.discipline = discipline;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", psw=" + psw + ", email=" + email + ", intro=" + intro
				+ ", academicstatus=" + academicstatus + ", discipline=" + discipline + "]";
	}

	public void setAcademicstatus(String academicstatus) {
		this.academicstatus = academicstatus;
	}

	public String getDiscipline() {
		return discipline;
	}

	public void setDiscipline(String discipline) {
		this.discipline = discipline;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

}
