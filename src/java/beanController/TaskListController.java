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
        super.setpStmt("SELECT TaskID, TaskName FROM Task Where AssigneeID=? AND (StatusID=2 OR StatusID=3) ORDER BY TaskID desc, PriorityID asc");
        try {
            super.getpStmt().setInt(1, staffID);
            ResultSet rs = super.execute();
            Task tmp;
            while (rs.next()) {
                tmp = new Task();
                tmp.setTaskID(rs.getInt(1));
                tmp.setTaskName(rs.getString(2));
                tasks.add(tmp);
            }
        } catch (SQLException ex) {
            return null;
        }
        return tasks;
    }

}
