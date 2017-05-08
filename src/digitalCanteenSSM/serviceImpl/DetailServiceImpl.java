package digitalCanteenSSM.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import digitalCanteenSSM.mapper.DetailMapper;
import digitalCanteenSSM.po.Detail;
import digitalCanteenSSM.po.DishItems;
import digitalCanteenSSM.po.RecordItems;
import digitalCanteenSSM.service.DetailService;


@Service
public class DetailServiceImpl implements DetailService{

	@Autowired
	private DetailMapper detailMapper;
	@Override
	public List<Detail> findDetailDish(Integer recordID) throws Exception{
		
		return detailMapper.findDetailDish(recordID);
	}
	
	@Override
	public List<Detail> findDetailByDishID(Integer dishID) throws Exception{
		return detailMapper.findDetailByDishID(dishID);
	}
	
	@Override
	public List<RecordItems> findRecordAndDetailDish(Integer recordID)
			throws Exception {
		
		return detailMapper.findRecordAndDetailDish(recordID);
	}
	
	@Override
	public void deleteDetailDishByRecordId(Integer recordID) throws Exception{
		detailMapper.deleteDetailDishByRecordId(recordID);
	}
	
	@Override
	public void deleteDetailDishByDateAndRecordId(Detail detail) throws Exception{
		detailMapper.deleteDetailDishByDateAndRecordId(detail);
	}
	
	@Override
	public void deleteDetailDish(Integer detailID) throws Exception{
		detailMapper.deleteDetailDish(detailID);
	}
	
	@Override
	public void insertDetailDish(DishItems dishItems) throws Exception{
		detailMapper.insertDetailDish(dishItems);
	}
	
	@Override
	public void insertDetail(Detail detail) throws Exception{
		detailMapper.insertDetail(detail);
	}
	
	@Override
	public void updateDetail(Detail detail) throws Exception{
		detailMapper.updateDetail(detail);
	}
	
	@Override
	public void takeDetailsOffShelfByDishID(Integer dishID) throws Exception{
		detailMapper.takeDetailsOffShelfByDishID(dishID);
	}
	
	@Override
	public void takeDetailsOnShelfByDishID(Integer dishID) throws Exception{
		detailMapper.takeDetailsOnShelfByDishID(dishID);
	}

	@Override
	public List<Detail> findDetailByDateAndID(Detail detail) throws Exception {
		
		return detailMapper.findDetailByDateAndID(detail);
	}	
}



