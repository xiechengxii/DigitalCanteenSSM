package digitalCanteenSSM.mapper;

import java.util.List;

import digitalCanteenSSM.po.DishType;

public interface DishTypePresetMapper {
	
	public List<DishType> findAllDishType() throws Exception;
	
	public DishType findDishTypeById(int dishTypeID) throws Exception;
	
	public DishType findDishTypeByName(String dishTypeName) throws Exception;
	
	public void updateDishType(DishType dishType) throws Exception;
	
	public void deleteDishTypeById(int dishTypeID) throws Exception;
	
	public void insertDishType(DishType dishType) throws Exception;
}
