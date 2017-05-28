package digitalCanteenSSM.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import digitalCanteenSSM.po.MUserItems;
import digitalCanteenSSM.po.Role;
import digitalCanteenSSM.po.User;
import digitalCanteenSSM.po.UserItems;
import digitalCanteenSSM.service.CampusPresetService;
import digitalCanteenSSM.service.CanteenPresetService;
import digitalCanteenSSM.service.RoleService;
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
	@Autowired
	private RoleService roleService;
	
	@RequestMapping("/userRegisterPage")
	public ModelAndView userRegisterPage() throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		//返回当前已有校区和食堂列表,供用户注册时选择
		modelAndView.addObject("campusList", campusPresetService.findAllCampuses());
		modelAndView.addObject("canteenItemsList",canteenPresetService.findAllCanteens());				
		
		//师生用户仅在移动端注册，所以仅返回移动端页面，不做客户端类型判断
		modelAndView.setViewName("/WEB-INF/jsp/m_userRegister.jsp");		
		
		return modelAndView;
	}
	
	@RequestMapping(value="/userRegister")
	public String userRegister(User user, MultipartFile userPhotoFile) throws Exception{
		
		if(userService.findUserByName(user.getUserName()) == null){
			String userphoto = uploadFileService.uploadFile(userPhotoFile, DishManagementController.getPicturepath());
			//未输入图片则使用默认的
			if( userphoto == null){			
				user.setUserPhoto(DishManagementController.getUserDefaultpicturepath());
			}
			else{
				user.setUserPhoto(userphoto);
			}
			
			//需要手动设定师生新用户的角色为user
			//首先获取所有的Role,然后从中找出user角色的RoleID并赋给user相应字段
			//如果最终没找到user角色,则提示用户暂时无法注册
			List<Role> roleList = roleService.findAllRole();
			if(!roleList.isEmpty()){
				for(Iterator<Role> it = roleList.iterator(); it.hasNext();){
					Role role = it.next();
					if(role.getRoleName().equals("user")){
						user.setUserRoleID(role.getRoleID());
						userService.insertUser(user);
						
						return "login.jsp";
					}
				}
			}
			// TODO: 提示用户暂时无法注册
		}
		return "login.jsp";
	}
	
	@RequestMapping(value="/userHomepage")
	public ModelAndView userHomePage(HttpSession session, HttpServletRequest request){
		
		ModelAndView modelAndView = new ModelAndView();
		
		UserItems userItems = (UserItems)session.getAttribute("userItems");
		
		modelAndView.setViewName("/WEB-INF/jsp/userHomePage.jsp");
		return modelAndView;
	}
}
