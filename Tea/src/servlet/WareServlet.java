package servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
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

import Service.WareService;
import entity.PageModel;
import entity.Ware;
import utils.UUIDUtils;
import utils.UploadUtils;

public class WareServlet extends BaseServlet {
	WareService wareService = new WareService();
	public String addWarePage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/admin/ware/add.jsp";
	}
	public String del(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		wareService.del(id);
		response.sendRedirect("WareServlet?method=findAllWareByAdmin&num=1");
		return null;
	}
	
	public String edit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		Ware ware = wareService.getWareById(id);
		request.setAttribute("ware", ware);
		return "/admin/ware/edit.jsp";
	}
	public String findAllWareByIndex(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int curNum = Integer.parseInt(request.getParameter("num"));
		PageModel pm = wareService.findAllWareByIndex(curNum);
		request.setAttribute("page", pm);
		return "ware.jsp";
	}
	public String findAllWareByAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int curNum = Integer.parseInt(request.getParameter("num"));
		PageModel pm = wareService.findAllWareByAdmin(curNum);
		request.setAttribute("page", pm);
		return "/admin/ware/ware.jsp";
	}
	public String editOK(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String,String> map=new HashMap<String,String>();
		Ware ware = new Ware();
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
					String realPath=getServletContext().getRealPath("/upload/");
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
					map.put("img", "/upload/"+dir+"/"+newFileName);
				}
			}
			BeanUtils.populate(ware, map);
			ware.setDate(new Date());
			wareService.editOK(ware);
			response.sendRedirect("WareServlet?method=findAllWareByAdmin&num=1");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public String addWare(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String,String> map=new HashMap<String,String>();
		Ware ware = new Ware();
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
					String realPath=getServletContext().getRealPath("/upload/");
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
					map.put("img", "/upload/"+dir+"/"+newFileName);
				}
			}
			BeanUtils.populate(ware, map);
			ware.setId(UUIDUtils.getId());
			ware.setDate(new Date());
			wareService.addWare(ware);
			response.sendRedirect("WareServlet?method=findAllWareByAdmin&num=1");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
