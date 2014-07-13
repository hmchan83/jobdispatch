/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;


/**
 *
 * @author Marcus
 */
public class Task{

    private int taskID;
    private String taskName;
    private TaskType taskType;
    private Status status;
    private Priority priority;
    private String description;
    private Staff assignee;
    private Staff reporter;
    private String date;
    private Staff creator;

    public Task() {
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String title) {
        this.taskName = title;
    }

    public TaskType getTaskType() {
        return taskType;
    }

    public void setTaskType(TaskType tasktype) {
        this.taskType = tasktype;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Priority getPriority() {
        return priority;
    }

    public void setPriority(Priority priority) {
        this.priority = priority;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getTaskID() {
        return taskID;
    }

    public void setTaskID(int taskid) {
        this.taskID = taskid;
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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
    public void setTime(Timestamp t){
        this.date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(t);
    }

    public Staff getCreator() {
        return creator;
    }

    public void setCreator(Staff creator) {
        this.creator = creator;
    }
   
}
