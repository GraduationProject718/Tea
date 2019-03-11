package entity;

import java.util.Date;

public class User {
	private String id;
	private String account;
	private String password;
	private String name;
	private String info;
	private String gender;
	private String birthday;
	private String address;
	private String phone;
	private String img;
	private Date date;	// 注册时间
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public User() {
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", account=" + account + ", password=" + password + ", name=" + name + ", info="
				+ info + ", gender=" + gender + ", birthday=" + birthday + ", address=" + address + ", phone=" + phone
				+ ", img=" + img + ", date=" + date + "]";
	}
	public User(String id, String account, String password, String name, String info, String gender, String birthday,
			String address, String phone, String img, Date date) {
		super();
		this.id = id;
		this.account = account;
		this.password = password;
		this.name = name;
		this.info = info;
		this.gender = gender;
		this.birthday = birthday;
		this.address = address;
		this.phone = phone;
		this.img = img;
		this.date = date;
	}
	
	
}
