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
	public String add(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String name = request.getParameter("name");
		String parentId= request.getParameter("parentId");
		String desc= request.getParameter("desc");
		String function = request.getParameter("function");
		TeaChild teaChild = new TeaChild();
		teaChild.setId(UUIDUtils.getId());
		teaChild.setParentId(parentId);
		teaChild.setName(name);
		teaChild.setDesc(desc);
		teaChild.setFunction(function);
		teaChildService.add(teaChild);
		response.sendRedirect("");
		return null;
	}
}
