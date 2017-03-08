package digitalCanteenSSM.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import digitalCanteenSSM.po.DishItems;
import digitalCanteenSSM.po.MUserItems;
import digitalCanteenSSM.po.Record;
import digitalCanteenSSM.service.DetailService;
import digitalCanteenSSM.service.DishManagementService;
import digitalCanteenSSM.service.RecordService;

@Controller 
public class RecordDishController {

	@Autowired
	private DetailService detailService;
	@Autowired
	private RecordService recordService;
	@Autowired
	private DishManagementService dishManagementService;
	//查看某个食堂某一天记录的详细菜品信息
	@RequestMapping("/findRecordDetailDish")
	public ModelAndView findDetailDish(Record record) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("record",record);
		modelAndView.addObject("dishDetailList",detailService.findDetailDish(record.getRecordID()));
		modelAndView.setViewName("WEB-INF/jsp/detailDish.jsp");
		
		return modelAndView;
	}
	
	//删除记录
	@RequestMapping("/deleteRecord")
	public ModelAndView deleteRecord(Record record)throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		recordService.deleteRecord(record);
		modelAndView.setViewName("muserCanteenHostPage.action");
		
		return modelAndView;
	}
		
	//修改某个食堂某一天录入的详细菜品信息
	@RequestMapping("/modifyRecordDetailDish")
	public ModelAndView modifyDetailDish(Record record,HttpSession session)throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		MUserItems muserItems = (MUserItems)session.getAttribute("muserItems");
		modelAndView.addObject("muserItems",muserItems);
		modelAndView.addObject("record",record);
		modelAndView.addObject("dishDetailList",detailService.findDetailDish(record.getRecordID()));
		modelAndView.addObject("dishItemsList",dishManagementService.findDishInCanteen(muserItems.getCantID()));
		modelAndView.setViewName("WEB-INF/jsp/recordDetailDishModify.jsp");
		
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