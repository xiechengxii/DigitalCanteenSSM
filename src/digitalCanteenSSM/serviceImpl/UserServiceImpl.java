package digitalCanteenSSM.serviceImpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import digitalCanteenSSM.mapper.UserMapper;
import digitalCanteenSSM.po.User;
import digitalCanteenSSM.po.UserItems;
import digitalCanteenSSM.service.UserService;


@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;

	@Override
	public UserItems findUserByName(String userName) throws Exception {
		
		return userMapper.findUserByName(userName);
	}

	@Override
	public UserItems findUserByID(Integer userID) throws Exception {
		
		return userMapper.findUserByID(userID);
	}

	@Override
	public List<UserItems> findAllUser() throws Exception {
		return userMapper.findAllUser();
	}
	
	@Override
	public void insertUser(User user) throws Exception {
		userMapper.insertUser(user);
	}
	
	@Override 
	public void updateUser(User user) throws Exception {
		userMapper.updateUser(user);
	}
	
	@Override
	public void deleteUserByID(Integer userID) throws Exception{
		userMapper.deleteUserByID(userID);
	}
}



