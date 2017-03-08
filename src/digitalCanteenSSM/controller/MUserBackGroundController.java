package digitalCanteenSSM.controller;


import java.util.List;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import digitalCanteenSSM.po.MUser;
import digitalCanteenSSM.po.Record;
import digitalCanteenSSM.service.CampusPresetService;
import digitalCanteenSSM.service.CanteenPresetService;
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
	
	//后台管理员记录菜品页面显示
	@RequestMapping("/muserBackGround")
	public ModelAndView muserBackGround(HttpSession session)throws Exception{
	
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("campusList",campusPresetService.findAllCampuses());
		modelAndView.addObject("canteenItemsList",canteenPresetService.findAllCanteens());		
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
				muser.setMuserPhoto(DishManagementController.getDefaultpicturepath());
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
}
