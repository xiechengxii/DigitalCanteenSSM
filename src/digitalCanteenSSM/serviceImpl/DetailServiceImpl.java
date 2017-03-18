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
	public List<RecordItems> findRecordAndDetailDish(Integer recordID)
			throws Exception {
		
		return detailMapper.findRecordAndDetailDish(recordID);
	}
	
	@Override
	public void deleteDetailDishByRecordId(Integer recordID) throws Exception{
		detailMapper.deleteDetailDishByRecordId(recordID);
	}
	@Override
	public void deleteDetailDish(Integer detailID) throws Exception{
		detailMapper.deleteDetailDish(detailID);
	}
	@Override
	public void insertDetailDish(DishItems dishItems) throws Exception{
		detailMapper.insertDetailDish(dishItems);
	}

	

	
	
}



