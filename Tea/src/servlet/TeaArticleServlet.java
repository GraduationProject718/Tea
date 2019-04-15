package servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import Service.TeaArticleService;
import Service.TeaChildService;
import Service.TeaParentService;
import entity.Article;
import entity.PageModel;
import entity.TeaArticle;
import entity.TeaChild;
import entity.TeaParent;
import utils.UUIDUtils;
import utils.UploadUtils;

public class TeaArticleServlet extends BaseServlet {
	TeaArticleService teaArticleService = new TeaArticleService();
	
	public String addToPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TeaChildService teaChildService = new TeaChildService();
		List<TeaChild> teaChild = teaChildService.getAllTeaChild();
		request.setAttribute("teaChild", teaChild);
		return "/admin/tea/addTeaArticle.jsp";
	}
	public String findTeaArticleById(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		TeaArticle teaArticle = teaArticleService.findTeaArticleById(id);
		request.setAttribute("teaArticle", teaArticle);
		return "teaArticleView.jsp";
	}
	public String findPartByIndex(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<TeaArticle> indexTeaArticle = teaArticleService.findPartByIndex();
		request.getSession().setAttribute("indexTeaArticle", indexTeaArticle);
		response.sendRedirect("index.jsp");
		return null;
		
	}
	public String delTeaArticle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		teaArticleService.delTeaArticle(id);
		response.sendRedirect("TeaArticleServlet?method=findAllByAdmin&num=1");
		return null;
	}
	
	public String editTeaArticle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		TeaArticle teaArticle = teaArticleService.editTeaArticle(id);
		request.setAttribute("teaArticle", teaArticle);
		return "/admin/tea/editTeaArticle.jsp";
	}
	public String findByChildId(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int curNum = Integer.parseInt(request.getParameter("num"));
		String childId = request.getParameter("childId");
		PageModel pm = teaArticleService.findByChildId(curNum,childId);
		request.setAttribute("page", pm);
		return "teaArticle.jsp";
	}
	public String findAllByIndex(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		TeaParentService teaParentService = new TeaParentService();
		List<TeaParent> teaParent = teaParentService.getAllTeaParent();
		request.setAttribute("teaParent", teaParent);
		
		TeaChildService teaChildService = new TeaChildService();
		List<TeaChild> teaChild = teaChildService.getAllTeaChild();
		request.setAttribute("teaChild", teaChild);
		return "tea.jsp";
	}
	public String findAllByAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int curNum = Integer.parseInt(request.getParameter("num"));
		TeaParentService teaParentService = new TeaParentService();
		List<TeaParent> teaParent = teaParentService.getAllTeaParent();
		request.setAttribute("teaParent", teaParent);
		
		TeaChildService teaChildService = new TeaChildService();
		List<TeaChild> teaChild = teaChildService.getAllTeaChild();
		request.setAttribute("teaChild", teaChild);
		
		PageModel pm = teaArticleService.findAllByAdmin(curNum);
		request.setAttribute("page", pm);
		return "/admin/tea/teaList.jsp";
	}
	public String add(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String,String> map=new HashMap<String,String>();
		TeaArticle teaArticle = new TeaArticle();
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
			BeanUtils.populate(teaArticle, map);
			teaArticle.setId(UUIDUtils.getId());
			teaArticleService.add(teaArticle);
			response.sendRedirect("TeaArticleServlet?method=findAllByAdmin&num=1");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}
}
