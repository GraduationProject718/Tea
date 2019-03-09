package servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import Service.ArticleService;
import Service.ArticleTypeService;
import entity.Article;
import entity.ArticleType;
import entity.PageModel;
import utils.UUIDUtils;
import utils.UploadUtils;

public class ArticleServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;
	ArticleService  articleService = new ArticleService();
	public String addArticlePage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArticleTypeService articleTypeService = new ArticleTypeService();
		List<ArticleType> articleTypeList = articleTypeService.getAllArticleType();
		request.setAttribute("articleTypeList", articleTypeList);
		return "/admin/article/add.jsp";
	}
	
	public String getList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int curNum = Integer.parseInt(request.getParameter("num"));
		PageModel pm = articleService.getList(curNum);
		request.setAttribute("page", pm);
		return "/admin/article/articleList.jsp";
	}
	
	public String delArticle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		if(articleService.delArticle(id)) {
			response.sendRedirect("ArticleServlet?method=getList&num=1");
		}
		return null;
	}
	
	public String editArticleById(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		Article article = articleService.editArticleById(id);
		request.setAttribute("article", article);
		ArticleTypeService articleTypeService = new ArticleTypeService();
		List<ArticleType> articleTypeList = articleTypeService.getAllArticleType();
		request.setAttribute("articleTypeList", articleTypeList);
		return "/admin/article/edit.jsp";
	}
	
	public String addArticle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String,String> map=new HashMap<String,String>();
		Article article = new Article();
		try {
			DiskFileItemFactory fac=new DiskFileItemFactory();
			ServletFileUpload upload=new ServletFileUpload(fac);
			List<FileItem> list=upload.parseRequest(request);
			for (FileItem item : list) {
				if(item.isFormField()){
					map.put(item.getFieldName(), item.getString("utf-8"));
				}else{
					String oldFileName=item.getName();
					String newFileName=UploadUtils.getUUIDName(oldFileName);
					InputStream is=item.getInputStream();
					String realPath=getServletContext().getRealPath("/img/");
					String dir=UploadUtils.getDir(newFileName); 
					String path=realPath+dir; 
					File newDir=new File(path);
					if(!newDir.exists()){
						newDir.mkdirs();
					}
					File finalFile=new File(newDir,newFileName);
					if(!finalFile.exists()){
						finalFile.createNewFile();
					}
					OutputStream os=new FileOutputStream(finalFile);
					IOUtils.copy(is, os);
					IOUtils.closeQuietly(is);
					IOUtils.closeQuietly(os);
					map.put("img", "/img/"+dir+"/"+newFileName);
				}
			}
			BeanUtils.populate(article, map);
			article.setId(UUIDUtils.getId());
			articleService.addArticle(article);
			response.sendRedirect("ArticleServlet?method=getList&num=1");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String editArticle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String,String> map=new HashMap<String,String>();
		Article article = new Article();
		try {
			DiskFileItemFactory fac=new DiskFileItemFactory();
			ServletFileUpload upload=new ServletFileUpload(fac);
			List<FileItem> list=upload.parseRequest(request);
			for (FileItem item : list) {
				if(item.isFormField()){
					map.put(item.getFieldName(), item.getString("utf-8"));
				}else{
					String oldFileName=item.getName();
					String newFileName=UploadUtils.getUUIDName(oldFileName);
					InputStream is=item.getInputStream();
					String realPath=getServletContext().getRealPath("/img/");
					String dir=UploadUtils.getDir(newFileName); 
					String path=realPath+dir; 
					File newDir=new File(path);
					if(!newDir.exists()){
						newDir.mkdirs();
					}
					File finalFile=new File(newDir,newFileName);
					if(!finalFile.exists()){
						finalFile.createNewFile();
					}
					OutputStream os=new FileOutputStream(finalFile);
					IOUtils.copy(is, os);
					IOUtils.closeQuietly(is);
					IOUtils.closeQuietly(os);
					map.put("img", "/img/"+dir+"/"+newFileName);
				}
			}
			BeanUtils.populate(article, map);
			articleService.editArticle(article);
			response.sendRedirect("ArticleServlet?method=getList&num=1");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
