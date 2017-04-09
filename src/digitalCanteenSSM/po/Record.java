package digitalCanteenSSM.po;

import java.util.Date;

public class Record {
	
	private int recordID;
	private int recordCampusID;
	private int recordCantID;
	private int recordMUserID;
	private String recordCampusName;
	private String recordCantName;
	private String recordMUserName;
	private Date recordDate;
	private String recordSubmitState;
	private int replenishFlag;		//用于标记Record属于录入还是补录
	private Date replenishDate;		//补录日期
	private String replenishState;	//审核状态
	
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
	
	public String getRecordSubmitState() {
		return recordSubmitState;
	}
	public void setRecordSubmitState(String recordSubmitState) {
		this.recordSubmitState = recordSubmitState;
	}
	public int getReplenishFlag() {
		return replenishFlag;
	}
	public void setReplenishFlag(int replenishFlag) {
		this.replenishFlag = replenishFlag;
	}
	public Date getReplenishDate() {
		return replenishDate;
	}
	public void setReplenishDate(Date replenishDate) {
		this.replenishDate = replenishDate;
	}
	public String getReplenishState() {
		return replenishState;
	}
	public void setReplenishState(String replenishState) {
		this.replenishState = replenishState;
	}
	public Date getRecordDate() {
		return recordDate;
	}
	public void setRecordDate(Date recordDate) {
		this.recordDate = recordDate;
	}
	
}
