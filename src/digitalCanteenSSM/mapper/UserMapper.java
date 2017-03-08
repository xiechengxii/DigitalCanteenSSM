package digitalCanteenSSM.mapper;

import digitalCanteenSSM.po.User;
import digitalCanteenSSM.po.UserItems;

public interface UserMapper {
	
	public UserItems findUserByName(User user) throws Exception;
	
	public UserItems findUserByID(Integer userID) throws Exception;
}
