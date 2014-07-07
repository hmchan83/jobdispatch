package beanController;

import java.util.ArrayList;
import bean.*;
import java.sql.*;

/**
 *
 * @author Marcus
 */
public class TaskTypeController extends BeanController {

    private static ArrayList<TaskType> typeList = null;

    public TaskTypeController() {
        super();
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
            super.setpStmt("Insert INTO TaskType (TaskName) VALUES (?)");
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

    public void dropTaskType() {

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
