package dao;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import entity.Article;
import entity.LiuYan;
import utils.JDBCUtils;

public class LiuYanDao {

	public void add(LiuYan liuyan) throws Exception{
		String sql = "insert into liuyan values(?,?,?,?)";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		Object[] params = {liuyan.getId(),liuyan.getContent(),liuyan.getUid(),liuyan.getDate()};
		qr.update(sql,params);
	}

	public int findTotalRecordsByIndex() throws Exception{
		String sql = "select count(*) from liuyan";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		Long num = (Long)qr.query(sql, new ScalarHandler());
		return num.intValue();
	}

	public List<LiuYan> findAllByIndex(int startIndex, int pageSize)throws Exception {
		String sql = "select * from liuyan order by date desc limit ?,?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<LiuYan>(LiuYan.class),startIndex,pageSize);
	}

	public void del(String id) throws Exception {
		String sql = "delete from liuyan where id=?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		qr.update(sql,id);
		
	}

}
