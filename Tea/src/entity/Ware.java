package entity;

import java.util.Date;

public class Ware {
	private String id;
	private String name;
	private String desc;
	private String img;
	private Date date;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Ware() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Ware [id=" + id + ", name=" + name + ", desc=" + desc + ", img=" + img + ", date=" + date + "]";
	}
	public Ware(String id, String name, String desc, String img, Date date) {
		super();
		this.id = id;
		this.name = name;
		this.desc = desc;
		this.img = img;
		this.date = date;
	}
	
}
