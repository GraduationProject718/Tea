package dao;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import entity.Article;
import entity.Videos;
import entity.Ware;
import utils.JDBCUtils;

public class WareDao {

	public void addWare(Ware ware) throws Exception{
		String sql = "insert into ware values(?,?,?,?,?)";
		QueryRunner qr=new QueryRunner(JDBCUtils.getDataSource());
		Object[] params={ware.getId(),ware.getName(),ware.getDesc(),ware.getImg(),ware.getDate()};
		qr.update(sql,params);
	}

	public int findTotalRecordsByAll() throws Exception{
		String sql = "select count(*) from ware";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		Long num = (Long)qr.query(sql, new ScalarHandler());
		return num.intValue();
	}

	public List<Ware> findAllWareByIndex(int startIndex, int pageSize) throws Exception{
		String sql = "select * from ware order by date desc limit ?,?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<Ware>(Ware.class),startIndex,pageSize);
	}

	public List<Ware> findAllWareByAdmin(int startIndex, int pageSize) throws Exception{
		String sql = "select * from ware order by date desc limit ?,?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<Ware>(Ware.class),startIndex,pageSize);
	}

	public void del(String id) throws Exception{
		String sql = "delete from ware where id=?";
		QueryRunner qr=new QueryRunner(JDBCUtils.getDataSource());
		qr.update(sql,id);
	}

	public Ware getWareById(String id) throws Exception{
		String sql = "select * from ware where id=?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanHandler<Ware>(Ware.class),id);
	}

	public void editOK(Ware ware) throws Exception{
		String sql="update ware set name=? where id=?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		qr.update(sql,ware.getName(),ware.getId());
	}

}
