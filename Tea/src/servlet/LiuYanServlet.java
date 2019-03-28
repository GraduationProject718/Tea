package servlet;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.LiuYanService;
import entity.LiuYan;
import entity.PageModel;
import utils.UUIDUtils;

public class LiuYanServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	LiuYanService liuyanService = new LiuYanService();
	public String add(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String uid=request.getParameter("id");
		String content=request.getParameter("content");
		
		LiuYan liuyan = new LiuYan();
		liuyan.setId(UUIDUtils.getId());
		liuyan.setContent(content);
		liuyan.setUid(uid);
		liuyan.setDate(new Date());
		
		liuyanService.add(liuyan);
		response.sendRedirect("LiuYanServlet?method=findAllByIndex&num=1");
		return null;
	}
	
	public String findAllByIndex(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int curNum = Integer.parseInt(request.getParameter("num"));
		PageModel pm = liuyanService.findAllByIndex(curNum);
		request.setAttribute("page", pm);
		return "liuyan.jsp";
	}
	
	public String findAllByAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int curNum = Integer.parseInt(request.getParameter("num"));
		PageModel pm = liuyanService.findAllByAdmin(curNum);
		request.setAttribute("page", pm);
		return "/admin/liuyan/liuyanList.jsp";
	}
	public String del(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		liuyanService.del(id);
		response.sendRedirect("LiuYanServlet?method=findAllByAdmin&num=1");
		return null;
	}
}
