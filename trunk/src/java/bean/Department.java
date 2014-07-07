/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean;

/**
 *
 * @author Marcus
 */
public class Department {
    
    private int deptID;
    private String deptname;

    public Department() {
    }

    public int getDeptID() {
        return deptID;
    }

    public void setDeptID(int deptID) {
        this.deptID = deptID;
    }

    public String getDeptName() {
        return deptname;
    }

    public void setDeptName(String deptname) {
        this.deptname = deptname;
    }
    
    public String toString(){
        return this.deptname;
    }
    
}
