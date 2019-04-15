package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.ArticleService;
import Service.TeaArticleService;
import Service.VideosService;
import Service.WareService;
import entity.Article;
import entity.TeaArticle;
import entity.Videos;
import entity.Ware;

public class IndexServlet extends BaseServlet {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArticleService  articleService = new ArticleService();
		List<Article> article = articleService.getIndexArticle();
		request.setAttribute("indexArticle", article);
		
		List<Article> historyArticle = articleService.findArticleByTypeId("3");
		request.setAttribute("historyArticle", historyArticle);

		List<Article> artArticle = articleService.findArticleByTypeId("2");
		request.setAttribute("artArticle", artArticle);
		
		List<Article> healthArticle = articleService.findArticleByTypeId("1");
		request.setAttribute("healthArticle", healthArticle);
		
		
		VideosService videosService = new VideosService();
		List<Videos> videos = videosService.getIndexVideos();
		request.setAttribute("indexVideos", videos);
		
		TeaArticleService teaArticleService = new TeaArticleService();
		List<TeaArticle> indexTeaArticle = teaArticleService.findPartByIndex();
		request.setAttribute("indexTeaArticle", indexTeaArticle);
		
		WareService wareService = new WareService();
		List<Ware> indexWare = wareService.findPartByIndex();
		request.setAttribute("indexWare", indexWare);
		return "index.jsp";
	}
}
