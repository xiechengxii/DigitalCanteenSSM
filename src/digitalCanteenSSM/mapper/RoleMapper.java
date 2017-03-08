package digitalCanteenSSM.mapper;

import java.util.List;

import digitalCanteenSSM.po.Role;

public interface RoleMapper {
	
	public Role findRoleById(Integer roleID) throws Exception;
	
	public List<Role> findAllRole() throws Exception;

}
