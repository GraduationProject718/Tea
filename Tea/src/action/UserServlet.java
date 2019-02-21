package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.User;
import service.UserService;

/**
 * Servlet implementation class User
 */
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
	}

}
