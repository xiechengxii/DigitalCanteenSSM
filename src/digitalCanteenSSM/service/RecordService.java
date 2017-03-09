package digitalCanteenSSM.service;

import java.util.List;

import digitalCanteenSSM.po.Record;

public interface RecordService {
	
	public List<Record> findRecordInCanteen(Integer recordCantID) throws Exception;
	
	public Integer findRecordID(Record record) throws Exception;
	
	public List<Record> findRecordByDate(Record reocrd) throws Exception;
	
	public Record findRecordInCanteenAndDate(Record record) throws Exception;
	
	public void deleteRecord(Record record) throws Exception;

	public void insertRecord(Record record) throws Exception;

}
