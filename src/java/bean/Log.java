package bean;

import java.util.Date;

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
    private Date date;
    
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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

}
