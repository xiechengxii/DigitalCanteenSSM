package digitalCanteenSSM.po;

import java.util.Date;

public class RecordItems extends Detail{
	
	private int recordID;
	private int recordCampusID;
	private int recordCantID;
	private int recordMUserID;
	private String recordCampusName;
	private String recordCantName;
	private String recordMUserName;
	private Date recordDate;
	private String recordSubmitState;
	
	public int getRecordID() {
		return recordID;
	}
	public void setRecordID(int recordID) {
		this.recordID = recordID;
	}
	public int getRecordCampusID() {
		return recordCampusID;
	}
	public void setRecordCampusID(int recordCampusID) {
		this.recordCampusID = recordCampusID;
	}
	public int getRecordCantID() {
		return recordCantID;
	}
	public void setRecordCantID(int recordCantID) {
		this.recordCantID = recordCantID;
	}
	public String getRecordCampusName() {
		return recordCampusName;
	}
	public void setRecordCampusName(String recordCampusName) {
		this.recordCampusName = recordCampusName;
	}
	public String getRecordCantName() {
		return recordCantName;
	}
	public void setRecordCantName(String recordCantName) {
		this.recordCantName = recordCantName;
	}
	public int getRecordMUserID() {
		return recordMUserID;
	}
	public void setRecordMUserID(int recordMUserID) {
		this.recordMUserID = recordMUserID;
	}
	public String getRecordMUserName() {
		return recordMUserName;
	}
	public void setRecordMUserName(String recordMUserName) {
		this.recordMUserName = recordMUserName;
	}
	
	public Date getRecordDate() {
		return recordDate;
	}
	public void setRecordDate(Date recordDate) {
		this.recordDate = recordDate;
	}
	public String getRecordSubmitState() {
		return recordSubmitState;
	}
	public void setRecordSubmitState(String recordSubmitState) {
		this.recordSubmitState = recordSubmitState;
	}
	
}
