package Service;

import dao.UserDao;
import entity.User;

public class UserService {
	UserDao userDao = new UserDao();
	public User login(User user)  throws Exception{
		return userDao.login(user);
	}
	public void register(User u) throws Exception{
		userDao.register(u);
		
	}

}
