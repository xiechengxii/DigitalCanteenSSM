package digitalCanteenSSM.po;

public class MUserItems extends MUser{
	
	private int campusID;
	private int cantID;
	private String campusName;
	private String cantName;
	private int roleID;
	private String roleName;
	
	public int getCampusID() {
		return campusID;
	}
	public void setCampusID(int campusID) {
		this.campusID = campusID;
	}
	public int getCantID() {
		return cantID;
	}
	public void setCantID(int cantID) {
		this.cantID = cantID;
	}
	public String getCampusName() {
		return campusName;
	}
	public void setCampusName(String campusName) {
		this.campusName = campusName;
	}
	public String getCantName() {
		return cantName;
	}
	public void setCantName(String cantName) {
		this.cantName = cantName;
	}
	public int getRoleID() {
		return roleID;
	}
	public void setRoleID(int roleID) {
		this.roleID = roleID;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	
	
	
}
