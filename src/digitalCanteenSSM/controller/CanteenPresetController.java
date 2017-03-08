package digitalCanteenSSM.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import digitalCanteenSSM.po.Canteen;
import digitalCanteenSSM.po.CanteenItems;
import digitalCanteenSSM.service.CampusPresetService;
import digitalCanteenSSM.service.CanteenPresetService;
import digitalCanteenSSM.service.CanteenTypePresetService;

@Controller
public class CanteenPresetController {

	@Autowired
	private CampusPresetService campusPresetService;
	@Autowired
	private CanteenPresetService canteenPresetService;
	@Autowired
	private CanteenTypePresetService canteenTypePresetService;
	
	//食堂预置页面
	//添加食堂按钮与已添加食堂显示
	@RequestMapping ("/canteenPreset")
	public String canteenPreset() throws Exception{
		
		return "forward:findAllCanteens.action";
	}
	
	//查找所有食堂
	//返回食堂预置页面显示
	@RequestMapping("/findAllCanteens")
	public ModelAndView findAllCanteens() throws Exception{

		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("campusList", campusPresetService.findAllCampuses());
		modelAndView.addObject("canteenTypeList", canteenTypePresetService.findAllCanteenType());
		modelAndView.addObject("canteenItemsList", canteenPresetService.findAllCanteens());	
		modelAndView.setViewName("/WEB-INF/jsp/canteenPreset.jsp");
		
		return modelAndView;
	}
	
	//通过食堂ID查找食堂信息
	@RequestMapping ("/findCanteenById")
	public CanteenItems findCanteenById(int cantID) throws Exception{
		
		return canteenPresetService.findCanteenById(cantID);
	}
	
	//通过食堂Name查找食堂信息
	private CanteenItems findCanteenByName(CanteenItems canteenItems) throws Exception {
		
		return canteenPresetService.findCanteenByName(canteenItems);
	}
	
	//修改食堂：跳转到canteenModify.jsp显示具体修改信息
	@RequestMapping ("/modifyCanteen")	
	public ModelAndView modifyCanteen(int cantID) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("campusList", campusPresetService.findAllCampuses());
		modelAndView.addObject("canteenItems",findCanteenById(cantID));	
		modelAndView.addObject("canteenTypeList", canteenTypePresetService.findAllCanteenType());
		modelAndView.setViewName("/WEB-INF/jsp/canteenModify.jsp");
		
		return modelAndView;
	}
	
	//修改食堂：修改之后保存并跳转到食堂预置页面
	@RequestMapping ("/modifyCanteenSave")	
	public String modifyCanteenSave(CanteenItems canteenItems) throws Exception{
		
		if(findCanteenByName(canteenItems) == null || findCanteenByName(canteenItems).getCantID() == canteenItems.getCantID()){
			canteenPresetService.updateCanteen(canteenItems);
		}	
		
		return "forward:canteenPreset.action";		
	}
		
	//通过食堂ID删除食堂信息
	@RequestMapping ("/deleteCanteenById")
	public String deleteCanteenById(Canteen canteen) throws Exception{
		
		canteenPresetService.deleteCanteenById(canteen);
		
		return "forward:canteenPreset.action";
	}
		
	//插入新食堂信息
	@RequestMapping ("/insertCanteen")
	public String insertCanteen(CanteenItems canteenItems) throws Exception{
		
		if(findCanteenByName(canteenItems) == null){
			canteenPresetService.insertCanteen(canteenItems);
		}	
		
		return "forward:canteenPreset.action";	
	}

}
