package digitalCanteenSSM.mapper;

import java.util.List;

import digitalCanteenSSM.po.DishPreset;

public interface DishPresetMapper {

	public List<DishPreset> findAllDishPreset() throws Exception;
	
	public DishPreset findDishPresetById(DishPreset dishPreset) throws Exception;
	
	public DishPreset findDishPresetByName(String dishPresetName) throws Exception;

	public DishPreset findDishPresetById(Integer dishPresetID) throws Exception;
	
	public void updateDishPresetById(DishPreset dishPreset) throws Exception;
	
	public void deleteDishPresetById(Integer dishPresetID) throws Exception;
	
	public void insertDishPreset(DishPreset dishPreset) throws Exception;
	
	public void updateDishPreset(DishPreset dishPreset) throws Exception;
}
