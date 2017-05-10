package digitalCanteenSSM.service;

import java.util.List;

import digitalCanteenSSM.po.Detail;
import digitalCanteenSSM.po.DishItems;
import digitalCanteenSSM.po.RecordItems;

public interface DetailService {
	
	public List<Detail> findDetailDish(Integer recordID) throws Exception;
	
	public List<RecordItems> findRecordAndDetailDish(Integer recordID) throws Exception;
	
	public List<Detail> findDetailByDishID(Integer dishID) throws Exception;
	
	public List<Detail> findDetailByRecordID(Integer recordID) throws Exception;
	
	public void deleteDetailDishByRecordId(Integer recordID) throws Exception;
	
	public void deleteDetailDishByDateAndRecordId(Detail detail) throws Exception;
	
	public void deleteDetailDish(Integer detailID) throws Exception;
	
	public void insertDetailDish(DishItems dishItems) throws Exception;
	
	public void insertDetail(Detail detail) throws Exception;
	
	public void updateDetail(Detail detail) throws Exception;
	
	public void takeDetailsOffShelfByDishID(Integer dishID) throws Exception;
	
	public void takeDetailsOnShelfByDishID(Integer dishID) throws Exception;

	public List<Detail> findDetailByDateAndID(Detail detail) throws Exception;
}
