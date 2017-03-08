package digitalCanteenSSM.po;

import java.util.Date;

public class MUser {
	private int muserID;
	private int muserCantID;
	private int muserCampusID;
	private int muserRoleID;
	private String muserName;
	private String muserPwd;
	private String muserTel;
	private String muserPhoto;
	private String muserEmail;
	private String muserState;
	private Date muserRegDate;
	private Date muserLastDate;
	private String muserNote;
	private Date muserSubmitDate;
	
	public int getMuserID() {
		return muserID;
	}
	public void setMuserID(int muserID) {
		this.muserID = muserID;
	}
	public int getMuserCantID() {
		return muserCantID;
	}
	public void setMuserCantID(int muserCantID) {
		this.muserCantID = muserCantID;
	}
	public int getMuserCampusID() {
		return muserCampusID;
	}
	public void setMuserCampusID(int muserCampusID) {
		this.muserCampusID = muserCampusID;
	}
	
	public int getMuserRoleID() {
		return muserRoleID;
	}
	public void setMuserRoleID(int muserRoleID) {
		this.muserRoleID = muserRoleID;
	}
	public String getMuserName() {
		return muserName;
	}
	public void setMuserName(String muserName) {
		this.muserName = muserName;
	}
	public String getMuserPwd() {
		return muserPwd;
	}
	public void setMuserPwd(String muserPwd) {
		this.muserPwd = muserPwd;
	}
	public String getMuserTel() {
		return muserTel;
	}
	public void setMuserTel(String muserTel) {
		this.muserTel = muserTel;
	}
	public String getMuserPhoto() {
		return muserPhoto;
	}
	public void setMuserPhoto(String muserPhoto) {
		this.muserPhoto = muserPhoto;
	}
	public String getMuserEmail() {
		return muserEmail;
	}
	public void setMuserEmail(String muserEmail) {
		this.muserEmail = muserEmail;
	}
	public String getMuserState() {
		return muserState;
	}
	public void setMuserState(String muserState) {
		this.muserState = muserState;
	}

	public String getMuserNote() {
		return muserNote;
	}
	public void setMuserNote(String muserNote) {
		this.muserNote = muserNote;
	}
	public Date getMuserRegDate() {
		return muserRegDate;
	}
	public void setMuserRegDate(Date muserRegDate) {
		this.muserRegDate = muserRegDate;
	}
	public Date getMuserLastDate() {
		return muserLastDate;
	}
	public void setMuserLastDate(Date muserLastDate) {
		this.muserLastDate = muserLastDate;
	}
	public Date getMuserSubmitDate() {
		return muserSubmitDate;
	}
	public void setMuserSubmitDate(Date muserSubmitDate) {
		this.muserSubmitDate = muserSubmitDate;
	}
}
