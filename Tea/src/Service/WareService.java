package Service;

import java.util.List;

import dao.WareDao;
import entity.PageModel;
import entity.Videos;
import entity.Ware;

public class WareService {
	WareDao wareDao = new WareDao();
	public void addWare(Ware ware) throws Exception{
		wareDao.addWare(ware);
	}
	public PageModel findAllWareByIndex(int curNum) throws Exception {
		int totalRecords =wareDao.findTotalRecordsByAll();
		PageModel pm = new PageModel(curNum,totalRecords,5);
		List<Ware> list = wareDao.findAllWareByIndex(pm.getStartIndex(),pm.getPageSize());
		pm.setList(list);
		pm.setUrl("WareServlet?method=findAllWareByIndex");
		return pm;
	}
	public PageModel findAllWareByAdmin(int curNum) throws Exception{
		int totalRecords =wareDao.findTotalRecordsByAll();
		PageModel pm = new PageModel(curNum,totalRecords,5);
		List<Ware> list = wareDao.findAllWareByAdmin(pm.getStartIndex(),pm.getPageSize());
		pm.setList(list);
		pm.setUrl("WareServlet?method=findAllWareByAdmin");
		return pm;
	}
	public void del(String id) throws Exception{
		wareDao.del(id);
	}
	public Ware getWareById(String id) throws Exception{
		return wareDao.getWareById(id);
	}
	public void editOK(Ware ware) throws Exception{
		wareDao.editOK(ware);
	}
}
