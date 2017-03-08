package digitalCanteenSSM.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import digitalCanteenSSM.mapper.CampusPresetMapper;
import digitalCanteenSSM.po.Campus;
import digitalCanteenSSM.service.CampusPresetService;


@Service
public class CampusPresetServiceImpl implements CampusPresetService{

	@Autowired
	private CampusPresetMapper campusPresetMapper;
	@Override
	public List<Campus> findAllCampuses() throws Exception {
		
		return campusPresetMapper.findAllCampuses();
	}
	
	@Override
	public Campus findCampusById(int campusID) throws Exception{
		
		return campusPresetMapper.findCampusById(campusID);
	}
	
	@Override
	public Campus findCampusByName(String campusName) throws Exception{
		
		return campusPresetMapper.findCampusByName(campusName);
	}
	
	@Override
	public void updateCampus(Campus campus) throws Exception{
		
		campusPresetMapper.updateCampus(campus);
	}
	
	@Override
	public void deleteCampusById(int campusID) throws Exception{
		
		campusPresetMapper.deleteCampusById(campusID);
	}
	
	@Override
	public void insertCampus(Campus campus) throws Exception{
		
		campusPresetMapper.insertCampus(campus);
	}
	
}



