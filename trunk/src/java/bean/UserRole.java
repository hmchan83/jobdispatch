package bean;

/**
 *
 * @author Marcus
 */
public class UserRole {
    private int roleID;
    private String roleName;

    public UserRole() {
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleid) {
        this.roleID = roleid;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String rolename) {
        this.roleName = rolename;
    }
    
    public String toString(){
        return getRoleName();
    }
    
}
