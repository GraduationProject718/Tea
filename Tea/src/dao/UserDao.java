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

}
