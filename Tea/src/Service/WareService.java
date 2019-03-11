package Service;

import dao.WareDao;
import entity.Ware;

public class WareService {
	WareDao wareDao = new WareDao();
	public void addWare(Ware ware) throws Exception{
		wareDao.addWare(ware);
	}
}
