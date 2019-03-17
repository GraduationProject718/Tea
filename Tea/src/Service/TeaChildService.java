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
	public void delTeaChild(String id) throws Exception{
		teaChildDao.delTeaChild(id);
	}
	public TeaChild editTeaChild(String id) throws Exception{
		return teaChildDao.editTeaChild(id);
	}
	public void edit(TeaChild teaChild) throws Exception{
		teaChildDao.edit(teaChild);
	}

}
