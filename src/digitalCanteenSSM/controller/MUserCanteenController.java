package digitalCanteenSSM.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import digitalCanteenSSM.po.MUser;
import digitalCanteenSSM.po.MUserItems;
import digitalCanteenSSM.service.MUserService;
import digitalCanteenSSM.service.RecordService;

@Controller 
public class MUserCanteenController {

	@Autowired
	private RecordService recordService;
	
	//食堂管理员首页
	@RequestMapping ("/muserCanteenHostPage")
	public ModelAndView muserCanteenHostPage(HttpSession session) throws Exception{

		ModelAndView modelAndView = new ModelAndView();
		
		MUserItems muserItems = (MUserItems)session.getAttribute("muserItems");

		modelAndView.addObject("muserItems",muserItems);
		modelAndView.addObject("dishRecordList",recordService.findRecordInCanteen(muserItems.getCantID()));
		modelAndView.setViewName("WEB-INF/jsp/muserCanteenHostPage.jsp");
		
		return modelAndView;
	}
}