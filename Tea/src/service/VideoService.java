package service;

import java.util.ArrayList;

import javax.servlet.jsp.jstl.sql.Result;

import dao.Dao;
import entity.Video;

public class VideoService {
	Dao dao = new Dao();
	public ArrayList<Video> getVideo() {
		ArrayList<Video> video = new ArrayList<Video>();
		String sql = "select * from video";
		Result result = dao.getList(sql);
		Object[][] data = result.getRowsByIndex();
		for(int i=0; i<data.length; i++){
			Video v = new Video();
			v.setId(Integer.valueOf(data[i][0].toString()));
			v.setName(data[i][1].toString());
			v.setUrl(data[i][2].toString());
			v.setInformation(data[i][3].toString());
			video.add(v);
		}
		return video;
	}

}
