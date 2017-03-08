package digitalCanteenSSM.serviceImpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import digitalCanteenSSM.mapper.MUserMapper;
import digitalCanteenSSM.po.MUser;
import digitalCanteenSSM.po.MUserItems;
import digitalCanteenSSM.service.MUserService;


@Service
public class MUserServiceImpl implements MUserService{

	@Autowired
	private MUserMapper muserMapper;

	@Override
	public List<MUserItems> findAllMUser() throws Exception{
		
		return muserMapper.findAllMUser();
	}
	
	@Override
	public MUserItems findMUserInfoById(Integer muserID) throws Exception {
		
		return muserMapper.findMUserInfoById(muserID);
	}
	
	@Override
	public MUserItems findMUserByName(MUser muser) throws Exception {
		
		return muserMapper.findMUserByName(muser);
	}
	
	@Override 
	public MUserItems findMUserInfoByName(String muserName) throws Exception{
		
		return muserMapper.findMUserInfoByName(muserName);
	}

	@Override
	public void updateMUser(MUser muser) throws Exception {
		
		muserMapper.updateMUser(muser);
	}
	
	@Override
	public void insertMUser(MUser muser) throws Exception {
		
		muserMapper.insertMUser(muser);
	}

	@Override
	public void deleteMUserById(Integer muserID) throws Exception {
		
		muserMapper.deleteMUserById(muserID);
	}

	

	
	
	
}



