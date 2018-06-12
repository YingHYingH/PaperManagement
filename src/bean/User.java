package bean;

public class User {
	private Integer id;
	private String username;
	private String psw;
	private String email;
	private String intro;
	private String academicstatus;
	private String discipline;
	private String followed;
	private Integer visited;
	private String following;

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

	public Integer getVisited() {
		return visited;
	}

	public void setVisited(Integer visited) {
		this.visited = visited;
	}

	public String getFollowing() {
		return following;
	}

	public void setFollowing(String following) {
		this.following = following;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getAcademicstatus() {
		return academicstatus;
	}

	public User(Integer id, String username, String psw, String email, String intro, String academicstatus,
			String discipline, String followed,Integer visited,String following) {
		super();
		this.id = id;
		this.username = username;
		this.psw = psw;
		this.email = email;
		this.intro = intro;
		this.academicstatus = academicstatus;
		this.discipline = discipline;
		this.followed = followed;
		this.visited = visited;
		this.following = following;
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

	public String getFollowed() {
		return followed;
	}

	public void setFollowed(String followed) {
		this.followed = followed;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", psw=" + psw + ", email=" + email + ", intro=" + intro
				+ ", academicstatus=" + academicstatus + ", discipline=" + discipline + ", followed=" + followed
				+ ", visited=" + visited + ", following=" + following + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((academicstatus == null) ? 0 : academicstatus.hashCode());
		result = prime * result + ((discipline == null) ? 0 : discipline.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((followed == null) ? 0 : followed.hashCode());
		result = prime * result + ((following == null) ? 0 : following.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((intro == null) ? 0 : intro.hashCode());
		result = prime * result + ((psw == null) ? 0 : psw.hashCode());
		result = prime * result + ((username == null) ? 0 : username.hashCode());
		result = prime * result + ((visited == null) ? 0 : visited.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (academicstatus == null) {
			if (other.academicstatus != null)
				return false;
		} else if (!academicstatus.equals(other.academicstatus))
			return false;
		if (discipline == null) {
			if (other.discipline != null)
				return false;
		} else if (!discipline.equals(other.discipline))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (followed == null) {
			if (other.followed != null)
				return false;
		} else if (!followed.equals(other.followed))
			return false;
		if (following == null) {
			if (other.following != null)
				return false;
		} else if (!following.equals(other.following))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (intro == null) {
			if (other.intro != null)
				return false;
		} else if (!intro.equals(other.intro))
			return false;
		if (psw == null) {
			if (other.psw != null)
				return false;
		} else if (!psw.equals(other.psw))
			return false;
		if (username == null) {
			if (other.username != null)
				return false;
		} else if (!username.equals(other.username))
			return false;
		if (visited == null) {
			if (other.visited != null)
				return false;
		} else if (!visited.equals(other.visited))
			return false;
		return true;
	}

}
