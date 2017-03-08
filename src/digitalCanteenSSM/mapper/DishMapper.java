package digitalCanteenSSM.mapper;

import java.util.List;

import digitalCanteenSSM.po.Dish;
import digitalCanteenSSM.po.Window;

public interface DishMapper {

	public List<Dish> queryAllDishes() throws Exception;
	
	public Dish findDishById(Dish dish) throws Exception;
	
	public Dish findDishByName(Dish dish) throws Exception;
	
	public List<Dish> queryDishesInWindow(Window window) throws Exception;
	
	public void updateDishById(Dish dish) throws Exception;
	
	public void deleteDishById(Dish dish) throws Exception;
	
	public void insert(Dish dish) throws Exception;
}