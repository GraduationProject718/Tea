package service;

import java.util.ArrayList;

import javax.servlet.jsp.jstl.sql.Result;

import dao.Dao;
import entity.User;

public class UserService {
	Dao dao = new Dao();
	public boolean register(User u) {
		String sql = "insert into user(account,password,name,info,gender,birthday,address,phone,imgName,imgUrl) "
				+ "value('"+u.getAccount()+"','"+u.getPassword()+"','"+u.getName()+"','"+u.getInfo()+"','"+u.getGender()+"','"+u.getBirthday()+"','"+u.getAddress()+"','"+u.getPhone()+"','"+u.getImgName()+"','"+u.getImgUrl()+"')";
		if(dao.update(sql)>0){
			return true;
		}
		return false;
	}
	public ArrayList<User> getAll() {
		ArrayList<User> user = new ArrayList<User>();
		String sql = "select * from user";
		Result result = dao.getList(sql);
		Object[][] data = result.getRowsByIndex();
		for(int i=0; i<data.length; i++){
			User u = new User();
			u.setId(Integer.valueOf(data[i][0].toString()));
			u.setAccount(data[i][1].toString());
			u.setPassword(data[i][2].toString());
			u.setName(data[i][3].toString());
			u.setInfo(data[i][4].toString());
			u.setGender(data[i][5].toString());
			u.setBirthday(data[i][6].toString());
			u.setAddress(data[i][7].toString());
			u.setPhone(data[i][8].toString());
			u.setImgName(data[i][9].toString());
			u.setImgUrl(data[i][10].toString());
			user.add(u);
		}
		return user;
	}

}
