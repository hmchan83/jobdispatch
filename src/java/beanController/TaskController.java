package beanController;

import bean.*;
import java.sql.*;
import java.text.SimpleDateFormat;
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
            StaffController staffCon = new StaffController();
            LogController logCon = new LogController();
            while (rs.next()) {
                t.setTaskID(rs.getInt("TaskID")); //TaskID
                t.setTaskName(rs.getString("TaskName")); //TaskName
                t.setTaskType(taskTypeCon.getTaskType(rs.getInt("TypeID"))); //TaskType
                t.setStatus(statusCon.getStatus(rs.getInt("StatusID"))); //Status
                t.setPriority(priorityCon.getPriority(rs.getInt("PriorityID")));
                t.setDescription(rs.getString("TaskDescription"));
                t.setAssignee(staffCon.getStaff(rs.getInt("AssigneeID")));
                t.setReporter(staffCon.getStaff(rs.getInt("ReporterID")));
                String format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(logCon.getTaskCreatTime(rs.getInt("TaskID")));
                t.setDate(format);
            }
            return t;
        } catch (SQLException ex) {
            return null;
        }
    }

    public Boolean updateStatus(int taskID, Status newvalue){
        return updateStatus(taskID,newvalue.getStatusID());
    }
    
    public Boolean updateStatus(int taskID, int newvalue){
        try{
            super.setpStmt("UPDATE Task SET StatusID = ? Where TaskID = ?");
            super.getpStmt().setInt(1, newvalue);
            super.getpStmt().setInt(2, taskID);
            Boolean c = super.executeUpdate();
            if(c==true){
                StatusController statusCon = new StatusController();
                this.get(taskID).setStatus(statusCon.getStatus(newvalue));
                return true;
            }else
            return false;
        }catch(SQLException ex){
            return false;
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
        Timestamp current = new Timestamp(System.currentTimeMillis());
        t.setTime(current);
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
            ResultSet insertedID = super.getpStmt().getGeneratedKeys();
            if(insertedID.next()){
                t.setTaskID(insertedID.getInt(1));
            }
            LogController logCon = new LogController();
            logCon.logTask(new StatusController().getStatus("New"),t, t.getAssignee(), t.getReporter(), current);
            //logCon.logCreateTask(t, t.getAssignee(), t.getReporter(), current);
            //logCon.logAssignTask(t, t.getAssignee(), t.getReporter(), current);
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
