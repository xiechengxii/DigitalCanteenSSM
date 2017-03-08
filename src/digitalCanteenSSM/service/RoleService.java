package digitalCanteenSSM.service;

import java.util.List;

import digitalCanteenSSM.po.Role;

public interface RoleService {
	
	public Role findRoleById(Integer roleID) throws Exception;

	public List<Role> findAllRole() throws Exception;
}
