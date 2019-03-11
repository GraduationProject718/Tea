package servlet;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.UserService;
import entity.User;
import utils.UUIDUtils;

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
		String account= request.getParameter("account");
		String password= request.getParameter("password");
		String name= request.getParameter("name");
		String info= request.getParameter("info");
		String gender= request.getParameter("gender");
		String birthday= request.getParameter("birthday");
		String address= request.getParameter("address");
		String phone= request.getParameter("phone");
		User u = new User();
		u.setId(UUIDUtils.getId());
		u.setAccount(account);
		u.setPassword(password);
		u.setName(name);
		u.setInfo(info);
		u.setGender(gender);
		u.setBirthday(birthday);
		u.setAddress(address);
		u.setPhone(phone);
		u.setImg("img/moren.jpg");
		u.setDate(new Date());
		userService.register(u);
		response.sendRedirect("login.jsp");
		return null;
	}
}
