package Service;

import java.util.List;

import dao.TeaChildDao;
import entity.TeaChild;

public class TeaChildService {
	TeaChildDao teaChildDao = new TeaChildDao();
	public void add(TeaChild teaChild) throws Exception{
		teaChildDao.add(teaChild);
	}
	public List<TeaChild> getAllTeaChild() throws Exception{
		return teaChildDao.getAllTeaChild();
	}

}
