package digitalCanteenSSM.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import digitalCanteenSSM.po.Campus;
import digitalCanteenSSM.po.CanteenItems;
import digitalCanteenSSM.po.MUser;
import digitalCanteenSSM.po.Record;
import digitalCanteenSSM.po.RecordItems;
import digitalCanteenSSM.service.CampusPresetService;
import digitalCanteenSSM.service.CanteenPresetService;
import digitalCanteenSSM.service.DetailService;
import digitalCanteenSSM.service.DishExportToExcelService;
import digitalCanteenSSM.service.MUserService;
import digitalCanteenSSM.service.RecordService;
import digitalCanteenSSM.service.RoleService;
import digitalCanteenSSM.service.UploadFileService;

@Controller
public class MUserBackGroundController {
	@Autowired
	private CampusPresetService campusPresetService;
	@Autowired
	private CanteenPresetService canteenPresetService;
	@Autowired
	private RecordService recordService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private MUserService muserService;
	@Autowired
	private UploadFileService uploadFileService;
	@Autowired
	private DishExportToExcelService dishExportToExcelService;
	@Autowired
	private DetailService detailService;

	
	@RequestMapping("/backgroundHomepage")
	public String backgroundHomepage(HttpSession session) throws Exception{
		List<Campus> campusList = campusPresetService.findAllCampuses();
		if(!campusList.isEmpty()){
			Iterator<Campus> iterator_campus = campusList.iterator();
			Campus campus = (Campus) iterator_campus.next();
			
			List<CanteenItems> canteenItemsList = canteenPresetService.findCanteenByCampus(campus.getCampusID());
			if(!canteenItemsList.isEmpty()){
				Iterator<CanteenItems> iterator_canteenItems = canteenItemsList.iterator();
				CanteenItems canteenItems = iterator_canteenItems.next();
				
				return "forward:muserBackGround.action?recordCantID="+canteenItems.getCantID();
			}else{
				return "forward:canteenPreset.action";
			}
		}			
		
		return "forward:campusPreset.action";
	}
	
	//后台管理员记录菜品页面显示
	@RequestMapping("/muserBackGround")
	public ModelAndView muserBackGround(HttpSession session, Integer recordCantID)throws Exception{
	
		ModelAndView modelAndView = new ModelAndView();
		
		/*
		 * 需要查询数据库中当天的菜品记录，
		 * 获取当前日期并将时分秒设置为0，
		 * （数据库中日期的时分秒为零）
		 * */
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		Date now = cal.getTime();
		
		Record rc = new Record();
		rc.setRecordDate(now);
		
		CanteenItems canteenItems = canteenPresetService.findCanteenById(recordCantID);
		
		modelAndView.addObject("canteenItems", canteenItems);
		modelAndView.addObject("campusList", campusPresetService.findAllCampuses());
		modelAndView.addObject("canteenItemsList", canteenPresetService.findAllCanteens());	
		modelAndView.addObject("RecordItemsList", recordService.findRecordByDate(rc));
		modelAndView.addObject("dishRecordList", recordService.findRecordInCanteen(recordCantID));
		
		modelAndView.setViewName("/WEB-INF/jsp/muserBackGround.jsp");
		
		return modelAndView;
	}
	
	//菜品记录页面,显示某个食堂所有的菜品记录（按日期倒序）
	@RequestMapping("/recordDish")
	public ModelAndView recordDish(Integer recordCantID) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		List<Record> dishRecordList = recordService.findRecordInCanteen(recordCantID);
		modelAndView.addObject("dishRecordList",dishRecordList);
		modelAndView.setViewName("/WEB-INF/jsp/dishRecord.jsp");
		
		return modelAndView;
	}
	
	//后台管理员用户管理页面
	@RequestMapping("/muserBackGroundUserManagement")
	public ModelAndView muserBackGroundUserManagement() throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("/WEB-INF/jsp/muserBackGroundUserManagement.jsp");
		return modelAndView;
	}
	
	//所有管理员用户信息页面
	@RequestMapping("/findAllMUser")
	public ModelAndView muserInAll() throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("muserItemsList",muserService.findAllMUser());
		modelAndView.setViewName("/WEB-INF/jsp/muserAllInfo.jsp");
		return modelAndView;
	}
	
	//后台管理员添加用户
	@RequestMapping ("/addMUser")
	public ModelAndView addMUser() throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("campusList", campusPresetService.findAllCampuses());
		modelAndView.addObject("canteenItemsList",canteenPresetService.findAllCanteens());
		modelAndView.addObject("roleList",roleService.findAllRole());
		modelAndView.setViewName("/WEB-INF/jsp/muserAdd.jsp");
		
		return modelAndView;
	}
	
	//新增管理用户
	@RequestMapping ("/insertmuser")
	public ModelAndView insertmuser(MUser muser,MultipartFile muserPhotoFile) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();

		if(muserService.findMUserInfoByName(muser.getMuserName()) == null){	
			String muserphoto=uploadFileService.uploadFile(muserPhotoFile, DishManagementController.getPicturepath());
			//未输入图片则使用默认的
			if( muserphoto== null){			
				muser.setMuserPhoto(DishManagementController.getUserDefaultpicturepath());
			}
			else{
				muser.setMuserPhoto(muserphoto);
			}
			muserService.insertMUser(muser);
		}		
		modelAndView.setViewName("findAllMUser.action");
		
		return modelAndView;
	}
	//修改用户信息
	@RequestMapping("/modifyMUser")
	public ModelAndView modifyMUser(Integer muserID) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("campusList", campusPresetService.findAllCampuses());
		modelAndView.addObject("canteenItemsList",canteenPresetService.findAllCanteens());
		modelAndView.addObject("roleList",roleService.findAllRole());
		modelAndView.addObject("muserItems",muserService.findMUserInfoById(muserID));
		modelAndView.setViewName("/WEB-INF/jsp/muserModify.jsp");
		return modelAndView;
	}
	
	//修改用户信息
	@RequestMapping("/modifyMUserSave")
	public ModelAndView modifyMUserSave(MUser muser,MultipartFile muserPhotoFile) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(muserService.findMUserByName(muser) == null || muserService.findMUserByName(muser).getMuserID() == muser.getMuserID()){		
			String muserphoto=uploadFileService.uploadFile(muserPhotoFile, DishManagementController.getPicturepath());
			//未改变图片则用原来的
			if( muserphoto== null){			
				MUser museritem = muserService.findMUserInfoById(muser.getMuserID());
				muser.setMuserPhoto(museritem.getMuserPhoto());
			}
			else{
				muser.setMuserPhoto(muserphoto);
			}

			muserService.updateMUser(muser);
		}	
		modelAndView.setViewName("findAllMUser.action");
		
		return modelAndView;
	}
	//删除管理用户
	@RequestMapping ("/deleteMUserById")
	public ModelAndView deleteMUserById(Integer muserID) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();

		muserService.deleteMUserById(muserID);
		modelAndView.setViewName("findAllMUser.action");
		
		return modelAndView;
	}
	
	//导出菜品
	@RequestMapping("/recordExportToExcel")
	public ModelAndView recordExportToExcel() throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("campusList",campusPresetService.findAllCampuses());
		modelAndView.setViewName("WEB-INF/jsp/recordExportToExcel.jsp");

		return modelAndView;
	}
	
	//查询某个校区的 所有菜品记录
	@RequestMapping("/findRecordInCampus")
	public ModelAndView findRecordInCampus(Integer campusID) throws Exception{	
		ModelAndView modelAndView = new ModelAndView();
		
		List<Record> recordList = recordService.findRecordInCampus(campusID);
		modelAndView.addObject("campusID",campusID);
		modelAndView.addObject("campusList",campusPresetService.findAllCampuses());
		modelAndView.addObject("recordList",recordList);
		modelAndView.setViewName("WEB-INF/jsp/recordExportToExcel.jsp");

		return modelAndView;
	}
	
	//导出excel根据查询条件
	@RequestMapping(value="/campusRecordExportToExcel",method=RequestMethod.POST)
	public @ResponseBody ModelAndView campusRecordExportToExcel(HttpServletResponse response,Integer campusID,Date beginTime,Date endTime) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		
		if(beginTime==null && endTime==null){
			SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");  
			String dateString=simpleDateFormat.format(new Date());
			Date date=simpleDateFormat.parse(dateString);	
			beginTime=date;
			endTime=date;
		}
		
		List<RecordItems> recordItemsList = new ArrayList<RecordItems>();
		List<Record> recordList = recordService.findRecordInCampusByDate(campusID,beginTime,endTime);
		List<CanteenItems> canteenList = canteenPresetService.findCanteenByCampus(campusID);
		for(Record record:recordList){
			recordItemsList.addAll(detailService.findRecordAndDetailDish(record.getRecordID()));
		}
		dishExportToExcelService.writeExcel(recordItemsList,canteenList,response);
		modelAndView.setViewName("WEB-INF/jsp/recordExportToExcel.jsp");

		return modelAndView;
	}
	

}
