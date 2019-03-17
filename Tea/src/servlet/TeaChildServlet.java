package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.TeaChildService;
import Service.TeaParentService;
import entity.TeaChild;
import entity.TeaParent;
import utils.UUIDUtils;

public class TeaChildServlet extends BaseServlet {
	TeaChildService teaChildService = new TeaChildService();
	public String addToPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TeaParentService teaParentService = new TeaParentService();
		List<TeaParent> list= teaParentService.getAllTeaParent();
		request.setAttribute("teaParent", list);
		return "/admin/tea/addTeaChild.jsp";
	}
	public String edit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String parentId = request.getParameter("parentId");
		String name = request.getParameter("name");
		String info = request.getParameter("info");
		String function = request.getParameter("function");
		TeaChild teaChild = new TeaChild();
		teaChild.setId(id);
		teaChild.setParentId(parentId);
		teaChild.setName(name);
		teaChild.setInfo(info);
		teaChild.setFunction(function);
		teaChildService.edit(teaChild);
		response.sendRedirect("TeaArticleServlet?method=findAllByAdmin&num=1");
		return null;
	}
	public String editTeaChild(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TeaParentService teaParentService = new TeaParentService();
		List<TeaParent> list= teaParentService.getAllTeaParent();
		request.setAttribute("teaParent", list);
		
		String id = request.getParameter("id");
		TeaChild teaChild = teaChildService.editTeaChild(id);
		request.setAttribute("teaChild", teaChild);
		return "/admin/tea/editTeaChild.jsp";
		
	}
	public String delTeaChild(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		teaChildService.delTeaChild(id);
		response.sendRedirect("TeaArticleServlet?method=findAllByAdmin&num=1");
		return null;
	}
	public String add(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String name = request.getParameter("name");
		String parentId= request.getParameter("parentId");
		String info= request.getParameter("info");
		String function = request.getParameter("function");
		TeaChild teaChild = new TeaChild();
		teaChild.setId(UUIDUtils.getId());
		teaChild.setParentId(parentId);
		teaChild.setName(name);
		teaChild.setInfo(info);
		teaChild.setFunction(function);
		teaChildService.add(teaChild);
		response.sendRedirect("TeaArticleServlet?method=findAllByAdmin&num=1");
		return null;
	}
}
