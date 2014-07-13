package beanController;

import bean.LoginStaff;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import org.apache.catalina.util.ParameterMap;

/**
 *
 * @author Marcus
 */
public class LoginStaffController extends BeanController{
    
    private LoginStaff currentUser;
    
    public LoginStaffController(){
        super();
        currentUser = null;
    }
    
    public LoginStaffController(LoginStaff user){
        super();
        currentUser = user;
    }
    
    void LoginStaff(){
        
    }
    
    public boolean Verify(String username, String pw){
        try{
            super.setpStmt("SELECT StaffID, RealName, Username, Pwd, RoleID, DeptID, Email, ContactNumber FROM Staff Where Username = ?");
            super.getpStmt().setString(1, username);
            ResultSet rs= super.execute();
            if(rs.next()){
                if(pw.equals(rs.getString(4))){
                    UserRoleController rolecon = new UserRoleController();
                    DepartmentController deptcon = new DepartmentController();
                    LoginStaff tmp = new LoginStaff();
                    tmp.setStaffID(rs.getInt(1));
                    tmp.setUserName(rs.getString(3));
                    tmp.setRealName(rs.getString(2));
                    tmp.setRole(rolecon.getRole(rs.getInt(5)));
                    tmp.setDept(deptcon.getDept(rs.getInt(6)));
                    tmp.seteMail(rs.getString(7));
                    tmp.setTel(rs.getInt(8));
                    tmp.setPassword(rs.getString(4));
                    this.currentUser = tmp;
                    return true;                    
                }
                return false;                
            }           
        }catch (SQLException ex){
            return false;
        }
        return false;
    }
    
    public boolean VerifyAdmin(String username, String pw){
        if(Verify(username, pw) && this.currentUser != null){
            return currentUser.getRole().getRoleName().toLowerCase().equals("admin");
        }
        return false;
    }
    
    public LoginStaff getUser(){
        return currentUser;
    }
    
    public LoginStaff get(){
        return this.getUser();
    }
    
    public void clear(){
        currentUser=null;
    }

    public boolean update(ParameterMap pMap) {
        if(pMap.containsKey("password"))   currentUser.setPassword((String)pMap.get("password"));
        if(pMap.containsKey("email"))   currentUser.seteMail((String)pMap.get("email"));
        if(pMap.containsKey("telno"))   currentUser.setTel(Integer.parseInt((String)pMap.get("telno")));
        super.setpStmt("UPDATE Staff SET Pwd = ?, Email = ?, ContactNumber = ? where StaffID = ?");
        try{
            super.getpStmt().setString(1, currentUser.getPassword());
            super.getpStmt().setString(2, currentUser.geteMail());
            super.getpStmt().setInt(3, currentUser.getTel());
            super.getpStmt().setInt(4, currentUser.getStaffID());
            super.executeUpdate();
        }catch(SQLException ex){
            return false;
        }
        return true;
    }
}
