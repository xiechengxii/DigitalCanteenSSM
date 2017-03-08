package digitalCanteenSSM.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import digitalCanteenSSM.po.Window;
import digitalCanteenSSM.po.WindowItems;
import digitalCanteenSSM.service.CampusPresetService;
import digitalCanteenSSM.service.CanteenPresetService;
import digitalCanteenSSM.service.WindowPresetService;


@Controller
public class WindowPresetController {
	
	@Autowired
	private CampusPresetService campusPresetService;
	@Autowired
	private CanteenPresetService canteenPresetService;
	@Autowired
	private WindowPresetService windowPresetService;
	
	//档口预置页面
	//添加档口按钮与已添加档口显示
	@RequestMapping ("/windowPreset")
	public String windowPreset() throws Exception{
		
		return "forward:findAllWindows.action";
	}
	
	//查找所有档口
	//返回档口预置页面显示
	@RequestMapping ("/findAllWindows")
	public ModelAndView findAllWindows(Integer cantCampusID) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("campusList",campusPresetService.findAllCampuses());
		modelAndView.addObject("canteenItemsList",canteenPresetService.findAllCanteens());
		modelAndView.addObject("windowItemsList",windowPresetService.findAllWindows());	
		modelAndView.setViewName("/WEB-INF/jsp/windowPreset.jsp");
		
		return modelAndView;
	}
	
	//通过档口ID查找档口信息
	@RequestMapping ("/findWindowById")
	public WindowItems findWindowById(Integer wndID) throws Exception{
		
		return windowPresetService.findWindowById(wndID);
	}
		
	//修改档口：跳转到windowModify.jsp显示具体修改信息
	@RequestMapping ("/modifyWindow")	
	public ModelAndView modifyWindow(Integer wndID,Integer cantCampusID) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("campusList", campusPresetService.findAllCampuses());
		modelAndView.addObject("canteenItemsList",canteenPresetService.findAllCanteens());
		modelAndView.addObject("canteenItemsInCampus",canteenPresetService.findCanteenByCampus(cantCampusID));
		modelAndView.addObject("windowItems",findWindowById(wndID));	
		modelAndView.setViewName("/WEB-INF/jsp/windowModify.jsp");
		
		return modelAndView;
	}
	
	//修改档口：修改之后保存并跳转到档口预置页面
	@RequestMapping ("/modifyWindowSave")	
	public String modifyWindowSave(WindowItems windowItems) throws Exception{
		
		if(findWindowByName(windowItems) == null || findWindowByName(windowItems).getWndID() == windowItems.getWndID()){
			windowPresetService.updateWindow(windowItems);
		}	
		
		return "forward:windowPreset.action";	
	}
		
	//通过档口ID删除档口信息
	@RequestMapping ("/deleteWindowById")
	public String deleteWindowById(Window window) throws Exception{
		
		windowPresetService.deleteWindowById(window);
		
		return "forward:windowPreset.action";
	}
	
	//通过档口Name查找档口信息供插入档口信息时检查
	private WindowItems findWindowByName(WindowItems windowItems) throws Exception {
		
		return windowPresetService.findWindowByName(windowItems);
	}
		
	//插入新档口信息
	@RequestMapping ("/insertWindow")
	public String insertWindow(WindowItems windowItems) throws Exception{
				
		if(findWindowByName(windowItems) == null){
			windowPresetService.insertWindow(windowItems);
		}	
		
		return "forward:windowPreset.action";	
	}
		
}


