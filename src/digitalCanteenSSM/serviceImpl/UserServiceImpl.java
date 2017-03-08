package digitalCanteenSSM.serviceImpl;


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
	public UserItems findUserByName(User user) throws Exception {
		
		return userMapper.findUserByName(user);
	}

	@Override
	public UserItems findUserByID(Integer userID) throws Exception {
		
		return userMapper.findUserByID(userID);
	}


}



