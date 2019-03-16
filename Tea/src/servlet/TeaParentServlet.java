package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.TeaParentService;
import entity.TeaParent;
import utils.UUIDUtils;

public class TeaParentServlet extends BaseServlet {
	TeaParentService teaParentService = new TeaParentService();
	
	public String add(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String name = request.getParameter("name");
		TeaParent teaParent = new TeaParent();
		teaParent.setId(UUIDUtils.getId());
		teaParent.setName(name);
		teaParentService.add(teaParent);
		response.sendRedirect("");
		return null;
	}
}
