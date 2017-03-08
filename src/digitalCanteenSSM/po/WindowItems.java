package digitalCanteenSSM.po;

public class WindowItems extends Window {
	
	private int    campusID   = 0;
	private String campusName = "";
	
	private int    cantID          = 0;
	private int    cantCampusID    = 0;
	private String cantName        = "";
	
	public int getCampusID() {
		return campusID;
	}
	public void setCampusID(int campusID) {
		this.campusID = campusID;
	}
	public String getCampusName() {
		return campusName;
	}
	public void setCampusName(String campusName) {
		this.campusName = campusName;
	}
	public int getCantID() {
		return cantID;
	}
	public void setCantID(int cantID) {
		this.cantID = cantID;
	}
	public int getCantCampusID() {
		return cantCampusID;
	}
	public void setCantCampusID(int cantCampusID) {
		this.cantCampusID = cantCampusID;
	}
	public String getCantName() {
		return cantName;
	}
	public void setCantName(String cantName) {
		this.cantName = cantName;
	}
	
	
}
