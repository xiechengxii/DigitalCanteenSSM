package digitalCanteenSSM.service;

import java.util.List;

import digitalCanteenSSM.po.Campus;
import digitalCanteenSSM.po.Canteen;
import digitalCanteenSSM.po.CanteenItems;

public interface CanteenPresetService {
	
	public List<CanteenItems> findAllCanteens() throws Exception;
	
	public CanteenItems findCanteenById(int cantID) throws Exception;
	
	public CanteenItems findCanteenByName(CanteenItems canteenItems) throws Exception;
	
	public List<CanteenItems> findCanteenByCampus(Integer cantCampusID) throws Exception;
	
	public List<Canteen> findCanteensInCampus(Campus campus) throws Exception;
	
	public void updateCanteen(Canteen canteen) throws Exception;
	
	public void deleteCanteenById(Canteen canteen) throws Exception;
	
	public void insertCanteen(Canteen canteen) throws Exception;

}
