package digitalCanteenSSM.po;

public class DishItems extends Dish{
	private int    campusID   = 0;
	private String campusName = "";
	
	private int    cantID          = 0;
	private int    cantTypeID      = 0;
	private int    cantCampusID    = 0;
	private String cantName        = "";
	
	private int    wndID          = 0;
	private int    wndCantID      = 0;
	private String wndName        = "";
	
	private int    dishPresetID   = 0;
	private String dishPresetName = "";
	
	private int    dishTypeID   = 0;
	private String dishTypeName = "";
	
	private int dishRecordID = 0;
	private int dishDateFlag;
	
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
	public int getCantTypeID() {
		return cantTypeID;
	}
	public void setCantTypeID(int cantTypeID) {
		this.cantTypeID = cantTypeID;
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
	public int getWndID() {
		return wndID;
	}
	public void setWndID(int wndID) {
		this.wndID = wndID;
	}
	public int getWndCantID() {
		return wndCantID;
	}
	public void setWndCantID(int wndCantID) {
		this.wndCantID = wndCantID;
	}
	public String getWndName() {
		return wndName;
	}
	public void setWndName(String wndName) {
		this.wndName = wndName;
	}
	public int getDishPresetID() {
		return dishPresetID;
	}
	public void setDishPresetID(int dishPresetID) {
		this.dishPresetID = dishPresetID;
	}
	public String getDishPresetName() {
		return dishPresetName;
	}
	public void setDishPresetName(String dishPresetName) {
		this.dishPresetName = dishPresetName;
	}
	public int getDishTypeID() {
		return dishTypeID;
	}
	public void setDishTypeID(int dishTypeID) {
		this.dishTypeID = dishTypeID;
	}
	public String getDishTypeName() {
		return dishTypeName;
	}
	public void setDishTypeName(String dishTypeName) {
		this.dishTypeName = dishTypeName;
	}
	public int getDishRecordID() {
		return dishRecordID;
	}
	public void setDishRecordID(int dishRecordID) {
		this.dishRecordID = dishRecordID;
	}
	public int getDishDateFlag() {
		return dishDateFlag;
	}
	public void setDishDateFlag(int dishDateFlag) {
		this.dishDateFlag = dishDateFlag;
	}
	
}
