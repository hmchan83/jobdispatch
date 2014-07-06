/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
    
    void LoginStaff(){
    }
    
    boolean Verify(String username, String Pw){
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
                    tmp.setUserName(rs.getString(2));
                    tmp.setRealName(rs.getString(3));
                    tmp.setUserName(username);
                    tmp.setRole(rolecon.getRole(rs.getInt(5)));
                    tmp.setDept(deptcon.getDept(rs.getInt(6)));
                    tmp.seteMail(rs.getString(7));
                    tmp.setTel(rs.getInt(8));
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
