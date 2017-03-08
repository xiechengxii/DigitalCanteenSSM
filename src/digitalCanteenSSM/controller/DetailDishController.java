package digitalCanteenSSM.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import digitalCanteenSSM.po.Record;
import digitalCanteenSSM.service.DetailService;

@Controller 
public class DetailDishController {

	@Autowired
	private DetailService detailService;
	
	//删除某个食堂某一天录入的详细菜品信息
	@RequestMapping("/deleteDetailDish")
	public ModelAndView deleteDetailDish(Record record,Integer detailID) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		detailService.deleteDetailDish(detailID);
		modelAndView.addObject("record",record);
		modelAndView.setViewName("findRecordDetailDish.action");
		
		return modelAndView;
	}
}