package digitalCanteenSSM.po;

import java.util.Date;

public class Log {
	private Date logCreateDate;
	private int muserID; 	
	private String muserName;
	private String muserCampus;
	private String muserCant;    
    private String logContent;
    private String logOperation;
    
    public void setMuser(MUserItems muserItems) throws Exception{
    	muserID     = muserItems.getMuserID();
    	muserName   = muserItems.getMuserName();
    	muserCampus = muserItems.getCampusName();
    	muserCant   = muserItems.getCantName();
    }
    
	public Date getLogCreateDate() {
		return logCreateDate;
	}
	public void setLogCreateDate(Date logCreateDate) {
		this.logCreateDate = logCreateDate;
	}
	public int getMuserID() {
		return muserID;
	}
	public void setMuserID(int muserID) {
		this.muserID = muserID;
	}
	public String getMuserName() {
		return muserName;
	}
	public void setMuserName(String muserName) {
		this.muserName = muserName;
	}
	public String getMuserCampus() {
		return muserCampus;
	}
	public void setMuserCampus(String muserCampus) {
		this.muserCampus = muserCampus;
	}
	public String getMuserCant() {
		return muserCant;
	}
	public void setMuserCant(String muserCant) {
		this.muserCant = muserCant;
	}
	public String getLogContent() {
		return logContent;
	}
	public void setLogContent(String logContent) {
		this.logContent = logContent;
	}
	public String getLogOperation() {
		return logOperation;
	}
	public void setLogOperation(String logOperation) {
		this.logOperation = logOperation;
	}
    
}
