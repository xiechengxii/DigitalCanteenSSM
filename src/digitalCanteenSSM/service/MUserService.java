package digitalCanteenSSM.service;

import java.util.List;

import digitalCanteenSSM.po.MUser;
import digitalCanteenSSM.po.MUserItems;

public interface MUserService {
	
	public List<MUserItems> findAllMUser() throws Exception;
	
	public MUserItems findMUserInfoById(Integer muserID) throws Exception;
	
	public MUserItems findMUserByName(MUser muser) throws Exception;

	public MUserItems findMUserInfoByName(String muserName) throws Exception;
	
	public void updateMUser(MUser muser) throws Exception;
	
	public void insertMUser(MUser muser) throws Exception;
	
	public void deleteMUserById(Integer muserID) throws Exception;
}
