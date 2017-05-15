package digitalCanteenSSM.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import digitalCanteenSSM.mapper.DishManagementMapper;
import digitalCanteenSSM.po.Dish;
import digitalCanteenSSM.po.DishItems;
import digitalCanteenSSM.service.DishManagementService;

@Service
public class DishManagementServiceImpl implements DishManagementService {

	@Autowired
	private DishManagementMapper dishManagementMapper;
	
	@Override
	public List<DishItems> findAllDishes() throws Exception {

		
		return dishManagementMapper.findAllDishes();
	}
	@Override
	public List<DishItems> findDishInCanteen(Integer cantID) throws Exception{
		
		return dishManagementMapper.findDishInCanteen(cantID);
	}
	@Override
	public List<DishItems> findDishInCampus(Integer campusID) throws Exception{
		
		return dishManagementMapper.findDishInCampus(campusID);
	}
	
	@Override
	public List<DishItems> findApplyDish(String dishInState) throws Exception{
		
		return dishManagementMapper.findApplyDish(dishInState);
	}
	
	@Override
	public void insertDish(Dish dish) throws Exception {
		
		dishManagementMapper.insertDish(dish);
	}

	@Override
	public void deleteDishById(Dish dish) throws Exception {
		
		dishManagementMapper.deleteDishById(dish);
	}

	@Override
	public DishItems findDishByName(DishItems dishItems) throws Exception {
		
		return dishManagementMapper.findDishByName(dishItems);
	}

	@Override
	public DishItems findDishById(Integer dishID) throws Exception {
		
		return dishManagementMapper.findDishById(dishID);
	}
	
	@Override
	public List<DishItems> findDishesInWindow(Integer wndID) throws Exception{
		return dishManagementMapper.findDishesInWindow(wndID);
	}

	@Override
	public void updateDish(DishItems dishItems) throws Exception {

		dishManagementMapper.updateDish(dishItems);
		
	}
	
	@Override
	public List<DishItems> findDishInCanteenAndDate(DishItems dishItems)
			throws Exception {
		
		return dishManagementMapper.findDishInCanteenAndDate(dishItems);
	}

}
