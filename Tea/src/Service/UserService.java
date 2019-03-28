package Service;

import java.util.List;

import dao.UserDao;
import entity.LiuYan;
import entity.PageModel;
import entity.User;

public class UserService {
	UserDao userDao = new UserDao();

	public void register(User u) throws Exception{
		userDao.register(u);
		
	}
	public User login(String account, String password) throws Exception{
		return userDao.login(account,password);
	}
	public User findUserById(String id)throws Exception {
		return userDao.findUserById(id);
	}
	public void ziliao(User user)throws Exception{
		userDao.ziliao(user);
	}
	public void userPassword(String id, String password) throws Exception{
		userDao. userPassword(id, password);
	}
	public void userImg(User user)  throws Exception{
		userDao.userImg(user);
	}
	public PageModel findAllByAdmin(int curNum) throws Exception{
		int totalRecords =userDao.findTotalRecords();
		PageModel pm = new PageModel(curNum,totalRecords,8);
		List<User> list = userDao.findAllByAdmin(pm.getStartIndex(),pm.getPageSize());
		pm.setList(list);
		pm.setUrl("UserServlet?method=findAllByAdmin");
		return pm;
	}
	public void del(String id)  throws Exception{
		userDao.del(id);
	}

}
