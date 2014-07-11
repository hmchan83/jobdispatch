package beanController;

import bean.Log;
import bean.Staff;
import bean.Task;
import java.util.Date;

/**
 *
 * @author Joseph
 */
public class LogController extends BeanController{
    public LogController(){
        super();
    }
    
    private Log setLog(String logType, Task task, Staff assignee, Staff reporter, Date date){
        Log log = new Log();
        log.setLogType(logType);
        log.setTask(task);
        log.setAssignee(assignee);
        log.setReporter(reporter);
        log.setDate(date); 
        return log;
    }
    
    public boolean updateSQL(Log log){
        super.setpStmt("INSERT INTO SystemLog(LogType, TaskID, AssigneeID, ReporterID, Date) VALUES (?, ?, ?, ?, ?)");
        try{
            super.getpStmt().setString(1, log.getLogType());
            super.getpStmt().setInt(2, log.getTask().getTaskID());
            super.getpStmt().setInt(3, log.getAssignee().getStaffID());
            super.getpStmt().setInt(4, log.getReporter().getStaffID());
            super.getpStmt().setObject(5, new java.sql.Timestamp(log.getDate().getTime()));
            return super.executeUpdate();
        }catch(Exception e){
            return false;
        }finally{
            try{super.getpStmt().close();}catch(Exception e){}
        }
    }
    
    public boolean logCreateTask(Task task, Staff assignee, Staff reporter, Date date){     
        return updateSQL(setLog("create", task, assignee, reporter, date));
    }
    
    public boolean logAssignTask(Task task, Staff assignee, Staff reporter, Date date){
        return updateSQL(setLog("assign", task, assignee, reporter, date));
    }
    
    public boolean logStartTask(Task task, Staff assignee, Staff reporter, Date date){
        return updateSQL(setLog("start", task, assignee, reporter, date));
    }
    
    public boolean logCompleteTask(Task task, Staff assignee, Staff reporter, Date date){
        return updateSQL(setLog("complete", task, assignee, reporter, date));
    }
    
    public boolean logReportTask(Task task, Staff assignee, Staff reporter, Date date){
        return updateSQL(setLog("complete", task, assignee, reporter, date));
    }
    
    public boolean logCloseTask(Task task, Staff assignee, Staff reporter, Date date){
        return updateSQL(setLog("complete", task, assignee, reporter, date));
    }
}
