package digitalCanteenSSM.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import digitalCanteenSSM.po.User;
import digitalCanteenSSM.service.CampusPresetService;
import digitalCanteenSSM.service.CanteenPresetService;
import digitalCanteenSSM.service.UploadFileService;
import digitalCanteenSSM.service.UserService;
import digitalCanteenSSM.util.CheckMobile;

@Controller
public class UserController {
	@Autowired
	private CampusPresetService campusPresetService;
	@Autowired
	private CanteenPresetService canteenPresetService;
	@Autowired
	private UserService userService;
	@Autowired
	private UploadFileService uploadFileService;
	
	@RequestMapping("/userRegisterPage")
	public ModelAndView userRegisterPage(HttpSession session, HttpServletRequest request) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		//返回当前已有校区和食堂列表,供用户注册时选择
		modelAndView.addObject("campusList", campusPresetService.findAllCampuses());
		modelAndView.addObject("canteenItemsList",canteenPresetService.findAllCanteens());
		
		//判断用户访问的设备类型并写入到session			
		try{
			String userAgent = request.getHeader("USER-AGENT").toLowerCase();
			if(null == userAgent){
				userAgent = "";
			}
			if(CheckMobile.check(userAgent)){
				session.setAttribute("ua", "mobile");
			}else{
				session.setAttribute("ua", "pc");
			}
		}catch(Exception e){
			e.printStackTrace();
		}	
		
		if(session.getAttribute("ua").equals("pc")){
			modelAndView.setViewName("/WEB-INF/jsp/userRegister.jsp");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/m_userRegister.jsp");
		}
		
		return modelAndView;
	}
	
	@RequestMapping("/userRegister")
	public String userRegister(User user, MultipartFile userPhotoFile) throws Exception{
		
		if(userService.findUserByName(user) == null){
			String userphoto=uploadFileService.uploadFile(userPhotoFile, DishManagementController.getPicturepath());
			//未输入图片则使用默认的
			if( userphoto== null){			
				user.setUserPhoto(DishManagementController.getUserDefaultpicturepath());
			}
			else{
				user.setUserPhoto(userphoto);
			}
			
			
		}
		
		return "login.jsp";
	}
}
