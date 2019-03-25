package Service;

import dao.UserDao;
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

}
