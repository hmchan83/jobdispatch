package beanController;

import bean.Log;
import bean.Staff;
import bean.Task;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Joseph
 */
public class LogController extends BeanController{
    public LogController(){
        super();
    }
    
    private Log setLog(String logType, Task task, Staff assignee, Staff reporter, Timestamp date){
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
            super.getpStmt().setTimestamp(5, log.getTime());
            boolean b = super.executeUpdate();
            return b;
        }catch(Exception e){
            return false;
        }finally{
            try{super.getpStmt().close();}catch(Exception e){}
        }
    }
    
    public boolean logCreateTask(Task task, Staff assignee, Staff reporter, Timestamp date){     
        return updateSQL(setLog("create", task, assignee, reporter, date));
    }
    
    public boolean logAssignTask(Task task, Staff assignee, Staff reporter, Timestamp date){
        return updateSQL(setLog("assign", task, assignee, reporter, date));
    }
    
    public boolean logStartTask(Task task, Staff assignee, Staff reporter, Timestamp date){
        return updateSQL(setLog("start", task, assignee, reporter, date));
    }
    
    public boolean logCompleteTask(Task task, Staff assignee, Staff reporter, Timestamp date){
        return updateSQL(setLog("complete", task, assignee, reporter, date));
    }
    
    public boolean logReportTask(Task task, Staff assignee, Staff reporter, Timestamp date){
        return updateSQL(setLog("report", task, assignee, reporter, date));
    }
    
    public boolean logCloseTask(Task task, Staff assignee, Staff reporter, Timestamp date){
        return updateSQL(setLog("close", task, assignee, reporter, date));
    }
    
    @SuppressWarnings("empty-statement")
    public Timestamp getTaskCreatTime(int taskid){
        try {
            super.setpStmt("SELECT top 1 Date FROM SystemLog WHERE LogType=? AND TaskID=? order by Date");
            super.getpStmt().setString(1, "create");
            super.getpStmt().setInt(2, taskid);
            ResultSet rs = super.execute();
            while (rs.next()) {
                Timestamp t=rs.getTimestamp("Date");
                return t;
            }
            return null;
        } catch (SQLException ex) {
            return null;
        }
    }
}
