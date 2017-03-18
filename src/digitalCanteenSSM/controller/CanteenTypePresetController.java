package digitalCanteenSSM.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import digitalCanteenSSM.po.CanteenType;
import digitalCanteenSSM.service.CanteenTypePresetService;

@Controller 
public class CanteenTypePresetController {

	@Autowired
	private CanteenTypePresetService canteenTypePresetService;
	
	//食堂类型预置页面
	//添加食堂类型按钮与已添加食堂类型显示
	@RequestMapping ("/canteenTypePreset")
	public String canteenTypePreset() throws Exception{
		
		return "forward:findAllCanteenType.action";
	}
	
	//查找所有食堂类型
	//返回食堂类型预置页面显示
	@RequestMapping ("/findAllCanteenType")
	public ModelAndView findAllCanteenType(HttpSession session) throws Exception{		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("canteenTypeList",canteenTypePresetService.findAllCanteenType());
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("WEB-INF/jsp/canteenTypePreset.jsp");
		}else{
			modelAndView.setViewName("WEB-INF/jsp/m_canteenTypePreset.jsp");
		}		
		
		return modelAndView;
	}
	
	//通过食堂类型ID查找食堂类型信息
	@RequestMapping ("/findCanteenTypeById")
	public CanteenType findCanteenTypeById(int cantTypeID) throws Exception{
		
		return canteenTypePresetService.findCanteenTypeById(cantTypeID);
	}
	
	//通过食堂类型Name查找食堂类型信息
	@RequestMapping ("/findCanteenTypeByName")	
	public CanteenType findCanteenTypeByName(String cantTypeName) throws Exception{
		
		return canteenTypePresetService.findCanteenTypeByName(cantTypeName);
	}
	
	//修改食堂类型：跳转到cantTypeModify.jsp显示具体修改信息
	@RequestMapping ("/modifyCanteenType")	
	public ModelAndView modifyCanteenType(int cantTypeID, HttpSession session) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("canteenType",findCanteenTypeById(cantTypeID));	
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/canteenTypeModify.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_canteenTypeModify.jsp");
		}		
		
		return modelAndView;
	}
	
	//修改食堂类型：修改之后保存并跳转到食堂类型预置页面
	@RequestMapping ("/modifyCanteenTypeSave")	
	public String modifyCanteenTypeSave(CanteenType canteenType) throws Exception{
		
		if(findCanteenTypeByName(canteenType.getCantTypeName()) == null){
			canteenTypePresetService.updateCanteenType(canteenType);
		}	
		
		return "forward:canteenTypePreset.action";
	}
	
	//更新食堂类型信息
	@RequestMapping ("/updateCanteenType")
	public String updateCanteenType(CanteenType canteenType) throws Exception{
		
		canteenTypePresetService.updateCanteenType(canteenType);
		
		return "forward:canteenTypePreset.action";
	}
	
	//通过食堂类型ID删除食堂类型信息
	@RequestMapping ("/deleteCanteenTypeById")
	public String deleteCanteenTypeById(int cantTypeID) throws Exception{
		
		canteenTypePresetService.deleteCanteenTypeById(cantTypeID);
		
		return "forward:canteenTypePreset.action";
	}
	
	//插入新食堂类型信息
	@RequestMapping ("/insertCanteenType")
	public String insertCanteenType(CanteenType canteenType) throws Exception{
		
		if(findCanteenTypeByName(canteenType.getCantTypeName()) == null){
			canteenTypePresetService.insertCanteenType(canteenType);
		}	
		
		return "forward:canteenTypePreset.action";	
	}
}