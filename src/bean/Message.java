package bean;

import java.util.Date;

public class Message {
	private int message_id;
	private String receive_username;
	private String sent_username;
	private int type;
	private Date message_time;
	private int state;
	private String content;
	private int related;
	public int getMessage_id() {
		return message_id;
	}
	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}
	public String getReceive_username() {
		return receive_username;
	}
	public void setReceive_username(String receive_username) {
		this.receive_username = receive_username;
	}
	public String getSent_username() {
		return sent_username;
	}
	public void setSent_username(String sent_username) {
		this.sent_username = sent_username;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public Date getMessage_time() {
		return message_time;
	}
	public void setMessage_time(Date message_time) {
		this.message_time = message_time;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRelated() {
		return related;
	}
	public void setRelated(int related) {
		this.related = related;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + message_id;
		result = prime * result + ((message_time == null) ? 0 : message_time.hashCode());
		result = prime * result + ((receive_username == null) ? 0 : receive_username.hashCode());
		result = prime * result + related;
		result = prime * result + ((sent_username == null) ? 0 : sent_username.hashCode());
		result = prime * result + state;
		result = prime * result + type;
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
		Message other = (Message) obj;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (message_id != other.message_id)
			return false;
		if (message_time == null) {
			if (other.message_time != null)
				return false;
		} else if (!message_time.equals(other.message_time))
			return false;
		if (receive_username == null) {
			if (other.receive_username != null)
				return false;
		} else if (!receive_username.equals(other.receive_username))
			return false;
		if (related != other.related)
			return false;
		if (sent_username == null) {
			if (other.sent_username != null)
				return false;
		} else if (!sent_username.equals(other.sent_username))
			return false;
		if (state != other.state)
			return false;
		if (type != other.type)
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Message [message_id=" + message_id + ", receive_username=" + receive_username + ", sent_username="
				+ sent_username + ", type=" + type + ", message_time=" + message_time + ", state=" + state
				+ ", content=" + content + ", related=" + related + "]";
	}
	
}
