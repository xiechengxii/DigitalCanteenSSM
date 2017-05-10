package digitalCanteenSSM.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
//	@RequestMapping ("/modifyCampusSave")	
//	public String modifyCampusSave(Campus campus) throws Exception{
//		
//		if(findCampusByName(campus.getCampusName()) == null){
//			campusPresetService.updateCampus(campus);
//		}	
//		
//		return "forward:campusPreset.action";
//	}
	
	//带重复检测的校区修改
	@RequestMapping ("/modifyCampusSaveWithValidation")
	public @ResponseBody SubmitResultInfo modifyCampusSaveWithValidation(Campus campus) throws Exception{
		
		ResultInfo resultInfo = new ResultInfo();
		
		if(findCampusByName(campus.getCampusName()) == null){
			campusPresetService.updateCampus(campus);
			
			resultInfo.setMessage("修改成功");
			resultInfo.setType(ResultInfo.TYPE_RESULT_SUCCESS);
			
		}else{
			/**
			 * 根据校区名查询到记录时有两种情况,一种是用户没有改变校区名,查询到了旧记录,这时无需处理;
			 * 一种是用户填写的校区名与另外一个校区重名了,这样需要报出提醒信息.
			 * 所以此处根据ID反查校区名,得到数据库中此ID的校区名称，与参数传递过来的校区名比较，
			 * 如果二者相等说明用户没有改变校区名。
			 */
			if(campusPresetService.findCampusById(campus.getCampusID()).getCampusName().equals(campus.getCampusName())){
				resultInfo.setMessage("未作修改");
				resultInfo.setType(ResultInfo.TYPE_RESULT_INFO);
			}else{
				resultInfo.setMessage("已有此校区");
				resultInfo.setType(ResultInfo.TYPE_RESULT_FAIL);
			}
		}
		
		SubmitResultInfo submitResultInfo = new SubmitResultInfo(resultInfo);
		return submitResultInfo;
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
//	@RequestMapping ("/insertCampus")
//	public String insertCampus(Campus campus) throws Exception{
//		
//		if(findCampusByName(campus.getCampusName()) == null){
//			campusPresetService.insertCampus(campus);
//		}	
//		
//		return "forward:campusPreset.action";	
//	}
	
	//带重复检测的插入新校区功能
	@RequestMapping (value="/insertCampusWithValidation", method={ RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody SubmitResultInfo insertCampusWithValidation(Campus campus) throws Exception{
		
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