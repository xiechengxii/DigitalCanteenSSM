package digitalCanteenSSM.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import digitalCanteenSSM.po.Detail;
import digitalCanteenSSM.po.DishItems;
import digitalCanteenSSM.po.Log;
import digitalCanteenSSM.po.MUserItems;
import digitalCanteenSSM.po.Record;
import digitalCanteenSSM.service.CampusPresetService;
import digitalCanteenSSM.service.CanteenPresetService;
import digitalCanteenSSM.service.DetailService;
import digitalCanteenSSM.service.DishManagementService;
import digitalCanteenSSM.service.LogService;
import digitalCanteenSSM.service.RecordService;

@Controller 
public class RecordDishController {

	@Autowired
	private DetailService detailService;
	@Autowired
	private RecordService recordService;
	@Autowired
	private DishManagementService dishManagementService;
	@Autowired
	private CampusPresetService campusPresetService;
	@Autowired
	private CanteenPresetService canteenPresetService;
	@Autowired
	private LogService logService;
	
	//查看某个食堂某一天记录的详细菜品信息
	@RequestMapping("/findRecordDetailDish")
	public ModelAndView findRecordDetailDish(Record record, HttpSession session) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		MUserItems muserItems = (MUserItems)session.getAttribute("muserItems");	
		
		//页面传递过来的record中只包含recordID字段，
		//此处查询record的完整内容用于传到录入详情页面
		record = recordService.findRecordByRecordID(record.getRecordID());
		
		modelAndView.addObject("muserItems", muserItems);
		modelAndView.addObject("record", record);
		modelAndView.addObject("dishDetailList", detailService.findDetailDish(record.getRecordID()));
		
		if(session.getAttribute("ua").equals("pc")){
			if(muserItems.getMuserRoleID() == 1){
				
				modelAndView.setViewName("WEB-INF/jsp/superDetailDish.jsp");
				
			}else if(muserItems.getMuserRoleID() == 2){
				
				modelAndView.setViewName("WEB-INF/jsp/companyDetailDish.jsp");
				
			}else if(muserItems.getMuserRoleID() == 3){
				
				modelAndView.setViewName("WEB-INF/jsp/detailDish.jsp");
				
			}			
		}else{
			if(muserItems.getMuserRoleID() == 1){
				
				modelAndView.setViewName("WEB-INF/jsp/m_superDetailDish.jsp");
				
			}else if(muserItems.getMuserRoleID() == 2){
				
				modelAndView.setViewName("WEB-INF/jsp/m_companyDetailDish.jsp");
				
			}else if(muserItems.getMuserRoleID() == 3){
				
				modelAndView.setViewName("WEB-INF/jsp/m_detailDish.jsp");
				
			}
		}
		
		return modelAndView;
	}
	
	//删除记录
	@RequestMapping("/deleteRecord")
	public ModelAndView deleteRecord(Record record, HttpSession session)throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		//从数据库中读出record的完整信息
		record = recordService.findRecordByRecordID(record.getRecordID());
		
		MUserItems muserItems = (MUserItems)session.getAttribute("muserItems");
		Log log = new Log();
		
		log.setMuserID(muserItems.getMuserID());
		log.setMuserName(muserItems.getMuserName());
		log.setMuserCampus(campusPresetService.findCampusById(muserItems.getMuserCampusID()).getCampusName());
		log.setMuserCant(canteenPresetService.findCanteenById(muserItems.getMuserCantID()).getCantName());
		log.setLogOperation("删除记录");
		
		//删除记录要同时删除record和与之相关的detail,
		//并且添加log
		List<Detail> detailList = detailService.findDetailByRecordID(record.getRecordID());
		for(Detail detail:detailList){
			log.setLogContent("【"+detail.getDetailDishDate()+"】"+detail.getDetailDishName());
			logService.insertLog(log);
			
			detailService.deleteDetailDish(detail.getDetailID());
		}
			
		recordService.deleteRecord(record);
		log.setLogOperation("删除记录表");
		log.setLogContent(record.getRecordDate()+"的记录表");
		logService.insertLog(log);
		
		modelAndView.setViewName("muserCanteenHostPage.action");
		
		return modelAndView;
	}
		
	//修改某个食堂某一天录入的详细菜品信息
	@RequestMapping("/modifyRecordDetailDish")
	public ModelAndView modifyRecordDetailDish(Integer recordID, HttpSession session)throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		MUserItems muserItems = (MUserItems)session.getAttribute("muserItems");
		modelAndView.addObject("muserItems", muserItems);
		modelAndView.addObject("recordID", recordID);
		modelAndView.addObject("dishDetailList", detailService.findDetailDish(recordID));
		modelAndView.addObject("dishItemsList", dishManagementService.findDishInCanteen(muserItems.getCantID()));
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("WEB-INF/jsp/recordDetailDishModify.jsp");
		}else{
			modelAndView.setViewName("WEB-INF/jsp/m_recordDetailDishModify.jsp");
		}		
		
		return modelAndView;
	}
	
	//修改某个食堂某一天录入的详细菜品信息保存
	@RequestMapping("/modifyRecordDetailDishSave")
	public String modifyRecordDetailDishSave(Integer[] dishIDList,Integer recordID,HttpSession session)throws Exception{
		
		DishItems dishItems = new DishItems();
		detailService.deleteDetailDishByRecordId(recordID);
		
		for(Integer i: dishIDList){		
			dishItems = dishManagementService.findDishById(i);
			dishItems.setDishRecordID(recordID);
			detailService.insertDetailDish(dishItems);	
		}
		return "forward:muserCanteenHostPage.action";
	}
	
	
}