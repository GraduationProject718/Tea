package entity;

import java.util.Date;

public class HuiFu {
	private String id;
	private String uid;
	private String lid;
	private String content;
	private Date date;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getLid() {
		return lid;
	}
	public void setLid(String lid) {
		this.lid = lid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public HuiFu(String id, String uid, String lid, String content, Date date) {
		super();
		this.id = id;
		this.uid = uid;
		this.lid = lid;
		this.content = content;
		this.date = date;
	}
	@Override
	public String toString() {
		return "HuiFu [id=" + id + ", uid=" + uid + ", lid=" + lid + ", content=" + content + "]";
	}
	public HuiFu() {
	}
}
