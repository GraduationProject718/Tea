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

import Service.UserService;
import entity.User;
import utils.UUIDUtils;
import utils.UploadUtils;

public class UserServlet extends BaseServlet {
	UserService userService = new UserService();
	
	public String userImg(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String,String> map=new HashMap<String,String>();
		User user= new User();
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
					String realPath=getServletContext().getRealPath("/img/user/");
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
					map.put("img", "/img/user/"+dir+"/"+newFileName);
				}
			}
			BeanUtils.populate(user, map);
			userService.userImg(user);
			response.sendRedirect("UserServlet?method=findUserById&id="+user.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public String userPassword(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String password = request.getParameter("newPassword");
		String id= request.getParameter("id");
		userService.userPassword(id,password);
		response.sendRedirect("UserServlet?method=findUserById&id="+id);
		return null;
	}
	public String ziliao(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String name= request.getParameter("name");
		String info= request.getParameter("info");
		String gender= request.getParameter("gender");
		String birthday= request.getParameter("birthday");
		String address= request.getParameter("address");
		String phone= request.getParameter("phone");
		User user = new User();
		user.setId(id);
		user.setName(name);
		user.setInfo(info);
		user.setGender(gender);
		user.setBirthday(birthday);
		user.setAddress(address);
		user.setPhone(phone);
		userService.ziliao(user);
		response.sendRedirect("UserServlet?method=findUserById&id="+id);
		return null;
	}
	
	public String findUserById(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		User user = userService.findUserById(id);
		request.getSession().setAttribute("user", user);
		response.sendRedirect("user.jsp");
		return null;
	}
	
	public String tuichu(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getSession().invalidate();
		response.sendRedirect("index.jsp");
		return null;
	}
	
	public String login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String account = request.getParameter("account");
		String password= request.getParameter("password");
		User user = userService.login(account,password);
		request.getSession().setAttribute("user", user);
		response.sendRedirect("index.jsp");
		return null;
	}
	
	public String register(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String account= request.getParameter("account");
		String password= request.getParameter("password");
		String name= request.getParameter("name");
		String phone= request.getParameter("phone");
		User u = new User();
		u.setId(UUIDUtils.getId());
		u.setAccount(account);
		u.setPassword(password);
		u.setName(name);
		u.setInfo("");
		u.setGender("男");
		u.setBirthday("2000-01-01");
		u.setAddress("");
		u.setPhone(phone);
		u.setImg("img/moren.jpg");
		u.setDate(new Date());
		userService.register(u);
		response.sendRedirect("login.jsp");
		return null;
	}
}
