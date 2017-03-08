package digitalCanteenSSM.po;

public class CanteenType {
	private int    cantTypeID   = 0;
	private String cantTypeName = "";
	private String cantTypeNote = "";
	
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
	public String getCantTypeNote() {
		return cantTypeNote;
	}
	public void setCantTypeNote(String cantTypeNote) {
		this.cantTypeNote = cantTypeNote;
	}
	

}
