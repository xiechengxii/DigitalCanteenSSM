package digitalCanteenSSM.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import digitalCanteenSSM.mapper.RecordMapper;
import digitalCanteenSSM.po.Record;
import digitalCanteenSSM.service.RecordService;


@Service
public class RecordServiceImpl implements RecordService{

	@Autowired
	private RecordMapper recordMapper;
	@Override
	public List<Record> findRecordInCanteen(Integer recordCantID) throws Exception{
		
		return recordMapper.findRecordInCanteen(recordCantID);
	}
	
	@Override
	public Integer findRecordID(Record record) throws Exception {
		return recordMapper.findRecordID(record);
	}
	
	@Override
	public Record findRecordInCanteenAndDate(Record reocrd) throws Exception{
		
		return recordMapper.findRecordInCanteenAndDate(reocrd);
	}
	
	@Override
	public void deleteRecord(Record record) throws Exception{
		
		recordMapper.deleteRecord(record);
	}
	@Override
	public void insertRecord(Record record) throws Exception{
		
		recordMapper.insertRecord(record);
	}

	@Override
	public List<Record> findRecordByDate(Record record) throws Exception {
		
		return recordMapper.findRecordByDate(record);
	}
	
	
}



