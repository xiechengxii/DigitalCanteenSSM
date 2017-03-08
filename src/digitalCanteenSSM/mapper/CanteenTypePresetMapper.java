package digitalCanteenSSM.mapper;

import java.util.List;

import digitalCanteenSSM.po.CanteenType;

public interface CanteenTypePresetMapper {
	
	public List<CanteenType> findAllCanteenType() throws Exception;
	
	public CanteenType findCanteenTypeById(int cantType) throws Exception;
	
	public CanteenType findCanteenTypeByName(String cantTypeName) throws Exception;
	
	public void updateCanteenType(CanteenType canteenType) throws Exception;
	
	public void deleteCanteenTypeById(int cantTypeID) throws Exception;
	
	public void insertCanteenType(CanteenType canteenType) throws Exception;
}
