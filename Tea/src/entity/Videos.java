package entity;

import java.util.Date;

public class Videos {
	private String id;
	private String name;
	private String url;
	private String information;
	private Date date;
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	public Videos() {
	}
	@Override
	public String toString() {
		return "Videos [id=" + id + ", name=" + name + ", url=" + url + ", information=" + information + ", date="
				+ date + "]";
	}
	public Videos(String id, String name, String url, String information, Date date) {
		super();
		this.id = id;
		this.name = name;
		this.url = url;
		this.information = information;
		this.date = date;
	}
	
}
