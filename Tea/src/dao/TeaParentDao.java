package dao;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import entity.Article;
import entity.TeaParent;
import utils.JDBCUtils;

public class TeaParentDao {

	public void add(TeaParent teaParent) throws Exception{
		String sql = "insert into teaparent values(?,?)";
		QueryRunner qr=new QueryRunner(JDBCUtils.getDataSource());
		Object[] params={teaParent.getId(),teaParent.getName()};
		qr.update(sql,params);
	}

	public List<TeaParent> getAllTeaParent() throws Exception{
		String sql = "select * from teaparent";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<TeaParent>(TeaParent.class));

	}

	

}
