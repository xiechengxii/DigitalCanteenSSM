package digitalCanteenSSM.service;

import digitalCanteenSSM.po.User;
import digitalCanteenSSM.po.UserItems;

public interface UserService {
	
	public UserItems findUserByName(User user) throws Exception;
	
	public UserItems findUserByID(Integer userID) throws Exception;
}
