package dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import entity.User;
import utils.JDBCUtils;

public class UserDao {

	public User login(User user) throws Exception{
		String sql = "select * from user where account = ? and password=?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanHandler<User>(User.class),user.getAccount(),user.getPassword());
	}

	public void register(User u) throws Exception{
		String sql = "insert into user values(?,?,?,?,?,?,?,?,?,?,?)";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		Object[] params = {u.getId(),u.getAccount(),u.getPassword(),u.getName(),u.getInfo(),u.getGender(),u.getBirthday(),u.getAddress(),u.getPhone(),u.getImg(),u.getDate()};
		qr.update(sql,params);
	}

}
