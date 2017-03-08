package digitalCanteenSSM.po;

public class DishType {
	private int    dishTypeID   = 0;
	private String dishTypeName = "";
	private String dishTypeNote = "";
	
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
	public String getDishTypeNote() {
		return dishTypeNote;
	}
	public void setDishTypeNote(String dishTypeNote) {
		this.dishTypeNote = dishTypeNote;
	}
	
}
