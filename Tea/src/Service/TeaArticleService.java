package Service;

import java.util.List;

import dao.TeaArticleDao;
import entity.Article;
import entity.PageModel;
import entity.TeaArticle;

public class TeaArticleService {
	TeaArticleDao teaArticleDao = new TeaArticleDao();
	public void add(TeaArticle teaArticle) throws Exception{
		teaArticleDao.add(teaArticle);
	}
	public PageModel findAllByAdmin(int curNum)throws Exception {
		int totalRecords =teaArticleDao.findAllTotalRecords();
		PageModel pm = new PageModel(curNum,totalRecords,5);
		List<TeaArticle> list = teaArticleDao.findAllByAdmin(pm.getStartIndex(),pm.getPageSize());
		pm.setList(list);
		pm.setUrl("TeaArticleServlet?method=findAllByAdmin");
		return pm;
	}
	public void delTeaArticle(String id) throws Exception{
		teaArticleDao.delTeaArticle(id);
	}
	public TeaArticle editTeaArticle(String id) throws Exception{
		return teaArticleDao.editTeaArticle(id);
	}
	public PageModel findByChildId(int curNum,String childId) throws Exception{
		int totalRecords =teaArticleDao.findChildIdTotalRecords(childId);
		PageModel pm = new PageModel(curNum,totalRecords,5);
		List<TeaArticle> list = teaArticleDao.findByChildId(childId,pm.getStartIndex(),pm.getPageSize());
		pm.setList(list);
		pm.setUrl("TeaArticleServlet?method=findByChildId&childId="+childId);
		return pm;
	}
	public TeaArticle findTeaArticleById(String id) throws Exception{
		return teaArticleDao.findTeaArticleById(id);
	}
	public List<TeaArticle> findPartByIndex() throws Exception{
		return teaArticleDao.findPartByIndex();
	}

}
