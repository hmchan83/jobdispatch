/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/**
 *
 * @author Marcus
 */
public class Comment {
    private int commentID;
    private Staff commenter;
    private int taskid;
    private Timestamp date;
    private String comment;

    public Comment(){
    
    }
    
    public int getCommentID() {
        return commentID;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
    }

    public Staff getCommenter() {
        return commenter;
    }

    public void setCommenter(Staff commenter) {
        this.commenter = commenter;
    }

    public int getTaskid() {
        return taskid;
    }

    public void setTaskid(int taskid) {
        this.taskid = taskid;
    }

    public String getDate() {
        String format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
        return format;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }   
    
}
