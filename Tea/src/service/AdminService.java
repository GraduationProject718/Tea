package service;

import java.util.ArrayList;

import javax.servlet.jsp.jstl.sql.Result;

import dao.Dao;
import entity.Admin;

public class AdminService {
	Dao dao = new Dao();
	public ArrayList<Admin> getAll() {
		ArrayList<Admin> admin = new ArrayList<Admin>();
		String sql = "select * from admin";
		Result result = dao.getList(sql);
		Object[][] data = result.getRowsByIndex();
		for(int i=0; i<data.length; i++){
			Admin a = new Admin();
			a.setId(Integer.valueOf(data[i][0].toString()));
			a.setAccount(data[i][1].toString());
			a.setPassword(data[i][2].toString());
			admin.add(a);
		}
		return admin;
	}

}
