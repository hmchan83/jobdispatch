/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beanController;

import bean.Task;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Joseph
 */
public class TaskListController extends BeanController {

    public TaskListController() {
        super();
    }

    public ArrayList<Task> getTasksByStaff(int staffID) {
        ArrayList<Task> tasks = new ArrayList<>();
        super.setpStmt("SELECT top(5) TaskID, TaskName FROM Task Where AssigneeID=? AND (StatusID=2 OR StatusID=3) ORDER BY PriorityID asc");
        try {
            ResultSet rs = super.execute();
            Task tmp;
            while (rs.next()) {
                tmp = new Task();
                tmp.setTaskID(rs.getInt(1));
                tmp.setTaskName(rs.getString(2));
            }
        } catch (SQLException ex) {
            return null;
        }
        return tasks;
    }

}
