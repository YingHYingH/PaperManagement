package bean;

import java.util.Date;

import com.ssdut.dao.DiscussDao;
import com.ssdut.dao.UserDao;

public class Comment {

	private int comment_id;
	private int discuss_id;
	private String content;
	private Date time;
	private int user_id;
	private User user;
	private Discuss discuss;
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public int getDiscuss_id() {
		return discuss_id;
	}
	public void setDiscuss_id(int discuss_id) {
		this.discuss_id = discuss_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public User getUser() throws Exception {
		this.user = new UserDao().getUserById(user_id);
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Discuss getDiscuss() throws Exception {
		this.discuss = new DiscussDao().getDiscussById(discuss_id);
		return discuss;
	}
	public void setDiscuss(Discuss discuss) {
		this.discuss = discuss;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + comment_id;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((discuss == null) ? 0 : discuss.hashCode());
		result = prime * result + discuss_id;
		result = prime * result + ((time == null) ? 0 : time.hashCode());
		result = prime * result + ((user == null) ? 0 : user.hashCode());
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
		Comment other = (Comment) obj;
		if (comment_id != other.comment_id)
			return false;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (discuss == null) {
			if (other.discuss != null)
				return false;
		} else if (!discuss.equals(other.discuss))
			return false;
		if (discuss_id != other.discuss_id)
			return false;
		if (time == null) {
			if (other.time != null)
				return false;
		} else if (!time.equals(other.time))
			return false;
		if (user == null) {
			if (other.user != null)
				return false;
		} else if (!user.equals(other.user))
			return false;
		if (user_id != other.user_id)
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Comment [comment_id=" + comment_id + ", discuss_id=" + discuss_id + ", content=" + content + ", time="
				+ time + ", user_id=" + user_id + ", user=" + user + ", discuss=" + discuss + "]";
	}
	
}
