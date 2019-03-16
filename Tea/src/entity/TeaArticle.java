package entity;

import java.util.Date;

public class TeaArticle {
	private String id;
	private String teaChildId;
	private String title;
	private String content;
	private Date date;
	private String img;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTeaChildId() {
		return teaChildId;
	}
	public void setTeaChildId(String teaChildId) {
		this.teaChildId = teaChildId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public TeaArticle() {
	}
	public TeaArticle(String id, String teaChildId, String title, String content, Date date, String img) {
		super();
		this.id = id;
		this.teaChildId = teaChildId;
		this.title = title;
		this.content = content;
		this.date = date;
		this.img = img;
	}
	@Override
	public String toString() {
		return "TeaArticle [id=" + id + ", teaChildId=" + teaChildId + ", title=" + title + ", content=" + content
				+ ", date=" + date + ", img=" + img + "]";
	}
	
}
