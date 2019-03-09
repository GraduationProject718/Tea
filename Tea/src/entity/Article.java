package entity;


public class Article {
	private String id;
	private String title;
	private String content;
	private String typeId;
	private String date;
	private String img;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getTypeId() {
		return typeId;
	}
	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	
	@Override
	public String toString() {
		return "Article [id=" + id + ", title=" + title + ", content=" + content + ", typeId=" + typeId + ", date="
				+ date + ", img=" + img + "]";
	}
	
	public Article(String id, String title, String content, String typeId, String date, String img) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.typeId = typeId;
		this.date = date;
		this.img = img;
	}
	public Article() {
	}
}
