package dao;

import org.apache.commons.dbutils.QueryRunner;


import entity.Ware;
import utils.JDBCUtils;

public class WareDao {

	public void addWare(Ware ware) throws Exception{
		String sql = "insert into ware values(?,?,?,?,?)";
		QueryRunner qr=new QueryRunner(JDBCUtils.getDataSource());
		Object[] params={ware.getId(),ware.getName(),ware.getDesc(),ware.getImg(),ware.getDate()};
		qr.update(sql,params);
	}

}
