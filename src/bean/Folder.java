package bean;

public class Folder {

	private int folder_id;
	private String folder_title;
	private int user_id;
	public int getFolder_id() {
		return folder_id;
	}
	public void setFolder_id(int folder_id) {
		this.folder_id = folder_id;
	}
	public String getFolder_title() {
		return folder_title;
	}
	public void setFolder_title(String folder_title) {
		this.folder_title = folder_title;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + folder_id;
		result = prime * result + ((folder_title == null) ? 0 : folder_title.hashCode());
		result = prime * result + user_id;
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
		Folder other = (Folder) obj;
		if (folder_id != other.folder_id)
			return false;
		if (folder_title == null) {
			if (other.folder_title != null)
				return false;
		} else if (!folder_title.equals(other.folder_title))
			return false;
		if (user_id != other.user_id)
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Folder [folder_id=" + folder_id + ", folder_title=" + folder_title + ", user_id=" + user_id + "]";
	}
	
}
