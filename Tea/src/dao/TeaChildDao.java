package dao;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import entity.TeaChild;
import utils.JDBCUtils;

public class TeaChildDao {

	public void add(TeaChild teaChild)  throws Exception{
		String sql = "insert into teachild values(?,?,?,?,?)";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		Object[] params= {teaChild.getId(),teaChild.getParentId(),teaChild.getName(),teaChild.getDesc(),teaChild.getFunction()};
		qr.update(sql,params);
	}

	public List<TeaChild> getAllTeaChild() throws Exception{
		String sql="select * from teachild";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<TeaChild>(TeaChild.class));
	}

}
