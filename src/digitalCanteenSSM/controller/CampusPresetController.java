package digitalCanteenSSM.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import digitalCanteenSSM.exception.ExceptionResultInfo;
import digitalCanteenSSM.exception.ResultInfo;
import digitalCanteenSSM.exception.SubmitResultInfo;
import digitalCanteenSSM.po.Campus;
import digitalCanteenSSM.service.CampusPresetService;

@Controller 
public class CampusPresetController {

	@Autowired
	private CampusPresetService campusPresetService;
	
	
	//校区预置页面
	//添加校区按钮与已添加校区显示
	@RequestMapping ("/campusPreset")
	public String campusPreset() throws Exception{
		
		return "forward:findAllCampuses.action";
	}
	
	//查找所有校区
	//返回校区预置页面显示
	@RequestMapping ("/findAllCampuses")
	public ModelAndView findAllCampuses(HttpSession session) throws Exception{		
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("campusList",campusPresetService.findAllCampuses());	
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/campusPreset.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_campusPreset.jsp");
		}
		
		
		return modelAndView;
	}
	
	//通过校区ID查找校区信息
	@RequestMapping ("/findCampusById")
	public Campus findCampusById(int campusID) throws Exception{
		
		return campusPresetService.findCampusById(campusID);
	}
	
	//通过校区Name查找校区信息
	@RequestMapping ("/findCampusByName")	
	public Campus findCampusByName(String campusName) throws Exception{
		
		return campusPresetService.findCampusByName(campusName);
	}
	
	//修改校区：跳转到campusModify.jsp显示具体修改信息
	@RequestMapping ("/modifyCampus")	
	public ModelAndView modifyCampus(int campusID, HttpSession session) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("campus",findCampusById(campusID));	
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/campusModify.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_campusModify.jsp");
		}
		
		
		return modelAndView;
	}
	
	//修改校区：修改之后保存并跳转到校区预置页面
	@RequestMapping ("/modifyCampusSave")	
	public String modifyCampusSave(Campus campus) throws Exception{
		
		if(findCampusByName(campus.getCampusName()) == null){
			campusPresetService.updateCampus(campus);
		}	
		
		return "forward:campusPreset.action";
	}
	
	//更新校区信息
	@RequestMapping ("/updateCampus")
	public String updateCampus(Campus campus) throws Exception{
		
		campusPresetService.updateCampus(campus);
		
		return "forward:campusPreset.action";
	}
	
	//通过校区ID删除校区信息
	@RequestMapping ("/deleteCampusById")
	public String deleteCampusById(int campusID) throws Exception{
		
		campusPresetService.deleteCampusById(campusID);
		
		return "forward:campusPreset.action";
	}
	
	//插入新校区信息
	@RequestMapping ("/insertCampus")
	public String insertCampus(Campus campus) throws Exception{
		
		if(findCampusByName(campus.getCampusName()) == null){
			campusPresetService.insertCampus(campus);
		}	
		
		return "forward:campusPreset.action";	
	}
	
	//插入新校区时的重复检测
	@RequestMapping (value="/insertCampusValidation", method={ RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody SubmitResultInfo insertCampusValidation(Campus campus) throws Exception{
		
		ResultInfo resultInfo = new ResultInfo();
		
		
		if(findCampusByName(campus.getCampusName()) == null){	
			campusPresetService.insertCampus(campus);
			
			resultInfo.setMessage("添加成功");
			resultInfo.setType(ResultInfo.TYPE_RESULT_SUCCESS);
			
		}else{
			resultInfo.setMessage("校区名称重复!请重新输入");
			resultInfo.setType(ResultInfo.TYPE_RESULT_FAIL);
		}
		
		SubmitResultInfo submitResultInfo = new SubmitResultInfo(resultInfo);
		return submitResultInfo;
	}
}