package digitalCanteenSSM.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import digitalCanteenSSM.po.Campus;
import digitalCanteenSSM.po.CanteenItems;
import digitalCanteenSSM.po.Detail;
import digitalCanteenSSM.po.DishItems;
import digitalCanteenSSM.po.Record;
import digitalCanteenSSM.po.WindowItems;
import digitalCanteenSSM.service.CampusPresetService;
import digitalCanteenSSM.service.CanteenPresetService;
import digitalCanteenSSM.service.DetailService;
import digitalCanteenSSM.service.DishManagementService;
import digitalCanteenSSM.service.RecordService;
import digitalCanteenSSM.service.WindowPresetService;

@Controller
public class MUserCompanyController {
	@Autowired
	private CampusPresetService campusPresetService;
	@Autowired
	private CanteenPresetService canteenPresetService;
	@Autowired 
	private RecordService recordService;
	@Autowired
	private DishManagementService dishManagementService;
	@Autowired
	private WindowPresetService windowPresetService;
	@Autowired
	private DetailService detailService;
	
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
	public ModelAndView companyBackground(HttpSession session, Integer recordCantID, HttpServletRequest request) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
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
		
		List<Record> recordList = recordService.findRecordInCanteen(recordCantID);
		PageInfo<Record> pagehelper = new PageInfo<Record>(recordList);
		
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
		modelAndView.addObject("pagehelper", pagehelper);	//本食堂录入的记录
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/companyBackground.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_companyBackground.jsp");
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
	
	@RequestMapping("/takeOffShelfPage")
	public ModelAndView takeOffShelfPage(HttpSession session, Integer wndID) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		//查询所有校区、食堂和档口传递到菜品下架页面，用户从中选择要下架菜品的档口
		List<Campus> campusList = campusPresetService.findAllCampuses();
		List<CanteenItems> canteenItemsList = canteenPresetService.findAllCanteens();
		List<WindowItems> windowItemsList = windowPresetService.findAllWindows();
		
		List<DishItems> dishItemsList = new ArrayList<DishItems>();
		
		//从饮食公司菜单栏进入本函数时无法提供cantID，
		//选取所有校区中查找到的第一个食堂，查询这个食堂所有已经上架的菜品传递到页面;
		//当通过菜品下架页面选择食堂后进入本函数，则查询cantID代表的食堂的已上架菜品
		if(wndID == null){
			if(!campusList.isEmpty()){
				for(Campus campus:campusList){
					
					List<CanteenItems> canteenItemsInCampus = canteenPresetService.findCanteenByCampus(campus.getCampusID());
					
					for(CanteenItems canteenItems:canteenItemsInCampus){
						
						List<WindowItems> windowItemsInCanteen = windowPresetService.findWindowsInCanteen(canteenItems.getCantID());
						
						if(!windowItemsInCanteen.isEmpty()){
							Iterator<WindowItems> iterator_window = windowItemsInCanteen.iterator();
							WindowItems firstWindowItems = iterator_window.next();
							
							dishItemsList = dishManagementService.findDishesInWindow(firstWindowItems.getWndID());
							wndID = firstWindowItems.getWndID();
						}
					}
				}				
			}else{
				//没有录入预置档口则设置菜品列表为空
				dishItemsList = null;				
			}
		}else{
			//查询菜品列表
			dishItemsList = dishManagementService.findDishesInWindow(wndID);
			
		}
		
		WindowItems windowItems = windowPresetService.findWindowById(wndID);
		
		modelAndView.addObject("campusList", campusList);
		modelAndView.addObject("canteenItemsList", canteenItemsList);
		modelAndView.addObject("windowItemsList", windowItemsList);
		modelAndView.addObject("windowItems", windowItems);			//选中的档口，传到页面用来构建下拉框显示内容
		modelAndView.addObject("dishItemsList", dishItemsList);		//选中档口上架的菜品
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/takeOffShelf.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_takeOffShelf.jsp");
		}
		
		return modelAndView;
	}
	
	@RequestMapping("/takeOffShelf")
	public String takeOffShelf(HttpSession session, Integer dishID) throws Exception{
		
		DishItems dishItems = dishManagementService.findDishById(dishID);
		
		if(dishItems.getDishSale().equals("在售")){
			dishItems.setDishSale("已下架");
			
			detailService.takeDetailsOffShelfByDishID(dishID);
		}
		
		dishManagementService.updateDish(dishItems);
		
		return "forward:takeOffShelfPage.action?wndID="+dishItems.getWndID();		
	}
	
	@RequestMapping("/takeOnShelf")
	public String takeOnShelf(HttpSession session, Integer dishID) throws Exception{
		
		DishItems dishItems = dishManagementService.findDishById(dishID);
		
		if(dishItems.getDishSale().equals("已下架")){
			dishItems.setDishSale("在售");
			
			detailService.takeDetailsOnShelfByDishID(dishID);
		}
		
		dishManagementService.updateDish(dishItems);
		
		return "forward:takeOffShelfPage.action?wndID="+dishItems.getWndID();		
	}
}
