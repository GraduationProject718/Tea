package servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
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

import Service.VideosService;
import entity.Article;
import entity.PageModel;
import entity.Videos;
import utils.UUIDUtils;
import utils.UploadUtils;

public class VideosServlet extends BaseServlet {
	VideosService videosService = new VideosService();
	public String findAllByAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int curNum = Integer.parseInt(request.getParameter("num"));
		PageModel pm = videosService.findAllByAdmin(curNum);
		request.setAttribute("page", pm);
		return "/admin/videos/videosList.jsp";
	}
	
	public String findAllVideosByPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int curNum = Integer.parseInt(request.getParameter("num"));
		PageModel pm = videosService.findAllVideosByPage(curNum);
		request.setAttribute("page", pm);
		return "video.jsp";
	}
	
	public String getIndexVideos(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Videos> videos = videosService.getIndexVideos();
		request.getSession().setAttribute("indexVideos", videos);
		response.sendRedirect("index.jsp");
		return null;
	}
	public String del(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		videosService.del(id);
		response.sendRedirect("VideosServlet?method=findAllByAdmin&num=1");
		return null;
	}
	
	public String addVideos(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String,String> map=new HashMap<String,String>();
		Videos videos = new Videos();
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
					String realPath=getServletContext().getRealPath("/videos/");
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
					map.put("url", "/videos/"+dir+"/"+newFileName);
				}
			}
			BeanUtils.populate(videos, map);
			videos.setId(UUIDUtils.getId());
			videos.setDate(new Date());
			videosService.addVideos(videos);
			response.sendRedirect("VideosServlet?method=findAllByAdmin&num=1");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
