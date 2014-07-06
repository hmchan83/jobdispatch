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

/**
 *
 * @author Marcus
 */
public class UserRoleController extends BeanController{
        private static ArrayList<UserRole> roleList = null;

    public UserRoleController() {
        super();
        if(roleList == null){
            roleList = new ArrayList<>();
            try {
                super.setpStmt("SELECT RoleID, RoleName FROM UserRole Order By RoleID");
                ResultSet rs = super.execute();
                UserRole tmp = new UserRole();
                while (rs.next()) {
                    tmp.setRoleID(rs.getInt(1));
                    tmp.setRoleName(rs.getString(2));
                    roleList.add(tmp);
                }
            } catch (SQLException ex) {
                super.error(ex);
            }
        }
    }

    public ArrayList<UserRole> getRoleList() {
        return UserRoleController.roleList;
    }

    public UserRole getRole(int ID) {
        for (UserRole t : roleList) {
            if (t.getRoleID() == ID)
                return t;
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
            UserRole NewPriority = new UserRole();
            ResultSet insertedID = super.getpStmt().getGeneratedKeys();
            if (insertedID.next()) {
                NewPriority.setRoleID(insertedID.getInt(1));
                NewPriority.setRoleName(Name);
                roleList.add(NewPriority);
            }
        } catch (SQLException ex) {
            super.error(ex);
        }
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
