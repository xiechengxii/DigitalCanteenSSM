package digitalCanteenSSM.serviceImpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import digitalCanteenSSM.mapper.RoleMapper;
import digitalCanteenSSM.po.Role;
import digitalCanteenSSM.service.RoleService;


@Service
public class RoleServiceImpl implements RoleService{

	@Autowired
	private RoleMapper roleMapper;
	@Override
	public Role findRoleById(Integer roleID)throws Exception{
		
		return roleMapper.findRoleById(roleID);
	}
	@Override
	public List<Role> findAllRole() throws Exception {
		
		return roleMapper.findAllRole();
	}
	
	
}



