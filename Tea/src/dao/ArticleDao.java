package dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;


import entity.Article;
import utils.JDBCUtils;

public class ArticleDao {

	public void addArticle(Article article) throws SQLException{
		String sql = "insert into article values(?,?,?,?,?,?)";
		QueryRunner qr=new QueryRunner(JDBCUtils.getDataSource());
		Object[] params={article.getId(),article.getTitle(),article.getContent(),article.getTypeId(),article.getDate(),article.getImg()};
		qr.update(sql,params);
	}

	public int findTotalRecords() throws SQLException{
		String sql = "select count(*) from article";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		Long num = (Long)qr.query(sql, new ScalarHandler());
		return num.intValue();
	}

	public List<Article> getList(int startIndex, int pageSize)throws SQLException {
		String sql = "select * from article order by date desc limit ?,?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<Article>(Article.class),startIndex,pageSize);
	}

	public boolean delArticle(String id) throws SQLException{
		String sql = "delete from article where id = ?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		qr.update(sql,id);
		return true;
	}

	public Article editArticleById(String id) throws SQLException{
		String sql ="select * from article where id=?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanHandler<Article>(Article.class),id);
	}

	public void editArticle(Article article)throws SQLException {
		String sql="UPDATE article SET title=?, content=?, typeId=?, date=?, img=? WHERE id=?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		Object[] params={article.getTitle(),article.getContent(),article.getTypeId(),article.getDate(),article.getImg(),article.getId()};
		qr.update(sql,params);
	}

	public int findTotalRecords(String typeId) throws SQLException{
		String sql = "select count(*) from article where typeId=?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		Long num = (Long)qr.query(sql, new ScalarHandler(),typeId);
		return num.intValue();
	}

	public List<Article> findArticleByTypeId(int startIndex, int pageSize, String typeId)throws SQLException {
		String sql = "select * from article where typeId=? order by date desc limit ?,?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<Article>(Article.class),typeId,startIndex,pageSize);

	}

	public Article findArticleById(String id) throws Exception{
		String sql = "select * from article where id=?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		Article article = qr.query(sql, new BeanHandler<Article>(Article.class),id);
		return article;
	}

	public List<Article> getIndexArticle() throws Exception{
		String sql = "select * from article where typeId=4 order by date desc limit 0,5";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<Article>(Article.class));
	}

}
