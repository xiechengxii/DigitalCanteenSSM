package digitalCanteenSSM.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import digitalCanteenSSM.mapper.CanteenPresetMapper;
import digitalCanteenSSM.po.Campus;
import digitalCanteenSSM.po.Canteen;
import digitalCanteenSSM.po.CanteenItems;
import digitalCanteenSSM.service.CanteenPresetService;

@Service
public class CanteenPresetServiceImpl implements CanteenPresetService{

	@Autowired
	private CanteenPresetMapper canteenPresetMapper;
	
	@Override
	public List<CanteenItems> findAllCanteens() throws Exception {
		
		return canteenPresetMapper.findAllCanteens();
	}

	@Override
	public CanteenItems findCanteenById(int cantID) throws Exception {
		
		return canteenPresetMapper.findCanteenById(cantID);
	}

	@Override
	public CanteenItems findCanteenByName(CanteenItems canteenItems) throws Exception {
		
		return canteenPresetMapper.findCanteenByName(canteenItems);
	}
	
	@Override
	public List<CanteenItems> findCanteenByCampus(Integer cantCampusID) throws Exception {
		
		return canteenPresetMapper.findCanteenByCampus(cantCampusID);
	}
	@Override
	public List<Canteen> findCanteensInCampus(Campus campus) throws Exception {
		
		return canteenPresetMapper.findCanteensInCampus(campus);
	}

	@Override
	public void updateCanteen(Canteen canteen) throws Exception {
		
		canteenPresetMapper.updateCanteen(canteen);
	}

	@Override
	public void deleteCanteenById(Canteen canteen) throws Exception {

		canteenPresetMapper.deleteCanteenById(canteen);
	}

	@Override
	public void insertCanteen(Canteen canteen) throws Exception {

		canteenPresetMapper.insertCanteen(canteen);
	}

}
