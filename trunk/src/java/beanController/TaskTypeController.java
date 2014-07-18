package beanController;

import java.util.ArrayList;
import bean.*;
import java.sql.*;
import java.util.HashMap;

/**
 *
 * @author Marcus
 */
public class TaskTypeController extends BeanController {

    private static ArrayList<TaskType> typeList = null;

    public TaskTypeController() {
        super();
        //if(typeList == null){
            typeList = new ArrayList<>();
            try {
                super.setpStmt("SELECT TypeID, TypeName FROM TaskType Order By TypeID");
                ResultSet rs = super.execute();
                TaskType tmp;
                while (rs.next()) {
                    tmp = new TaskType();
                    tmp.setTypeID(rs.getInt(1));
                    tmp.setTypeName(rs.getString(2));
                    typeList.add(tmp);
                }
            } catch (SQLException ex) {
                super.error(ex);
            }
        //}
    }

    public ArrayList<TaskType> getTypeList() {
        return TaskTypeController.typeList;
    }

    public TaskType getTaskType(int TypeID) {
        for (TaskType t : typeList) {
            if (t.getTypeID() == TypeID) {
                return t;
            }
        }
        return null;
    }

    public void addTaskType(TaskType Type) {
        try {
            super.setpStmt("Insert INTO TaskType (TypeID,TypeName) VALUES (?,?)");
            super.getpStmt().setInt(1, Type.getTypeID());
            super.getpStmt().setString(2, Type.getTypeName());
            super.executeUpdate();
            typeList.add(Type);
        } catch (SQLException ex) {
            super.error(ex);
        }

    }

    public void addTaskType(String Name) {
        try {
            super.setpStmt("Insert INTO TaskType (TypeName) VALUES (?)");
            super.getpStmt().setString(1, Name);
            super.executeUpdate();
            TaskType NewType = new TaskType();
            ResultSet insertedID = super.getpStmt().getGeneratedKeys();
            if (insertedID.next()) {
                NewType.setTypeID(insertedID.getInt(1));
                NewType.setTypeName(Name);
                typeList.add(NewType);
            }
        } catch (SQLException ex) {
            super.error(ex);
        }
    }
    
        public HashMap<TaskType, Boolean> getTaskTypeMap(){
        ArrayList<TaskType> temp = getTypeList();
        HashMap<TaskType, Boolean> typemap = new HashMap<>();
        setpStmt("SELECT COUNT(taskID) FROM Task WHERE TypeID = ?");
        for(TaskType t : temp){
            try{
                getpStmt().setInt(1, t.getTypeID());
                ResultSet rs = execute();
                if(rs.next())
                    if(rs.getInt(1)>0)
                        typemap.put(t, Boolean.FALSE);
                    else
                        typemap.put(t, Boolean.TRUE);
                else
                    typemap.put(t, Boolean.TRUE);
            }catch(SQLException e){}
        }
        return typemap;
    }

    public void dropTaskType(int TypeID) {
        super.setpStmt("DELETE FROM TaskType WHERE TypeID=?");
        try{
            super.getpStmt().setInt(1, TypeID);
            super.execute();
            
        }catch(SQLException e)
        {}
    }

    //Lazy
    public TaskType get(int ID) {
        return getTaskType(ID);
    }

    public void add(TaskType type) {
        addTaskType(type);
    }

    public void add(String name) {
        addTaskType(name);
    }

}
