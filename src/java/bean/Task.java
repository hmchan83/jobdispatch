/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean;

/**
 *
 * @author Marcus
 */
public class Task {
    private int taskid;
    private String title;
    private TaskType tasktype;
    private Status status;
    private Priority priority;
    private String description;

    public Task() {
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public TaskType getTasktype() {
        return tasktype;
    }

    public void setTasktype(TaskType tasktype) {
        this.tasktype = tasktype;
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

    public int getTaskid() {
        return taskid;
    }

    public void setTaskid(int taskid) {
        this.taskid = taskid;
    }
    
    
    
}
