package digitalCanteenSSM.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import digitalCanteenSSM.mapper.CanteenTypePresetMapper;
import digitalCanteenSSM.po.CanteenType;
import digitalCanteenSSM.service.CanteenTypePresetService;


@Service
public class CanteenTypePresetServiceImpl implements CanteenTypePresetService{

	@Autowired
	private CanteenTypePresetMapper canteenTypePresetMapper;
	@Override
	public List<CanteenType> findAllCanteenType() throws Exception {
		
		return canteenTypePresetMapper.findAllCanteenType();
	}
	
	@Override
	public CanteenType findCanteenTypeById(int cantTypeID) throws Exception{
		
		return canteenTypePresetMapper.findCanteenTypeById(cantTypeID);
	}
	
	@Override
	public CanteenType findCanteenTypeByName(String cantTypeName) throws Exception{
		
		return canteenTypePresetMapper.findCanteenTypeByName(cantTypeName);
	}
	
	@Override
	public void updateCanteenType(CanteenType canteenType) throws Exception{
		
		canteenTypePresetMapper.updateCanteenType(canteenType);
	}
	
	@Override
	public void deleteCanteenTypeById(int cantTypeID) throws Exception{
		
		canteenTypePresetMapper.deleteCanteenTypeById(cantTypeID);
	}
	
	@Override
	public void insertCanteenType(CanteenType canteenType) throws Exception{
		
		canteenTypePresetMapper.insertCanteenType(canteenType);
	}
	
}



