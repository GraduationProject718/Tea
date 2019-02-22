package action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import entity.PageModel;
import entity.User;
import entity.Video;
import service.UserService;

/**
 * Servlet implementation class User
 */
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String UPLOAD_DIRECTORY = "upload//video";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String flag = request.getParameter("flag");
		UserService userService = new UserService();
		PrintWriter out = response.getWriter();
		
		if("login".equals(flag)) {
			String account = request.getParameter("account");
			String password = request.getParameter("password");
			ArrayList<User> list = userService.getAll();
			for(User u: list){ 
				if(u.getAccount().equals(account) && u.getPassword().equals(password)){
					request.getSession().setAttribute("user", u);		
				}else{
					out.write("您输入的账号或者密码有误，请重新输入"); 
				}
			}
		}
		if("register".equals(flag)) {
			String account = request.getParameter("account");
			String password = request.getParameter("password");
			User user = new User();
			user.setAccount(account);
			user.setPassword(password);
			user.setName(account);
			user.setInfo("这个人很懒，什么都没有留下-_-!!!");
			user.setGender("男");
			user.setBirthday("2000-01-01");
			user.setAddress("");
			user.setPhone("");
			user.setImgName("moren.jpg");
			user.setImgUrl("img/moren.jpg");
			if(userService.register(user)) {
				out.print("注册成功，请进行登录!");
			}
		}
		
		if("uploadVideo".equals(flag)) {
			Map<String,String> map = new HashMap<String,String>();
			Video video = new Video();
			try {
				DiskFileItemFactory fac = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(fac);
				List<FileItem> list = upload.parseRequest(request);
				// 遍历集合
				for(FileItem item:list) {
					if(item.isFormField()) {
						map.put(item.getFieldName(), item.getString("UTF-8"));
					}else {
						InputStream is = item.getInputStream();
						
						String realPath = getServletContext().getRealPath("/")+File.separator+UPLOAD_DIRECTORY;
						File file = new File(realPath,item.getName());
						if(!file.exists()) {
							file.createNewFile();
						}
						OutputStream os = new FileOutputStream(file);
						IOUtils.copy(is,os);
						is.close();
						IOUtils.closeQuietly(is);
						IOUtils.closeQuietly(os);
						String url = realPath+"\\"+item.getName();
						map.put("url","/upload/video/"+item.getName());
					}
				}
				BeanUtils.populate(video, map);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			if(userService.uploadVideo(video)) {
				 response.sendRedirect("../myUser.jsp");
			}
		}
		
		if("findUserWithPage".equals(flag)) {
			int currNum = Integer.valueOf(request.getParameter("num"));
			PageModel pm = userService.findUserWithPage(currNum);
			request.setAttribute("page", pm);
			response.sendRedirect("../admin/user/user.jsp");
		}
		out.flush();
		out.close();
	}

}
