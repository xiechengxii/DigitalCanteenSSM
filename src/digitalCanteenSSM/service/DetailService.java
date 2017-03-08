package digitalCanteenSSM.service;

import java.util.List;

import digitalCanteenSSM.po.Detail;
import digitalCanteenSSM.po.DishItems;

public interface DetailService {
	
	public List<Detail> findDetailDish(Integer recordID) throws Exception;
	
	public void deleteDetailDishByRecordId(Integer recordID) throws Exception;
	
	public void deleteDetailDish(Integer detailID) throws Exception;
	
	public void insertDetailDish(DishItems dishItems) throws Exception;

}
