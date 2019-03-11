package dao;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import entity.Videos;
import utils.JDBCUtils;

public class VideosDao {

	public void addVideos(Videos videos) throws Exception{
		String sql = "insert into video values(?,?,?,?,?)";
		QueryRunner qr=new QueryRunner(JDBCUtils.getDataSource());
		Object[] params={videos.getId(),videos.getName(),videos.getUrl(),videos.getInformation(),videos.getDate()};
		qr.update(sql,params);
	}

	public List<Videos> getIndexVideos() throws Exception{
		String sql = "select * from video order by date desc limit 0,5";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<Videos>(Videos.class));
	}

}
