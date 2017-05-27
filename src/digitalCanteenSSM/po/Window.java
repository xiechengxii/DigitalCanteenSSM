package digitalCanteenSSM.po;

public class Window {
	private int    wndID          = 0;
	private int    wndCantID      = 0;
	private String wndName        = "";
	private String wndAddr        = "";
	private String wndPriceRange  = "";		
	private String wndSaleHours   = "";		
	private String wndPayment     = "";		
	private String wndDescription = ""; 
	private float wndScore        = 0;
	private String wndNote 		  = "";
	
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
	public String getWndAddr() {
		return wndAddr;
	}
	public void setWndAddr(String wndAddr) {
		this.wndAddr = wndAddr;
	}
	public String getWndPriceRange() {
		return wndPriceRange;
	}
	public void setWndPriceRange(String wndPriceRange) {
		this.wndPriceRange = wndPriceRange;
	}
	public String getWndSaleHours() {
		return wndSaleHours;
	}
	public void setWndSaleHours(String wndSaleHours) {
		this.wndSaleHours = wndSaleHours;
	}
	public String getWndPayment() {
		return wndPayment;
	}
	public void setWndPayment(String wndPayment) {
		this.wndPayment = wndPayment;
	}
	public String getWndDescription() {
		return wndDescription;
	}
	public void setWndDescription(String wndDescription) {
		this.wndDescription = wndDescription;
	}
	public String getWndNote() {
		return wndNote;
	}
	public void setWndNote(String wndNote) {
		this.wndNote = wndNote;
	}
	public float getWndScore() {
		return wndScore;
	}
	public void setWndScore(float wndScore) {
		this.wndScore = wndScore;
	}		
	
}
