package digitalCanteenSSM.service;

import java.util.List;

import digitalCanteenSSM.po.User;
import digitalCanteenSSM.po.UserItems;

public interface UserService {
	
	public UserItems findUserByName(String userName) throws Exception;
	
	public UserItems findUserByID(Integer userID) throws Exception;
	
	public List<UserItems> findAllUser() throws Exception;
	
	public void insertUser(User user) throws Exception;
	
	public void updateUser(User user) throws Exception;
	
	public void deleteUserByID(Integer userID) throws Exception;
}
