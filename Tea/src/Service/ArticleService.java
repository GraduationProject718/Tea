package Service;

import java.sql.SQLException;
import java.util.List;

import dao.ArticleDao;
import entity.Article;
import entity.PageModel;

public class ArticleService {
	ArticleDao articleDao = new ArticleDao();
	public void addArticle(Article article) throws SQLException {
		articleDao.addArticle(article);
	}
	public PageModel getList(int curNum)throws SQLException {
		int totalRecords =articleDao.findTotalRecords();
		PageModel pm = new PageModel(curNum,totalRecords,5);
		List<Article> list = articleDao.getList(pm.getStartIndex(),pm.getPageSize());
		pm.setList(list);
		pm.setUrl("ArticleServlet?method=getList");
		return pm;
	}
	public boolean delArticle(String id) throws Exception{
		if(articleDao.delArticle(id)) {
			return true;
		}
		return false;
	}
	public Article editArticleById(String id) throws Exception{
		return articleDao.editArticleById(id);
	}
	public void editArticle(Article article) throws Exception{
		articleDao.editArticle(article);
	}
	public PageModel findArticleByTypeId(int curNum, String typeId)throws Exception {
		int totalRecords =articleDao.findTotalRecords(typeId);
		PageModel pm = new PageModel(curNum,totalRecords,5);
		List<Article> list = articleDao.findArticleByTypeId(pm.getStartIndex(),pm.getPageSize(),typeId);
		pm.setList(list);
		pm.setUrl("ArticleServlet?method=findArticleByTypeId&typeId="+typeId);
		return pm;
	}
	public Article findArticleById(String id) throws Exception{
		return articleDao.findArticleById(id);
	}
	public List<Article> getIndexArticle()throws Exception {
		return articleDao.getIndexArticle();
	}

}
