/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beanController;

import bean.Department;
import bean.LoginStaff;
import bean.Staff;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;
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
        this.s = null;
    }

    public StaffController(Staff s) {
        super();
        this.s = s;
    }

    public Staff getStaff(int id) {
        s = new Staff();
        super.setpStmt("SELECT top 1 * FROM Staff where StaffId = ?");
        try {
            super.getpStmt().setInt(1, id);
            ResultSet rs = super.execute();
            if (rs.next()) {
                UserRoleController roleCon = new UserRoleController();
                s.setStaffID(rs.getInt("StaffID"));
                s.setRealName(rs.getString("RealName"));
                s.setUserName(rs.getString("Username"));
                //s.setRoleID(rs.getInt("RoleID"));
                s.setRole(roleCon.getRole(rs.getInt("RoleID")));
                s.seteMail(rs.getString("Email"));
                s.setTel(rs.getInt("ContactNumber"));
            }
            return s;
        } catch (SQLException ex) {
            return null;
        }
    }

    public Staff getStaff(String username) {
        s = new Staff();
        super.setpStmt("SELECT top 1 * FROM Staff where Username = ?");
        try {
            super.getpStmt().setString(1, username);
            ResultSet rs = super.execute();
            if (rs.next()) {
                UserRoleController roleCon = new UserRoleController();
                s.setStaffID(rs.getInt("StaffID"));
                s.setRealName(rs.getString("RealName"));
                s.setUserName(rs.getString("Username"));
                s.setRole(roleCon.getRole(rs.getInt("RoleID")));
                //s.setRoleID(rs.getInt("RoleID"));
                s.seteMail(rs.getString("Email"));
                s.setTel(rs.getInt("ContactNumber"));
            } else {
                return null;
            }
            return s;
        } catch (SQLException ex) {
            return null;
        }
    }

    public boolean createStaff(Staff s) {
        if (getStaff(s.getUserName()) == null) {
            this.s = s;
            super.setpStmt("INSERT INTO STAFF(RealName, Username, Pwd, RoleID, DeptID, Email, ContactNumber) VALUES(?, ?, 'fcea920f7412b5da7be0cf42b8c93759', ?, ?, ?, ?)"); //pwd=1234567
            try {
                super.getpStmt().setString(1, s.getRealName());
                super.getpStmt().setString(2, s.getUserName());
                super.getpStmt().setInt(3, s.getRole().getRoleID());
                super.getpStmt().setInt(4, s.getDept().getDeptID());
                super.getpStmt().setString(5, s.geteMail());
                super.getpStmt().setInt(6, s.getTel());
                return super.executeUpdate();
            } catch (SQLException ex) {
                return false;
            }
        }
        return false;
    }

    public boolean createStaff(Map<String, String[]> map) {
        s = new Staff();
        s.setRealName(map.get("realname")[0]);
        s.setUserName(map.get("username")[0]);
        s.setRole(new UserRoleController().getRole(Integer.parseInt(map.get("role")[0])));
        s.setDept(new DepartmentController().getDept(Integer.parseInt(map.get("department")[0])));
        s.seteMail((map.get("email")[0]));
        s.setTel(Integer.parseInt(map.get("telno")[0]));
        return createStaff(s);
    }

}
