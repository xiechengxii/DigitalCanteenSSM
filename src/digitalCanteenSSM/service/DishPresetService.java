package digitalCanteenSSM.service;

import java.util.List;

import digitalCanteenSSM.po.DishPreset;

public interface DishPresetService {

	public List<DishPreset> findAllDishPreset() throws Exception;
	
	public DishPreset findDishPresetByName(String dishPresetName) throws Exception;
	
	public DishPreset findDishPresetById(Integer dishPresetID) throws Exception;
	
	public void deleteDishPresetById(Integer dishPresetID) throws Exception;
	
	public void insertDishPreset(DishPreset dishPreset) throws Exception;
	
	public void updateDishPreset(DishPreset dishPreset) throws Exception;


}
