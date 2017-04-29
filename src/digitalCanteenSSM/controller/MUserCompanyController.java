package digitalCanteenSSM.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import digitalCanteenSSM.po.Campus;
import digitalCanteenSSM.po.CanteenItems;
import digitalCanteenSSM.po.Record;
import digitalCanteenSSM.service.CampusPresetService;
import digitalCanteenSSM.service.CanteenPresetService;
import digitalCanteenSSM.service.RecordService;

@Controller
public class MUserCompanyController {
	@Autowired
	private CampusPresetService campusPresetService;
	@Autowired
	private CanteenPresetService canteenPresetService;
	@Autowired 
	private RecordService recordService;
	
	@RequestMapping("/companyHomepage")
	public String companyHomepage(HttpSession session) throws Exception{
		
		//本函数尝试向饮食公司主页面返回第一个已经预录了食堂的校区的第一间食堂的ID，
		//这个食堂作为显示录入记录的默认食堂
		//如果后台还未预置任何食堂，则跳转到提示页面
		List<Campus> campusList = campusPresetService.findAllCampuses();
		
		if(!campusList.isEmpty()){
			for(Campus campus:campusList){
				
				List<CanteenItems> canteenItemsList = canteenPresetService.findCanteenByCampus(campus.getCampusID());
				
				if(!canteenItemsList.isEmpty()){
					Iterator<CanteenItems> iterator_canteenItems = canteenItemsList.iterator();
					CanteenItems canteenItems = iterator_canteenItems.next();
					
					return "forward:companyBackground.action?recordCantID="+canteenItems.getCantID();
				}
			}
		}
		return "forward:companyNoCanteenError.action";
	}
	
	@RequestMapping("/companyBackground")
	public ModelAndView companyBackground(HttpSession session, Integer recordCantID) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = simpleDateFormat.format(new Date());
		Date today = simpleDateFormat.parse(dateString);
		
		Record rc = new Record();
		rc.setRecordDate(today);
		
		CanteenItems canteenItems = canteenPresetService.findCanteenById(recordCantID);
		
		modelAndView.addObject("canteenItems", canteenItems);
		modelAndView.addObject("campusList", campusPresetService.findAllCampuses());
		modelAndView.addObject("canteenItemsList", canteenPresetService.findAllCanteens());
		modelAndView.addObject("RecordItemsList", recordService.findRecordByDate(rc));			 	//当天已经录入的记录
		modelAndView.addObject("dishRcordList", recordService.findRecordInCanteen(recordCantID));	//本食堂录入的记录
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/companyBackGround.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_companyBackGround.jsp");
		}
		
		return modelAndView;
	}
	
	@RequestMapping("/companyNoCanteenError")
	public ModelAndView companyNoCanteenError(HttpSession session){
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/companyNoCanteenError.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_companyNoCanteenError.jsp");
		}
		
		return modelAndView;
	}
}
