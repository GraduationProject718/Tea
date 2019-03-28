package Service;

import java.util.List;

import dao.LiuYanDao;
import entity.Article;
import entity.LiuYan;
import entity.PageModel;

public class LiuYanService {
	LiuYanDao liuyanDao = new LiuYanDao();
	public void add(LiuYan liuyan)throws Exception {
		liuyanDao.add(liuyan);
	}
	public PageModel findAllByIndex(int curNum) throws Exception {
		int totalRecords =liuyanDao.findTotalRecordsByIndex();
		PageModel pm = new PageModel(curNum,totalRecords,8);
		List<LiuYan> list = liuyanDao.findAllByIndex(pm.getStartIndex(),pm.getPageSize());
		pm.setList(list);
		pm.setUrl("LiuYanServlet?method=findAllByIndex");
		return pm;
	}
	public PageModel findAllByAdmin(int curNum) throws Exception {
		int totalRecords =liuyanDao.findTotalRecordsByIndex();
		PageModel pm = new PageModel(curNum,totalRecords,8);
		List<LiuYan> list = liuyanDao.findAllByIndex(pm.getStartIndex(),pm.getPageSize());
		pm.setList(list);
		pm.setUrl("LiuYanServlet?method=findAllByAdmin");
		return pm;
	}
	public void del(String id) throws Exception{	
		liuyanDao.del(id);
	}

}
