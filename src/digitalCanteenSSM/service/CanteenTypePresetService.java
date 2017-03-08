package digitalCanteenSSM.service;

import java.util.List;

import digitalCanteenSSM.po.CanteenType;

public interface CanteenTypePresetService {
	
	public List<CanteenType> findAllCanteenType() throws Exception;
	
	public CanteenType findCanteenTypeById(int cantTypeID) throws Exception;
	
	public CanteenType findCanteenTypeByName(String cantTypeName) throws Exception;
	
	public void updateCanteenType(CanteenType canteenType) throws Exception;
	
	public void deleteCanteenTypeById(int cantType) throws Exception;
	
	public void insertCanteenType(CanteenType canteenType) throws Exception;

}
