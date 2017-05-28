package digitalCanteenSSM.shiro.realm;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import digitalCanteenSSM.po.MUser;
import digitalCanteenSSM.po.MUserItems;
import digitalCanteenSSM.po.UserItems;
import digitalCanteenSSM.service.MUserService;
import digitalCanteenSSM.service.UserService;

public class MyRealm extends AuthorizingRealm {

	@Autowired
	private MUserService mUserService;
	@Autowired
	private UserService userService;

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

		String currentUserName = (String)super.getAvailablePrincipal(principals);

		MUserItems mUserItems= new MUserItems();		
		try {
			mUserItems= mUserService.findMUserInfoByName(currentUserName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(mUserItems!= null){
			SimpleAuthorizationInfo simpleAuthorInfo = new SimpleAuthorizationInfo();

			simpleAuthorInfo.addRole(mUserItems.getRoleName());
			//对于食堂一级的账号设置权限
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

				simpleAuthorInfo.addStringPermission("canteen:"+mUserItems.getCampusName()+mUserItems.getCantName());
			}

			return simpleAuthorInfo;
		}
		
		return null;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authcToken) throws AuthenticationException {

		UsernamePasswordToken token = (UsernamePasswordToken)authcToken;

		MUserItems muser = new MUserItems();
		UserItems user = new UserItems();
		try{
			muser = mUserService.findMUserInfoByName(token.getUsername());
			if(muser != null){
				AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(muser.getMuserName(), muser.getMuserPwd(), this.getName());
				this.setAuthenticationSession(muser.getMuserName());

				return authcInfo;
			}else{
				user = userService.findUserByName(token.getUsername());
				if(user != null){
					AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(user.getUserName(), user.getUserPwd(), this.getName());
					this.setAuthenticationSession(user.getUserName());

					return authcInfo;
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}

		

		return null;
	}
	
	private void setAuthenticationSession(Object value){
		Subject currentUser = SecurityUtils.getSubject();
		if(null != currentUser){
			Session session = currentUser.getSession();
			
			//设置超时时间，单位毫秒
			session.setTimeout(-1000*60*60);
			session.setAttribute("currentUser", value);
		}
	}

}
