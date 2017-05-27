package digitalCanteenSSM.po;

import java.util.Date;

public class Comment {

	private int cmtID;
	private int cmtWndID;
	private String cmtContent;
	private Date cmtDate;
	private int cmtGoodNum;
	private int cmtUserID;
	private int cmtAmtUserID;
	private int cmtScore;
	private String cmtNote;
	
	public int getCmtID() {
		return cmtID;
	}
	public void setCmtID(int cmtID) {
		this.cmtID = cmtID;
	}
	public int getCmtWndID() {
		return cmtWndID;
	}
	public void setCmtWndID(int cmtWndID) {
		this.cmtWndID = cmtWndID;
	}
	public String getCmtContent() {
		return cmtContent;
	}
	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}
	public Date getCmtDate() {
		return cmtDate;
	}
	public void setCmtDate(Date cmtDate) {
		this.cmtDate = cmtDate;
	}
	public int getCmtGoodNum() {
		return cmtGoodNum;
	}
	public void setCmtGoodNum(int cmtGoodNum) {
		this.cmtGoodNum = cmtGoodNum;
	}
	public int getCmtUserID() {
		return cmtUserID;
	}
	public void setCmtUserID(int cmtUserID) {
		this.cmtUserID = cmtUserID;
	}
	public int getCmtAmtUserID() {
		return cmtAmtUserID;
	}
	public void setCmtAmtUserID(int cmtAmtUserID) {
		this.cmtAmtUserID = cmtAmtUserID;
	}
	public int getCmtScore() {
		return cmtScore;
	}
	public void setCmtScore(int cmtScore) {
		this.cmtScore = cmtScore;
	}
	public String getCmtNote() {
		return cmtNote;
	}
	public void setCmtNote(String cmtNote) {
		this.cmtNote = cmtNote;
	}
}
