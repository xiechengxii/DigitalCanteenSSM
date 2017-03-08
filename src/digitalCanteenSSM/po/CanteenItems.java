package digitalCanteenSSM.po;

public class CanteenItems extends Canteen {
	
	private int    campusID   = 0;
	private String campusName = "";
	private String campusNote = "";
	
	private int    cantTypeID   = 0;
	private String cantTypeName = "";
	
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
	public String getCampusNote() {
		return campusNote;
	}
	public void setCampusNote(String campusNote) {
		this.campusNote = campusNote;
	}
	public int getCantTypeID() {
		return cantTypeID;
	}
	public void setCantTypeID(int cantTypeID) {
		this.cantTypeID = cantTypeID;
	}
	public String getCantTypeName() {
		return cantTypeName;
	}
	public void setCantTypeName(String cantTypeName) {
		this.cantTypeName = cantTypeName;
	}
	
}
