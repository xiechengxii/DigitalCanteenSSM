package digitalCanteenSSM.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import digitalCanteenSSM.po.MUser;
import digitalCanteenSSM.po.MUserItems;
import digitalCanteenSSM.service.MUserService;

@Controller
public class LoginController {

	@Autowired
	private MUserService mUserService;
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(String userName, String password, HttpServletRequest request, HttpSession session){

		UsernamePasswordToken token = new UsernamePasswordToken(userName, password);
		Subject currentUser = SecurityUtils.getSubject();
		
		try{
			currentUser.login(token);
		}catch(UnknownAccountException uae){
			request.setAttribute("message_login", "未知账户");
		}catch(IncorrectCredentialsException ice){
			request.setAttribute("message_login", "密码不正确");
		}catch(LockedAccountException lae){
			request.setAttribute("message_login", "账户已锁定");
		}catch(ExcessiveAttemptsException eae){
			request.setAttribute("message_login", "用户名或密码错误次数过多");
		}catch(AuthenticationException ae){
			request.setAttribute("message_login", "用户名或密码不正确");
		}
		
		//判断登录用户的类型，跳转到不同的页面
		if(currentUser.isAuthenticated()){
			MUserItems mUserItems = new MUserItems();
			try {
				mUserItems = mUserService.findMUserInfoByName(userName);
			} catch (Exception e) {
				e.printStackTrace();
			}

			if("canteen".equals(mUserItems.getRoleName())){

				/*
				*MUserService的mapper中findMUserByName查询限定了
				*用户所属校区和食堂的ID，用于查询食堂和饮食公司
				*这一级别的用户
				*findMUserInfoByName查询没有限定校区和食堂的ID，
				*用于查询后台管理员用户
				*所以这里对于食堂管理员额外使用了一次findMUserByName
				*查询，不然获取不到校区和食堂信息
				*/
				MUser mUser = new MUser();
				mUser.setMuserName(mUserItems.getMuserName());
				try {
					mUserItems = mUserService.findMUserByName(mUser);
				} catch (Exception e) {
					e.printStackTrace();
				}

				session.setAttribute("muserItems", mUserItems);
				return "forward:muserCanteenHostPage.action";
			}else if("super".equals(mUserItems.getRoleName())){
				session.setAttribute("muserItems", mUserItems);
				return "forward:muserBackGround.action";
			}else{
				session.setAttribute("muserItems", mUserItems);
				return "forward:findAllCampuses.action";
			}

		}else{
			token.clear();
			return "login.jsp";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){

		SecurityUtils.getSubject().logout();
		
		return "login.jsp";
	}
}
