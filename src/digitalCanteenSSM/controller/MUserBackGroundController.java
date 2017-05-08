package digitalCanteenSSM.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import digitalCanteenSSM.po.Campus;
import digitalCanteenSSM.po.CanteenItems;
import digitalCanteenSSM.po.MUser;
import digitalCanteenSSM.po.MUserItems;
import digitalCanteenSSM.po.Record;
import digitalCanteenSSM.po.RecordItems;
import digitalCanteenSSM.po.Role;
import digitalCanteenSSM.service.CampusPresetService;
import digitalCanteenSSM.service.CanteenPresetService;
import digitalCanteenSSM.service.DetailService;
import digitalCanteenSSM.service.DishExportToExcelService;
import digitalCanteenSSM.service.MUserService;
import digitalCanteenSSM.service.RecordService;
import digitalCanteenSSM.service.RoleService;
import digitalCanteenSSM.service.UploadFileService;

@Controller
public class MUserBackgroundController {
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
		//本函数返回第一个校区的第一间食堂的ID，
		//如果存在没有食堂的校区，则跳转到食堂预置页面
		List<Campus> campusList = campusPresetService.findAllCampuses();
		if(!campusList.isEmpty()){
			Iterator<Campus> iterator_campus = campusList.iterator();
			Campus campus = (Campus) iterator_campus.next();
			
			List<CanteenItems> canteenItemsList = canteenPresetService.findCanteenByCampus(campus.getCampusID());
			if(!canteenItemsList.isEmpty()){
				Iterator<CanteenItems> iterator_canteenItems = canteenItemsList.iterator();
				CanteenItems canteenItems = iterator_canteenItems.next();
				
				return "forward:muserBackground.action?recordCantID="+canteenItems.getCantID();
			}else{
				return "forward:canteenPreset.action";
			}
		}			
		
		return "forward:campusPreset.action";
	}
	
	//后台管理员记录菜品页面显示
	@RequestMapping("/muserBackground")
	public ModelAndView muserBackground(HttpSession session, Integer recordCantID, HttpServletRequest request)throws Exception{
	
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
		Date now = simpleDateFormat.parse(dateString);
		
		Record rc = new Record();
		rc.setRecordDate(now);
		
		CanteenItems canteenItems = canteenPresetService.findCanteenById(recordCantID);
		
		modelAndView.addObject("canteenItems", canteenItems);
		modelAndView.addObject("campusList", campusPresetService.findAllCampuses());
		modelAndView.addObject("canteenItemsList", canteenPresetService.findAllCanteens());	
		modelAndView.addObject("RecordItemsList", recordService.findRecordByDate(rc));
		modelAndView.addObject("pagehelper", pagehelper);
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/muserBackground.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_muserBackground.jsp");
		}
		
		return modelAndView;
	}
	
	//菜品记录页面,显示某个食堂所有的菜品记录（按日期倒序）
	@RequestMapping("/recordDish")
	public ModelAndView recordDish(Integer recordCantID, HttpSession session) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		List<Record> dishRecordList = recordService.findRecordInCanteen(recordCantID);
		modelAndView.addObject("dishRecordList",dishRecordList);
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/dishRecord.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_dishRecord.jsp");
		}
		
		return modelAndView;
	}
	
	//后台管理员用户管理页面
	@RequestMapping("/muserBackgroundUserManagement")
	public ModelAndView muserBackgroundUserManagement(HttpSession session) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/muserBackgroundUserManagement.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_muserBackgroundUserManagement.jsp");
		}
		
		return modelAndView;
	}
	
	//所有管理员用户信息页面
	@RequestMapping("/findAllMUser")
	public ModelAndView muserInAll(HttpSession session) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("muserItemsList",muserService.findAllMUser());
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/muserAllInfo.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_muserAllInfo.jsp");
		}
		
		return modelAndView;
	}
	
	//后台管理员添加用户
	@RequestMapping ("/addMUser")
	public ModelAndView addMUser(HttpSession session) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("campusList", campusPresetService.findAllCampuses());
		modelAndView.addObject("canteenItemsList",canteenPresetService.findAllCanteens());
		modelAndView.addObject("roleList",roleService.findAllRole());
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/muserAdd.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_muserAdd.jsp");
		}		
		
		return modelAndView;
	}
	
	//新增管理用户
	@RequestMapping ("/insertmuser")
	public ModelAndView insertmuser(MUser muser, MultipartFile muserPhotoFile) throws Exception{
		
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
	
	//用户修改自己的账号信息
	@RequestMapping(value="/profileEdit")
	public ModelAndView profileEdit(HttpSession session, Integer muserID) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		
		/*
		*MUserService的mapper中findMUserByName查询限定了
		*用户所属校区和食堂的ID，用于查询食堂和饮食公司
		*这一级别的用户
		*findMUserInfoByName查询没有限定校区和食堂的ID，
		*用于查询后台管理员用户
		*所以这里对于食堂管理员额外使用了一次findMUserByName
		*查询，不然获取不到校区和食堂信息
		*/
		MUserItems muserItems = muserService.findMUserInfoById(muserID);
		MUser mUser = new MUser();
		mUser.setMuserName(muserItems.getMuserName());
		muserItems = muserService.findMUserByName(mUser);
		
		modelAndView.addObject("muserItems", muserItems);
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/muserProfile.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_muserProfile.jsp");
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value="/profileEditSave")
	public String profileEditSave(MUser muser, MultipartFile muserPhotoFile, HttpSession session) throws Exception{
		
		String muserphoto=uploadFileService.uploadFile(muserPhotoFile, DishManagementController.getPicturepath());
		//未改变图片则用原来的
		if( muserphoto == null){
			MUser museritem = muserService.findMUserInfoById(muser.getMuserID());
			muser.setMuserPhoto(museritem.getMuserPhoto());
		}
		else{
			muser.setMuserPhoto(muserphoto);
		}
		
		muserService.updateMUser(muser);
		
		
		if(roleService.findRoleById(muser.getMuserRoleID()).getRoleName().equals("super")){
			return "forward:backgroundHomepage.action";
		}else if(roleService.findRoleById(muser.getMuserRoleID()).getRoleName().equals("canteen")){
			return "forward:muserCanteenHostPage.action";
		}else{
			return "forward:companyHomepage.action";
		}
		
	}
	
	//管理员修改用户信息
	@RequestMapping("/modifyMUser")
	public ModelAndView modifyMUser(Integer muserID, HttpSession session) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("campusList", campusPresetService.findAllCampuses());
		modelAndView.addObject("canteenItemsList",canteenPresetService.findAllCanteens());
		modelAndView.addObject("roleList",roleService.findAllRole());
		modelAndView.addObject("muserItems",muserService.findMUserInfoById(muserID));
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/muserModify.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_muserModify.jsp");
		}
		
		return modelAndView;
	}
	
	//管理员保存修改的用户信息
	@RequestMapping("/modifyMUserSave")
	public ModelAndView modifyMUserSave(MUser muser, MultipartFile muserPhotoFile) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(muserService.findMUserByName(muser) == null || muserService.findMUserByName(muser).getMuserID() == muser.getMuserID()){		
			String muserphoto=uploadFileService.uploadFile(muserPhotoFile, DishManagementController.getPicturepath());
			//未改变图片则用原来的
			if( muserphoto == null){
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
	public ModelAndView recordExportToExcel(HttpSession session) throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("campusList",campusPresetService.findAllCampuses());
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("WEB-INF/jsp/recordExportToExcel.jsp");
		}else{
			modelAndView.setViewName("WEB-INF/jsp/m_recordExportToExcel.jsp");
		}

		return modelAndView;
	}
	
	//查询某个校区的 所有菜品记录
	@RequestMapping("/findRecordInCampus")
	public ModelAndView findRecordInCampus(Integer campusID, HttpSession session) throws Exception{	
		ModelAndView modelAndView = new ModelAndView();
		
		List<Record> recordList = recordService.findRecordInCampus(campusID);
		modelAndView.addObject("campusID",campusID);
		modelAndView.addObject("campusList",campusPresetService.findAllCampuses());
		modelAndView.addObject("recordList",recordList);
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("WEB-INF/jsp/recordExportToExcel.jsp");
		}else{
			modelAndView.setViewName("WEB-INF/jsp/m_recordExportToExcel.jsp");
		}

		return modelAndView;
	}
	
	//导出excel根据查询条件
	@RequestMapping(value="/campusRecordExportToExcel",method=RequestMethod.POST)
	public @ResponseBody ModelAndView campusRecordExportToExcel(HttpSession session, HttpServletResponse response,Integer campusID,Date beginTime,Date endTime) throws Exception{
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
			//TODO: 此处detailService存疑
			recordItemsList.addAll(detailService.findRecordAndDetailDish(record.getRecordID()));
		}
		dishExportToExcelService.writeExcel(recordItemsList,canteenList,response);
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("WEB-INF/jsp/recordExportToExcel.jsp");
		}else{
			modelAndView.setViewName("WEB-INF/jsp/m_recordExportToExcel.jsp");
		}

		return modelAndView;
	}
}
