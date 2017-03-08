package digitalCanteenSSM.service;

import java.util.List;


import digitalCanteenSSM.po.Campus;

public interface CampusPresetService {
	
	public List<Campus> findAllCampuses() throws Exception;
	
	public Campus findCampusById(int campusID) throws Exception;
	
	public Campus findCampusByName(String campusName) throws Exception;
	
	public void updateCampus(Campus campus) throws Exception;
	
	public void deleteCampusById(int campusID) throws Exception;
	
	public void insertCampus(Campus campus) throws Exception;

}
