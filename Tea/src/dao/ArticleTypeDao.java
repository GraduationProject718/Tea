package dao;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import entity.ArticleType;
import utils.JDBCUtils;

public class ArticleTypeDao {

	public List<ArticleType> getAllArticleType() throws Exception{
		String sql = "select * from articletype";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<ArticleType>(ArticleType.class));
	}

}
