package digitalCanteenSSM.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import digitalCanteenSSM.po.CanteenItems;
import digitalCanteenSSM.po.MUserItems;
import digitalCanteenSSM.po.Record;
import digitalCanteenSSM.po.RecordItems;
import digitalCanteenSSM.service.CanteenPresetService;
import digitalCanteenSSM.service.DetailService;
import digitalCanteenSSM.service.DishExportToExcelService;
import digitalCanteenSSM.service.RecordService;

@Controller 
public class MUserCanteenController {

	@Autowired
	private RecordService recordService;
	@Autowired
	private DetailService detailService;
	@Autowired
	private CanteenPresetService canteenPresetService;
	@Autowired
	private DishExportToExcelService dishExportToExcelService;
	//食堂管理员首页
	@RequestMapping ("/muserCanteenHostPage")
	public ModelAndView muserCanteenHostPage(HttpSession session, HttpServletRequest request) throws Exception{		
		//本段代码运行时优先从request中读取的页码和单页内容数量，
		//如果请求从其它controller发出，并无这两个对象，
		//则使用的是默认的值
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		int num = 1;
		int size = 10;
		if (pageNum != null && !"".equals(pageNum)) {
			num = Integer.parseInt(pageNum);
		}
		if (pageSize != null && !"".equals(pageSize)) {
			size = Integer.parseInt(pageSize);
		}
		
		//配置pagehelper的排序及分页
		String sortString = "id.desc";
		Order.formString(sortString);
		PageHelper.startPage(num, size);

		ModelAndView modelAndView = new ModelAndView();
		
		MUserItems muserItems = (MUserItems)session.getAttribute("muserItems");
		
		List<Record> dishRecordList = recordService.findRecordInCanteen(muserItems.getCantID());
		PageInfo<Record> pagehelper = new PageInfo<Record>(dishRecordList);

		modelAndView.addObject("muserItems",muserItems);
		modelAndView.addObject("pagehelper", pagehelper);
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("WEB-INF/jsp/muserCanteenHostPage.jsp");
		}else{
			modelAndView.setViewName("WEB-INF/jsp/m_muserCanteenHostPage.jsp");
		}
		
		return modelAndView;
	}
	
	//食堂菜品记录导出
	@SuppressWarnings("deprecation")
	@RequestMapping ("/canteenRecordExportToExcel")
	public void canteenRecordExportToExcel(HttpServletResponse response, Integer cantID, Date beginTime, Date endTime) throws Exception{
		
		//ModelAndView modelAndView = new ModelAndView();
		String timeInFileName = "";
		
		//如果用户没有设定日期，则自动选定本日；
		//如果用户输入的起始日期相同，则设定时间段字符串为当日日期；
		//如果用户输入的起始日期跨度在31天内，则设定时间段字符串为日期范围；
		//如果用户输入的起始日期跨度超过31天，则自动从截止日期往前推31天设定新的范围；
		//最终时间段字符串将传递到导出函数用来生成文件名
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");  
		
		if(beginTime==null && endTime==null){			
			String dateString = simpleDateFormat.format(new Date());
			Date date = simpleDateFormat.parse(dateString);
			beginTime = date;
			endTime = date;
		}else{
			long timeDiff = endTime.getTime()-beginTime.getTime();
			
			if(timeDiff == 0){
				timeInFileName = simpleDateFormat.format(endTime);
			}else{
				if(timeDiff >= (long)30*24*60*60*1000){
					beginTime.setTime(endTime.getTime() - (long)30*24*60*60*1000);
				}
				
				timeInFileName = simpleDateFormat.format(beginTime) + "至" + simpleDateFormat.format(endTime);
			}
		}
		
		List<RecordItems> recordItemsList = new ArrayList<RecordItems>();
		List<Record> recordList  = recordService.findRecordInCanteenByDate(cantID, beginTime, endTime);
		List<CanteenItems> canteenList = new ArrayList<CanteenItems>();
		canteenList.add(canteenPresetService.findCanteenById(cantID));
		
		for(Record record:recordList){
			recordItemsList.addAll(detailService.findRecordAndDetailDish(record.getRecordID()));
		}
		
		dishExportToExcelService.writeExcel(recordItemsList, canteenList, response, timeInFileName);
		
		//modelAndView.setViewName("muserCanteenHostPage.action");

		//return modelAndView;
	}
	
	
}