package beanController;

import bean.Status;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Marcus
 */
public class StatusController extends BeanController {

    private static ArrayList<Status> statusList = null;

    public StatusController() {
        super();
        if(statusList==null){
            statusList = new ArrayList<>();
            try {
                super.setpStmt("SELECT StatusID, StatusName FROM TaskStatus Order By StatusID");
                ResultSet rs = super.execute();
                Status tmp;
                while (rs.next()) {
                    tmp = new Status();
                    tmp.setStatusID(rs.getInt("StatusID"));
                    tmp.setStatusName(rs.getString("StatusName"));
                    statusList.add(tmp);
                }
            } catch (SQLException ex) {
                super.error(ex);
            }
        }
    }

    public ArrayList<Status> getStatusList() {
        return StatusController.statusList;
    }

    public Status getStatus(int StatusID) {
        for (Status t : statusList) {
            if (t.getStatusID() == StatusID) {
                return t;
            }
        }
        return null;
    }
    
    public Status getStatus(String StatusName) {
        for (Status t : statusList) {
            if (t.getStatusName().equals(StatusName)) {
                return t;
            }
        }
        return null;
    }

    public void addStatus(Status status) {
        try {
            super.setpStmt("Insert INTO TaskStatus (StatusID,StatusName) VALUES (?,?)");
            super.getpStmt().setInt(1, status.getStatusID());
            super.getpStmt().setString(2, status.getStatusName());
            super.executeUpdate();
            statusList.add(status);
        } catch (SQLException ex) {
            super.error(ex);
        }

    }

    public void addStatus(String Name) {
        try {
            super.setpStmt("Insert INTO TaskStatus (StatusName) VALUES (?)");
            super.getpStmt().setString(1, Name);
            super.executeUpdate();
            Status NewStatus = new Status();
            ResultSet insertedID = super.getpStmt().getGeneratedKeys();
            if (insertedID.next()) {
                NewStatus.setStatusID(insertedID.getInt(1));
                NewStatus.setStatusName(Name);
                statusList.add(NewStatus);
            }
        } catch (SQLException ex) {
            super.error(ex);
        }
    }

    //Lazy
    public Status get(int StatusID) {
        return getStatus(StatusID);
    }

    public void add(Status status) {
        addStatus(status);
    }

    public void add(String name) {
        addStatus(name);
    }

}
