package entity;

import java.util.Date;

public class LiuYan {
	private String id;
	private String content;
	private String uid;
	private Date date;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public LiuYan(String id, String content, String uid, Date date) {
		super();
		this.id = id;
		this.content = content;
		this.uid = uid;
		this.date = date;
	}
	@Override
	public String toString() {
		return "LiuYan [id=" + id + ", content=" + content + ", uid=" + uid + ", date=" + date + "]";
	}
	public LiuYan() {
	}
}
