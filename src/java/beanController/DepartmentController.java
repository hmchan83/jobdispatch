/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beanController;

import bean.Department;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author Marcus
 */
public class DepartmentController extends BeanController {

    private static ArrayList<Department> deptList = null;

    public DepartmentController() {
        super();
        if (deptList == null) {
            deptList = new ArrayList<>();
            try {
                super.setpStmt("SELECT DeptID, DeptName FROM Department Order By DeptID");
                ResultSet rs = super.execute();
                Department tmp;
                while (rs.next()) {
                    tmp = new Department();
                    tmp.setDeptID(rs.getInt(1));
                    tmp.setDeptName(rs.getString(2));
                    deptList.add(tmp);
                }
            } catch (SQLException ex) {
                super.error(ex);
            }
        }
    }

    public ArrayList<Department> getDeptList() {
        return DepartmentController.deptList;
    }

    public Department getDept(int ID) {
        for (Department t : deptList) {
            if (t.getDeptID() == ID) {
                return t;
            }
        }
        return null;
    }

    public void addDept(Department Type) {
        try {
            super.setpStmt("Insert INTO Department (DeptID,DeptName) VALUES (?,?)");
            super.getpStmt().setInt(1, Type.getDeptID());
            super.getpStmt().setString(2, Type.getDeptName());
            super.executeUpdate();
            deptList.add(Type);
        } catch (SQLException ex) {
            super.error(ex);
        }

    }

    public void addDept(String Name) {
        try {
            super.setpStmt("Insert INTO Department (DeptName) VALUES (?)");
            super.getpStmt().setString(1, Name);
            super.executeUpdate();
            Department NewDept = new Department();
            ResultSet insertedID = super.getpStmt().getGeneratedKeys();
            if (insertedID.next()) {
                NewDept.setDeptID(insertedID.getInt(1));
                NewDept.setDeptName(Name);
                deptList.add(NewDept);
            }
        } catch (SQLException ex) {
            super.error(ex);
        }
    }

    public void delDept(int ID) {
        super.setpStmt("DELETE FROM DEPARTMENT WHERE DEPTID=?");
        try {
            super.getpStmt().setInt(1, ID);
            super.execute();
            Department temp = get(ID);
            deptList.remove(temp);
        } catch (SQLException e) {
        }
    }

    public HashMap<Department, Boolean> getDeptMap() {
        ArrayList<Department> temp = getDeptList();
        HashMap<Department, Boolean> deptmap = new HashMap<>();
        setpStmt("SELECT TOP 1 StaffID FROM STAFF WHERE DeptID = ? AND Retired=0");
        for (Department d : temp) {
            try {
                getpStmt().setInt(1, d.getDeptID());
                ResultSet rs = execute();
                if (rs.next()) {
                    deptmap.put(d, Boolean.FALSE);
                } else {
                    deptmap.put(d, Boolean.TRUE);
                }
            } catch (SQLException e) {
            }
        }
        return deptmap;
    }

    //Lazy
    public Department get(int ID) {
        return getDept(ID);
    }

    public void add(Department dept) {
        addDept(dept);
    }

    public void add(String name) {
        addDept(name);
    }
}
