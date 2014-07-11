package bean;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/**
 *
 * @author Joseph
 */
public class Log{
    
    private int logID;
    private String logType;
    private Task task;
    private Staff assignee;
    private Staff reporter;
    private Timestamp date;
    
    public int getLogID() {
        return logID;
    }

    public void setLogID(int logID) {
        this.logID = logID;
    }

    public String getLogType() {
        return logType;
    }

    public void setLogType(String logType) {
        this.logType = logType;
    }

    public Task getTask() {
        return task;
    }

    public void setTask(Task task) {
        this.task = task;
    }

    public Staff getAssignee() {
        return assignee;
    }

    public void setAssignee(Staff assignee) {
        this.assignee = assignee;
    }

    public Staff getReporter() {
        return reporter;
    }

    public void setReporter(Staff reporter) {
        this.reporter = reporter;
    }

    public Timestamp getTime(){
        return date;
    }
    
    public String getDate() {
        String format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
        return format;
    }
    public void setDate(Timestamp date) {
        this.date = date;
    }

}
