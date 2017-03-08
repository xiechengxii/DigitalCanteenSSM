package digitalCanteenSSM.po;

public class Canteen {
	private int    cantID          = 0;
	private int    cantTypeID      = 0;
	private int    cantCampusID    = 0;
	private String cantName        = "";
	private String cantAddr        = "";
	private String cantDescription = "";	
	private String cantNote        = "";
	
	public int getCantID() {
		return cantID;
	}
	public void setCantID(int cantID) {
		this.cantID = cantID;
	}
	public int getCantTypeID() {
		return cantTypeID;
	}
	public void setCantTypeID(int cantToTypeID) {
		this.cantTypeID = cantToTypeID;
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
	public String getCantAddr() {
		return cantAddr;
	}
	public void setCantAddr(String cantAddr) {
		this.cantAddr = cantAddr;
	}
	public String getCantDescription() {
		return cantDescription;
	}
	public void setCantDescription(String cantDescription) {
		this.cantDescription = cantDescription;
	}
	public String getCantNote() {
		return cantNote;
	}
	public void setCantNote(String cantNote) {
		this.cantNote = cantNote;
	}	

	
}
