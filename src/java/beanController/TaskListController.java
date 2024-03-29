package beanController;

import bean.Task;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

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
        TaskController tc = new TaskController();
        super.setpStmt("SELECT TaskID FROM Task WHERE AssigneeID=? AND (StatusID=1 OR StatusID=2 OR StatusID=3) ORDER BY TaskID desc, PriorityID asc");
        try {
            super.getpStmt().setInt(1, staffID);
            ResultSet rs = super.execute();
            Task tmp;
            while (rs.next()) {
                tmp = tc.getTaskBasic(rs.getInt(1));
                tasks.add(tmp);
            }
        } catch (SQLException ex) {
            return null;
        }
        return tasks;
    }
    
    public ArrayList<Task> getTop10TasksByStaff(int staffID) {
        ArrayList<Task> tasks = new ArrayList<>();
        TaskController tc = new TaskController();
        super.setpStmt("SELECT top 10 TaskID FROM Task WHERE AssigneeID=? AND (StatusID=1 OR StatusID=2 OR StatusID=3) ORDER BY TaskID desc, PriorityID asc");
        try {
            super.getpStmt().setInt(2, staffID);
            ResultSet rs = super.execute();
            Task tmp;
            while (rs.next()) {
                tmp = tc.getTaskBasic(rs.getInt(1));
                tasks.add(tmp);
            }
        } catch (SQLException ex) {
            return null;
        }
        return tasks;
    }
    
    public ArrayList<Task> getUnreportTasksByStaff(int staffID) {
        ArrayList<Task> tasks = new ArrayList<>();
        TaskController tc = new TaskController();
        super.setpStmt("SELECT TaskID FROM Task Where AssigneeID=? AND (StatusID = 4 OR StatusID=8) ORDER BY TaskID desc, PriorityID asc");
        try {
            super.getpStmt().setInt(1, staffID);
            ResultSet rs = super.execute();
            Task tmp;
            while (rs.next()) {
                tmp = tc.getTaskBasic(rs.getInt(1));
                tasks.add(tmp);
            }
        } catch (SQLException ex) {
            return null;
        }
        return tasks;
    }

    public ArrayList<Task> getTasksByMap(Map<String, String[]> pMap) {
        ArrayList<Task> tasks = new ArrayList<>();
        TaskController tc = new TaskController();
        String SQL = "SELECT TaskID FROM Task";
        boolean hasFilter = false;
        for (Map.Entry<String, String[]> entry : pMap.entrySet()) {
            if (!(entry.getValue().length == 0 || entry.getValue()[0].equals(""))) {
                SQL = addFilter(SQL, entry.getKey());
                hasFilter = true;
            }
        }
        super.setpStmt(SQL);
        try {
            if(hasFilter){
                int counter = 1;
                for (Map.Entry<String, String[]> entry : pMap.entrySet()) {
                    if (!entry.getValue()[0].equals("")) {
                        super.getpStmt().setString(counter, entry.getValue()[0]);
                        counter++;
                    }
                }
            }
            ResultSet rs = super.execute();
            while (rs.next()) {
                tasks.add(tc.getTaskAdvanced(rs.getInt(1)));
            }
        } catch (SQLException e) {
        }
        return tasks;
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
