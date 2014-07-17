/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beanController;

import bean.UserRole;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author Marcus
 */
public class UserRoleController extends BeanController {

    private static ArrayList<UserRole> roleList = null;

    public UserRoleController() {
        super();
        if (roleList == null) {
            roleList = new ArrayList<>();
            roleList = getRoleList();
        }
    }

    public ArrayList<UserRole> getRoleList() {
        ArrayList<UserRole> templist = new ArrayList<>();
        try {
            super.setpStmt("SELECT RoleID, RoleName FROM UserRole Order By RoleID");
            ResultSet rs = super.execute();
            UserRole tmp;
            while (rs.next()) {
                tmp = new UserRole();
                tmp.setRoleID(rs.getInt("RoleID"));
                tmp.setRoleName(rs.getString("RoleName"));
                templist.add(tmp);
            }
        } catch (SQLException ex) {
            super.error(ex);
        }
        return templist;
    }

    public UserRole getRole(int ID) {
        for (UserRole t : roleList) {
            if (t.getRoleID() == ID) {
                return t;
            }
        }
        return null;
    }

    public void addRole(UserRole role) {
        try {
            super.setpStmt("Insert INTO UserRole (RoleID,RoleName) VALUES (?,?)");
            super.getpStmt().setInt(1, role.getRoleID());
            super.getpStmt().setString(2, role.getRoleName());
            super.executeUpdate();
            roleList.add(role);
        } catch (SQLException ex) {
            super.error(ex);
        }

    }

    public void addRole(String Name) {
        try {
            super.setpStmt("Insert INTO UserRole (RoleName) VALUES (?)");
            super.getpStmt().setString(1, Name);
            super.executeUpdate();
            ResultSet insertedID = super.getpStmt().getGeneratedKeys();
            if (insertedID.next()) {
                UserRole NewRole = new UserRole();
                NewRole.setRoleID(insertedID.getInt(1));
                NewRole.setRoleName(Name);
                roleList.add(NewRole);
            }
        } catch (SQLException ex) {
            super.error(ex);
        }
    }

    public void delRole(int roleid) {
        try {
            super.setpStmt("DELETE FROM UserRole WHERE roleid = ?");
            super.getpStmt().setInt(1, roleid);
            super.executeUpdate();
        } catch (SQLException ex) {
        }
    }

    public HashMap<UserRole, Boolean> getRoleMap() {
        ArrayList<UserRole> temp = getRoleList();
        HashMap<UserRole, Boolean> rolemap = new HashMap<>();
        setpStmt("SELECT TOP 1 StaffID FROM STAFF WHERE RoleID = ? AND Retired=0");
        for (UserRole r : temp) {
            try {
                getpStmt().setInt(1, r.getRoleID());
                ResultSet rs = execute();
                if (rs.next()) {
                    rolemap.put(r, Boolean.FALSE);
                } else {
                    rolemap.put(r, Boolean.TRUE);
                }
            } catch (SQLException e) {
            }
        }
        return rolemap;
    }

    //Lazy
    public UserRole get(int ID) {
        return getRole(ID);
    }

    public void add(UserRole role) {
        addRole(role);
    }

    public void add(String name) {
        addRole(name);
    }
}
