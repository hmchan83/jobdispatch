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
public class TaskType {
    
    private int typeID;
    private String typeName;

    public TaskType() {
    }

    public int getTypeID() {
        return typeID;
    }

    public void setTypeID(int typeid) {
        this.typeID = typeid;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typename) {
        this.typeName = typename;
    }
    
}
