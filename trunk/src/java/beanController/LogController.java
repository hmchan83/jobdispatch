package beanController;

import bean.Log;
import bean.Staff;
import bean.Status;
import bean.Task;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Map;
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
    
    public boolean logTask(Status status,Task task, Staff assignee, Staff reporter, Timestamp date){
        switch(status.getStatusName()){
            case "Started":
                return logStartTask(task,assignee,reporter,date);
            case "Completed":
                return logCompleteTask(task,assignee,reporter,date);
            case "Report":
                return logReportTask(task,assignee,reporter,date);
            case "Closed":
                return logCloseTask(task,assignee,reporter,date);
            case "New": case "create":
                if(logCreateTask(task,assignee,reporter,date)){
                    //if(logAssignTask(task,assignee,reporter,date)){
                        return true;
                    //}                   
                }
                return false;
            case "Assigned":
                return logAssignTask(task,assignee,reporter,date);
        }
        return false;
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
    
    public Log getLastestLog(Task task){
        return getLastestLog(task,"",null);
    }
    
    public Log getLastestLog(Task task, String Logtype, Staff assignee){
        Log log = new Log();
        try {
            String SQL="SELECT top 1 * FROM SystemLog WHERE TaskID=?";
            if(!Logtype.isEmpty())
                SQL+=" AND LogType=?";
            if(assignee!=null)
                SQL+=" AND AssigneeID=?";
            SQL+=" order by Date DESC";
            super.setpStmt(SQL);
            int n=1;
            super.getpStmt().setInt(n++, task.getTaskID());
            if(!Logtype.isEmpty())
                super.getpStmt().setString(n++,Logtype);
            if(assignee!=null)
                super.getpStmt().setInt(n++,assignee.getStaffID());
            ResultSet rs = super.execute();
            StaffController staffCon = new StaffController();
            while (rs.next()) {
                log.setLogType(rs.getString("LogType"));
                log.setTask(task);
                log.setDate(rs.getTimestamp("Date"));
                log.setAssignee(staffCon.getStaff(rs.getInt("AssigneeID")));
                log.setReporter(staffCon.getStaff(rs.getInt("ReporterID")));
                log.setLogID(rs.getInt("LogID"));
                return log;
            }
            return null;
        } catch (SQLException ex) {
            return null;
        }        
    }
    
    public Log getLastAssignLog(Task task){
        return this.getLastestLog(task, "assign",null);
    }
    
    public Log getLastAssignLogByassignee(Task task,Staff assignee){
        return this.getLastestLog(task, "assign", assignee);
    }
    
    public Log getCreateLog(Task task){
        Log log = new Log();
        try {
            super.setpStmt("SELECT top 1 * FROM SystemLog WHERE Logtype=? AND TaskID=?");
            super.getpStmt().setString(1, "create");
            super.getpStmt().setInt(2, task.getTaskID());
            ResultSet rs = super.execute();
            StaffController staffCon = new StaffController();
            while (rs.next()) {
                log.setLogType(rs.getString("LogType"));
                log.setTask(task);
                log.setDate(rs.getTimestamp("Date"));
                log.setAssignee(staffCon.getStaff(rs.getInt("AssigneeID")));
                log.setReporter(staffCon.getStaff(rs.getInt("ReporterID")));
                log.setLogID(rs.getInt("LogID"));
                return log;
            }
            return null;
        } catch (SQLException ex) {
            return null;
        }        
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
    
    public ArrayList<String> getLogTypeList(){
        ArrayList<String> s = new ArrayList<>();
        s.add("create");
        s.add("assign");
        s.add("start");
        s.add("complete");
        s.add("report");
        s.add("close");
        return s;
    }
    
    public ArrayList<Log> getLogsByMap(Map<String, String[]> map) {
        ArrayList<Log> logs = new ArrayList<>();
        String SQL = "SELECT * FROM Systemlog";
        boolean hasFilter = false;
        for (Map.Entry<String, String[]> entry : map.entrySet()) {
            if (!(entry.getValue().length == 0 || entry.getValue()[0].equals(""))) {
                SQL = addFilter(SQL, entry.getKey());
                hasFilter = true;
            }
        }
        super.setpStmt(SQL);
        try {
            if (hasFilter) {
                int counter = 1;
                for (Map.Entry<String, String[]> entry : map.entrySet()) {
                    if (!entry.getValue()[0].equals("")) {
                        super.getpStmt().setString(counter, entry.getValue()[0]);
                        counter++;
                    }
                }
            }
            ResultSet rs = super.execute();
            TaskController tc = new TaskController();
            StaffController sc = new StaffController();
            Log temp;
            while (rs.next()) {
                temp = new Log();
                temp.setLogID(rs.getInt("LogID"));
                temp.setLogType(rs.getString("LogType"));
                temp.setTask(tc.getTaskBasic(rs.getInt("TaskID")));
                temp.setReporter(sc.getStaffBasic(rs.getInt("ReporterID")));
                temp.setAssignee(sc.getStaffBasic(rs.getInt("AssigneeID")));
                temp.setDate(rs.getTimestamp("Date"));
                logs.add(temp);
            }
        } catch (SQLException e) {
        }
        return logs;
    }

    public String addFilter(String SQL, String key) {
        String temp = SQL.toLowerCase();
        boolean hasWhere = temp.contains("where");
        if (hasWhere) {
            temp += " AND " + key + " = ?";
        } else {
            temp += " WHERE " + key + " = ?";
        }
        return temp;
    }
}
