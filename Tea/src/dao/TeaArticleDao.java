package dao;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import entity.Article;
import entity.TeaArticle;
import utils.JDBCUtils;

public class TeaArticleDao {

	public void add(TeaArticle teaArticle) throws Exception{
		String sql = "insert into teaarticle values(?,?,?,?,?,?)";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		Object[] params = {teaArticle.getId(),teaArticle.getTeaChildId(),teaArticle.getTitle(),teaArticle.getContent(),teaArticle.getDate(),teaArticle.getImg()};
		qr.update(sql,params);
	}

	public int findAllTotalRecords() throws Exception{
		String sql = "select count(*) from teaarticle";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		Long num = (Long)qr.query(sql, new ScalarHandler());
		return num.intValue();
	}

	public List<TeaArticle> findAllByAdmin(int startIndex, int pageSize) throws Exception{
		String sql = "select * from teaarticle order by date desc limit ?,?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<TeaArticle>(TeaArticle.class),startIndex,pageSize);

	}

	public void delTeaArticle(String id) throws Exception{
		String sql = "delete from teaarticle where id=?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		qr.update(sql,id);
	}

	public TeaArticle editTeaArticle(String id) throws Exception{
		String sql = "select * from teaarticle where id=?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanHandler<TeaArticle>(TeaArticle.class),id);
	}

	public List<TeaArticle> findAllByIndex(int startIndex, int pageSize) throws Exception{
		String sql = "select * from teaarticle order by date desc limit ?,?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<TeaArticle>(TeaArticle.class),startIndex,pageSize);
	}

	public TeaArticle findTeaArticleById(String id) throws Exception{
		String sql = "select * from teaarticle where id=?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanHandler<TeaArticle>(TeaArticle.class),id);
	}

	public List<TeaArticle> findPartByIndex() throws Exception{
		String sql = "select * from teaarticle order by date limit 0,6";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<TeaArticle>(TeaArticle.class));
	}

}
