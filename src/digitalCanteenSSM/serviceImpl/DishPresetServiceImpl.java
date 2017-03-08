package digitalCanteenSSM.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import digitalCanteenSSM.mapper.DishPresetMapper;
import digitalCanteenSSM.po.DishPreset;
import digitalCanteenSSM.service.DishPresetService;

@Service
public  class DishPresetServiceImpl implements DishPresetService{

	@Autowired
	private DishPresetMapper dishPresetMapper;
	
	@Override
	public List<DishPreset> findAllDishPreset() throws Exception {
		
		return dishPresetMapper.findAllDishPreset();
	}

	@Override
	public void deleteDishPresetById(Integer dishPresetID) throws Exception {

		dishPresetMapper.deleteDishPresetById(dishPresetID);
	}

	@Override
	public void insertDishPreset(DishPreset dishPreset) throws Exception {
		
		dishPresetMapper.insertDishPreset(dishPreset);
	}

	@Override
	public DishPreset findDishPresetByName(String dishPresetName)
			throws Exception {
		
		return dishPresetMapper.findDishPresetByName(dishPresetName);
	}

	@Override
	public DishPreset findDishPresetById(Integer dishPresetID) throws Exception {
		
		return dishPresetMapper.findDishPresetById(dishPresetID);
	}

	@Override
	public void updateDishPreset(DishPreset dishPreset) throws Exception {
		
		dishPresetMapper.updateDishPreset(dishPreset);
	}

}
