package Service;

import java.util.List;

import dao.ArticleTypeDao;
import entity.ArticleType;

public class ArticleTypeService {
	ArticleTypeDao articleTypeDao = new ArticleTypeDao();
	public List<ArticleType> getAllArticleType() throws Exception{
		return articleTypeDao.getAllArticleType();
	}

}
