package Service;

import java.util.List;

import dao.VideosDao;
import entity.Article;
import entity.PageModel;
import entity.Videos;

public class VideosService {
	VideosDao videosDao = new VideosDao();
	public void addVideos(Videos videos) throws Exception {
		videosDao.addVideos(videos);
	}
	public List<Videos> getIndexVideos() throws Exception{
		return videosDao.getIndexVideos();
	}
	public PageModel findAllVideosByPage(int curNum) throws Exception{
		int totalRecords =videosDao.findTotalRecordsByAll();
		PageModel pm = new PageModel(curNum,totalRecords,5);
		List<Videos> list = videosDao.findAllVideosByPage(pm.getStartIndex(),pm.getPageSize());
		pm.setList(list);
		pm.setUrl("VideosServlet?method=findAllVideosByPage");
		return pm;
	}

}
