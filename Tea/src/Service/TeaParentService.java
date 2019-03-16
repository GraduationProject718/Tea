package Service;

import java.util.List;

import dao.TeaParentDao;
import entity.TeaParent;

public class TeaParentService {
	TeaParentDao teaParentDao = new TeaParentDao(); 
	public void add(TeaParent teaParent) throws Exception{
		teaParentDao.add(teaParent);
	}
	public List<TeaParent> getAllTeaParent() throws Exception{
		return teaParentDao.getAllTeaParent();
	}

}
