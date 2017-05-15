package digitalCanteenSSM.po;

import java.util.Date;

public class Dish {
	private int     dishID      = 0;
	private int     dishWndID   = 0;
	private int     dishTypeID  = 0;
	private String  dishName    = ""; 
	private String  dishPrice   = "";
	private String  dishPhoto   = "";
	private String  dishDate    = "";
	private String dishRecmd   = "";     
	private String dishKeep    = "";     
	private String  dishSale    = "";        
	private Date  dishInDate  = null;
	private String  dishNote    = "";
	private String dishDelete  = "";
	private String dishSubmitState = "";
	
	public int getDishID() {
		return dishID;
	}
	public void setDishID(int dishID) {
		this.dishID = dishID;
	}
	public int getDishWndID() {
		return dishWndID;
	}
	public void setDishWndID(int dishWndID) {
		this.dishWndID = dishWndID;
	}
	public int getDishTypeID() {
		return dishTypeID;
	}
	public void setDishTypeID(int dishTypeID) {
		this.dishTypeID = dishTypeID;
	}
	public String getDishName() {
		return dishName;
	}
	public void setDishName(String dishName) {
		this.dishName = dishName;
	}
	public String getDishPhoto() {
		return dishPhoto;
	}
	public void setDishPhoto(String dishPhoto) {
		this.dishPhoto = dishPhoto;
	}
	public String getDishPrice() {
		return dishPrice;
	}
	public void setDishPrice(String dishPrice) {
		this.dishPrice = dishPrice;
	}
	public String getDishDate() {
		return dishDate;
	}
	public void setDishDate(String dishDate) {
		this.dishDate = dishDate;
	}
	
	public String getDishRecmd() {
		return dishRecmd;
	}
	public void setDishRecmd(String dishRecmd) {
		this.dishRecmd = dishRecmd;
	}
	public String getDishKeep() {
		return dishKeep;
	}
	public void setDishKeep(String dishKeep) {
		this.dishKeep = dishKeep;
	}
	public String getDishDelete() {
		return dishDelete;
	}
	public void setDishDelete(String dishDelete) {
		this.dishDelete = dishDelete;
	}
	public String getDishSubmitState() {
		return dishSubmitState;
	}
	public void setDishSubmitState(String dishSubmitState) {
		this.dishSubmitState = dishSubmitState;
	}
	
	public String getDishSale() {
		return dishSale;
	}
	public void setDishSale(String dishSale) {
		this.dishSale = dishSale;
	}
	public Date getDishInDate() {
		return dishInDate;
	}
	public void setDishInDate(Date dishInDate) {
		this.dishInDate = dishInDate;
	}
	
	public String getDishNote() {
		return dishNote;
	}
	public void setDishNote(String dishNote) {
		this.dishNote = dishNote;
	}
	
}
