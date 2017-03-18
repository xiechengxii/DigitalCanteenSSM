package digitalCanteenSSM.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import digitalCanteenSSM.po.DishType;
import digitalCanteenSSM.service.DishTypePresetService;

@Controller 
public class DishTypePresetController {

	@Autowired
	private DishTypePresetService dishTypePresetService;
	
	//菜品类型预置页面
	//添加菜品类型按钮与已添加菜品类型显示
	@RequestMapping ("/dishTypePreset")
	public String dishTypePreset() throws Exception{
		
		return "forward:findAllDishType.action";
	}
	
	//查找所有菜品类型
	//返回菜品类型预置页面显示
	@RequestMapping ("/findAllDishType")
	public ModelAndView findAllDishType(HttpSession session) throws Exception{		
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("dishTypeList",dishTypePresetService.findAllDishType());	
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/dishTypePreset.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_dishTypePreset.jsp");
		}
		
		return modelAndView;
	}
	
	//通过菜品类型ID查找菜品类型信息
	@RequestMapping ("/findDishTypeById")
	public DishType findDishTypeById(int dishTypeID) throws Exception{
		
		return dishTypePresetService.findDishTypeById(dishTypeID);
	}
	
	//通过菜品类型Name查找菜品类型信息
	@RequestMapping ("/findDishTypeByName")	
	public DishType findDishTypeByName(String dishTypeName) throws Exception{
		
		return dishTypePresetService.findDishTypeByName(dishTypeName);
	}
	
	//修改菜品类型：跳转到dishTypeModify.jsp显示具体修改信息
	@RequestMapping ("/modifyDishType")	
	public ModelAndView modifyDishType(int dishTypeID, HttpSession session) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("dishType",findDishTypeById(dishTypeID));	
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/dishTypeModify.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_dishTypeModify.jsp");
		}
		
		return modelAndView;
	}
	
	//修改菜品类型：修改之后保存并跳转到菜品类型预置页面
	@RequestMapping ("/modifyDishTypeSave")	
	public String modifyDishTypeSave(DishType dishType) throws Exception{
		
		if(findDishTypeByName(dishType.getDishTypeName()) == null){
			dishTypePresetService.updateDishType(dishType);
		}	
		return "forward:dishTypePreset.action";
	}
	
	//更新菜品类型信息
	@RequestMapping ("/updateDishType")
	public String updateDishType(DishType dishType) throws Exception{
		
		dishTypePresetService.updateDishType(dishType);
		return "forward:dishTypePreset.action";
	}
	
	//通过菜品类型ID删除菜品类型信息
	@RequestMapping ("/deleteDishTypeById")
	public String deleteDishTypeById(int dishTypeID) throws Exception{
		
		dishTypePresetService.deleteDishTypeById(dishTypeID);
		return "forward:dishTypePreset.action";
	}
	
	//插入新菜品类型信息
	@RequestMapping ("/insertDishType")
	public String insertDishType(DishType dishType) throws Exception{
		
		if(findDishTypeByName(dishType.getDishTypeName()) == null){
			dishTypePresetService.insertDishType(dishType);
		}	
		return "forward:dishTypePreset.action";	
	}
}