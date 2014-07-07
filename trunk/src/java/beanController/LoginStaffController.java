package beanController;

import bean.LoginStaff;
import java.sql.ResultSet;
import java.sql.SQLException;

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
    
    void LoginStaff(){
        
    }
    
    public boolean Verify(String username, String Pw){
        try{
            super.setpStmt("SELECT StaffID, RealName, Username, Pwd, RoleID, DeptID, Email, ContactNumber FROM Staff Where Username = ?");
            super.getpStmt().setString(1, username);
            ResultSet rs= super.execute();
            if(rs.next()){
                if(Pw.equals(rs.getString(4))){
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
    
    public LoginStaff getUser(){
        return currentUser;
    }
    
    public LoginStaff get(){
        return this.getUser();
    }
    
    public void clear(){
        currentUser=null;
    }
}
