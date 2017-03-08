package digitalCanteenSSM.mapper;

import java.util.List;

import digitalCanteenSSM.po.Record;

public interface RecordMapper {
	
	public List<Record> findRecordInCanteen(Integer recordCantID) throws Exception;
	
	public Integer findRecordID(Record record) throws Exception;
	
	public Record findRecordByDate(Record record) throws Exception;
	
	public Record findRecordInCanteenAndDate(Record reocrd) throws Exception;
	
	public void deleteRecord(Record record) throws Exception;

	public void insertRecord(Record record) throws Exception;
}
