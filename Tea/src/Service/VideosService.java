package Service;

import java.util.List;

import dao.VideosDao;
import entity.Videos;

public class VideosService {
	VideosDao videosDao = new VideosDao();
	public void addVideos(Videos videos) throws Exception {
		videosDao.addVideos(videos);
	}
	public List<Videos> getIndexVideos() throws Exception{
		return videosDao.getIndexVideos();
	}

}
