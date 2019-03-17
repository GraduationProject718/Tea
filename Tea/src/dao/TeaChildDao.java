package dao;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import entity.TeaChild;
import utils.JDBCUtils;

public class TeaChildDao {

	public void add(TeaChild teaChild)  throws Exception{
		String sql = "insert into teachild values(?,?,?,?,?)";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		Object[] params= {teaChild.getId(),teaChild.getParentId(),teaChild.getName(),teaChild.getInfo(),teaChild.getFunction()};
		qr.update(sql,params);
	}

	public List<TeaChild> getAllTeaChild() throws Exception{
		String sql="select * from teachild";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<TeaChild>(TeaChild.class));
	}

	public void delTeaChild(String id) throws Exception{
		String sql = "delete from teachild where id=?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		qr.update(sql,id);
	}

	public TeaChild editTeaChild(String id) throws Exception{
		String sql = "select * from teachild where id=?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanHandler<TeaChild>(TeaChild.class),id);
	}

	public void edit(TeaChild teaChild) throws Exception{
		String sql ="update teachild set parentId=?, name=?, info=?, function=? where id=?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		Object[] params = {teaChild.getParentId(),teaChild.getName(),teaChild.getInfo(),teaChild.getFunction(),teaChild.getId()};
		qr.update(sql,params);
	}

}
	