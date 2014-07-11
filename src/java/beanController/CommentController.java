/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package beanController;
import bean.Comment;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Marcus
 */
public class CommentController extends BeanController{
    
    public CommentController(){
        super();
    }
    
    public ArrayList<Comment> getComments(int taskID){
        ArrayList<Comment> commentList = new ArrayList<>();
        try {
            super.setpStmt("SELECT * FROM Comment WHERE TaskID = ? Order By Date DESC");
            super.getpStmt().setInt(1, taskID);
            ResultSet rs = super.execute();
            Comment tmp;
            while (rs.next()) {
                tmp = new Comment();
                tmp.setComment(rs.getString("Content"));
                tmp.setCommentID(rs.getInt("CommentID"));
                tmp.setCommenter(new StaffController().getStaff(rs.getInt("CommenterID")));
                tmp.setDate(rs.getTimestamp("Date"));
                tmp.setTaskid(taskID);
                commentList.add(tmp);
            }
            return commentList;
        } catch (SQLException ex) {
            super.error(ex);
            return null;
        }
    }
    
    public ArrayList get(int taskID){
        return getComments(taskID);
    }
    
    public Boolean newComment(int taskID, String content,int userID){
        try {
            Timestamp current = new Timestamp(System.currentTimeMillis());
            super.setpStmt("Insert into Comment (CommenterID,TaskID,Date,Content) VALUES (?,?,?,?)");
            super.getpStmt().setInt(1, userID);
            super.getpStmt().setInt(2, taskID);
            super.getpStmt().setTimestamp(3, current);
            super.getpStmt().setString(4,content);
            return super.executeUpdate();
               /* StaffController stacon = new StaffController();
                ResultSet newid=super.getpStmt().getGeneratedKeys();
                Comment tmp = new Comment();
                tmp.setComment(content);
                tmp.setCommentID(newid.getInt(1));
                tmp.setCommenter(stacon.getStaff(userID));
                Date date;
                date = new Date(current.getTime());
                tmp.setDate(date);
                tmp.setTaskid(taskID);*/
        } catch (SQLException ex) {
            return false;
        }
    }
    
}
