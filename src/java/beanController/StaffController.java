/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package beanController;

import bean.Department;
import bean.Staff;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Marcus
 */
public class StaffController extends BeanController {
    
    private Staff s;
    
    public StaffController() {
        super();
        this.s=null;
    }
    
    public StaffController(Staff s){
        super();
        this.s=s;
    }
    
    public Staff getStaff(int id){
        s = new Staff();
        super.setpStmt("SELECT top 1 * FROM Staff where StaffId = ?");
        try {
            super.getpStmt().setInt(1, id);
            ResultSet rs = super.execute();
            if(rs.next()){
                s.setStaffID(rs.getInt("StaffID"));
                s.setRealName(rs.getString("RealName"));
                s.setUserName(rs.getString("Username"));
                s.setRoleID(rs.getInt("RoleID"));
                s.seteMail(rs.getString("Email"));
                s.setTel(rs.getInt("ContactNumber"));
            }
            return s;
        } catch (SQLException ex) {
            return null;
        }
    }
    
    public Staff getStaff(String username){
        s = new Staff();
        super.setpStmt("SELECT top 1 * FROM Staff where Username = ?");
        try {
            super.getpStmt().setString(1, username);
            ResultSet rs = super.execute();
            if(rs.next()){
                s.setStaffID(rs.getInt("StaffID"));
                s.setRealName(rs.getString("RealName"));
                s.setUserName(rs.getString("Username"));
                s.setRoleID(rs.getInt("RoleID"));
                s.seteMail(rs.getString("Email"));
                s.setTel(rs.getInt("ContactNumber"));
            }
            return s;
        } catch (SQLException ex) {
            return null;
        }
    }
}
