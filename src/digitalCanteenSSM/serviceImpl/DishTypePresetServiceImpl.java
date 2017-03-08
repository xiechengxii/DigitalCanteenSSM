package digitalCanteenSSM.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import digitalCanteenSSM.mapper.DishTypePresetMapper;
import digitalCanteenSSM.po.DishType;
import digitalCanteenSSM.service.DishTypePresetService;


@Service
public class DishTypePresetServiceImpl implements DishTypePresetService{

	@Autowired
	private DishTypePresetMapper dishTypePresetMapper;
	@Override
	public List<DishType> findAllDishType() throws Exception {
		
		return dishTypePresetMapper.findAllDishType();
	}
	
	@Override
	public DishType findDishTypeById(int dishTypeID) throws Exception{
		
		return dishTypePresetMapper.findDishTypeById(dishTypeID);
	}
	
	@Override
	public DishType findDishTypeByName(String dishTypeName) throws Exception{
		
		return dishTypePresetMapper.findDishTypeByName(dishTypeName);
	}
	
	@Override
	public void updateDishType(DishType dishType) throws Exception{
		
		dishTypePresetMapper.updateDishType(dishType);
	}
	
	@Override
	public void deleteDishTypeById(int dishTypeID) throws Exception{
		
		dishTypePresetMapper.deleteDishTypeById(dishTypeID);
	}
	
	@Override
	public void insertDishType(DishType dishType) throws Exception{
		
		dishTypePresetMapper.insertDishType(dishType);
	}
	
}



