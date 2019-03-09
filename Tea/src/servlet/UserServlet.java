package servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.UserService;
import entity.User;

public class UserServlet extends BaseServlet {
	UserService userService = new UserService();
	public String login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			String account = request.getParameter("account");
			String password = request.getParameter("password");
			User user = new User();
			user.setAccount(account);
			user.setPassword(password);
			user = userService.login(user);
			request.getSession().setAttribute("user", user);
			response.sendRedirect("/Tea/index.jsp");
		} catch (Exception e) {
			String msg = e.getMessage();
			request.setAttribute("msg", msg);
			return "/Tea/message.jsp";
		}
		return null;
	}
	
	public String register(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return null;
	}
}
