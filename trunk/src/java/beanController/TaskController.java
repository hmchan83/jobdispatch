package beanController;

import bean.*;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Marcus For controlling a single Task, For adding a new Task, please
 * use TaskListcontroller
 */
public class TaskController extends BeanController {

    public TaskController() {
        super();
    }

    public Task getTaskDetail(int taskID) {
        try {
            Task t = new Task();
            super.setpStmt("SELECT TaskID, TaskName, TypeID, StatusID, PriorityID, TaskDescription, AssigneeID, ReporterID FROM Task Where TaskID = ?");
            super.getpStmt().setInt(1, taskID);
            ResultSet rs = super.execute();
            TaskTypeController taskTypeCon = new TaskTypeController();
            StatusController statusCon = new StatusController();
            PriorityController priorityCon = new PriorityController();
            while (rs.next()) {
                t.setTaskID(rs.getInt(1)); //TaskID
                t.setTaskName(rs.getString(2)); //TaskName
                t.setTaskType(taskTypeCon.getTaskType(rs.getInt(3))); //TaskType
                t.setStatus(statusCon.getStatus(rs.getInt(4))); //Status
                t.setPriority(priorityCon.getPriority(rs.getInt(5)));
                t.setDescription(rs.getString(6));
            }
            return t;
        } catch (SQLException ex) {
            return null;
        }
    }

     public void modifyTask(int taskID, Task newInfo) {//Update a Task

    }

    //Lazy
    public Task get(int ID) {
        return getTaskDetail(ID);
    }
}
