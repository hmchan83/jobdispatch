package beanController;

import bean.*;
import java.sql.*;
import java.util.ArrayList;
import org.apache.catalina.util.ParameterMap;

/**
 *
 * @author Marcus For controlling a single Task, For adding a new Task, please
 * use TaskListcontroller
 */
public class TaskController extends BeanController {
    
    private Task t;

    public TaskController() {
        super();
    }

    public Task getTaskDetail(int taskID) {
        try {
            t = new Task();
            super.setpStmt("SELECT TaskID, TaskName, TypeID, StatusID, PriorityID, TaskDescription, AssigneeID, ReporterID FROM Task Where TaskID = ?");
            super.getpStmt().setInt(1, taskID);
            ResultSet rs = super.execute();
            TaskTypeController taskTypeCon = new TaskTypeController();
            StatusController statusCon = new StatusController();
            PriorityController priorityCon = new PriorityController();
            while (rs.next()) {
                t.setTaskID(rs.getInt("TaskID")); //TaskID
                t.setTaskName(rs.getString("TaskName")); //TaskName
                t.setTaskType(taskTypeCon.getTaskType(rs.getInt("TypeID"))); //TaskType
                t.setStatus(statusCon.getStatus(rs.getInt("StatusID"))); //Status
                t.setPriority(priorityCon.getPriority(rs.getInt("PriorityID")));
                t.setDescription(rs.getString("TaskDescription"));
            }
            return t;
        } catch (SQLException ex) {
            return null;
        }
    }

    public void modifyTask(int taskID, Task newInfo) {//Update a Task

    }
    
    public boolean createTask(ParameterMap pMap){
        t = new Task();
        if(pMap.containsKey("tasktitle"))   t.setTaskName((String)pMap.get("tasktitle"));
        if(pMap.containsKey("tasktype"))    t.setTaskType(new TaskTypeController().getTaskType(Integer.parseInt((String)pMap.get("tasktype"))));
        t.setStatus(new StatusController().getStatus(2));  
        if(pMap.containsKey("taskpriority"))    t.setPriority(new PriorityController().getPriority(Integer.parseInt((String)pMap.get("taskpriority")))); 
        if(pMap.containsKey("taskdescription")) t.setDescription((String)pMap.get("taskdescription"));
        if(pMap.containsKey("assigneeid"))   t.setAssignee(new StaffController().getStaff((Integer)pMap.get("assigneeid")));
        if(pMap.containsKey("reporterid"))   t.setReporter(new StaffController().getStaff((Integer)pMap.get("reporterid")));
        
        super.setpStmt("INSERT INTO task (TaskName, TypeID, StatusID, PriorityID, TaskDescription, AssigneeID, ReporterID) values(?, ?, ?, ?, ?, ?, ?)");
        try{
            super.getpStmt().setString(1, t.getTaskName());
            super.getpStmt().setInt(2, t.getTaskType().getTypeID());
            super.getpStmt().setInt(3, t.getStatus().getStatusID());
            super.getpStmt().setInt(4, t.getPriority().getPriorityID());
            super.getpStmt().setString(5, t.getDescription());
            super.getpStmt().setInt(6, t.getAssignee().getStaffID());
            super.getpStmt().setInt(7, t.getReporter().getStaffID());
            super.executeUpdate();
        }catch(SQLException ex){
            return false;
        }
        return true;
    }

    //Lazy
    public Task get(int ID) {
        return getTaskDetail(ID);
    }
}
