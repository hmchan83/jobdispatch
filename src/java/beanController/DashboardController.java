package beanController;

import bean.Dashboard;
import bean.Priority;
import bean.Staff;
import bean.Task;
import bean.TaskType;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.Date;

/**
 *
 * @author Joseph
 */
public class DashboardController extends BeanController{
    
    private Dashboard dashboard;
    
    public DashboardController(){
        super();
        dashboard = new Dashboard();
        getHighWorkloadPPL();
        getLowWorkloadPPL();
        getUrgentTasks();
        getUnresolvedType();
        getUnresolvedPriority();
        getResolvedType();
        getResolvedPriority();
        getProductivePPL();
        getNonProductivePPL();
    }
    
    public Dashboard getDashboard(){
        return dashboard;
    }
    
    public void getHighWorkloadPPL(){
        StaffController sc = new StaffController();
        super.setpStmt("select top 10 count(*) as count, assigneeid from task where (statusid=1 or statusid=2) group by assigneeid order by count(*) desc");
        ResultSet rs = super.execute();
        try{
        while(rs.next()){
            int count = rs.getInt("count");
            Staff assignee = sc.getStaff(rs.getInt("assigneeid"));
            dashboard.getHigh_workload_ppl().put(assignee, count);
        }
        }catch(SQLException e){}
    }
    
    public void getLowWorkloadPPL(){
        StaffController sc = new StaffController();
        super.setpStmt("select top 10 count(*) as count, assigneeid from task where (statusid=1 or statusid=2) group by assigneeid order by count(*) asc");
        ResultSet rs = super.execute();
        try{
        while(rs.next()){
            int count = rs.getInt("count");
            Staff assignee = sc.getStaff(rs.getInt("assigneeid"));
            dashboard.getLow_workload_ppl().put(assignee, count);
        }
        }catch(SQLException e){}
    }
    
    public void getUrgentTasks(){
        TaskController tc = new TaskController();
        super.setpStmt("select top 10 s.taskid, s.date from systemlog s, task t where logType='create' and not exists(select * from systemlog u where s.taskid = u.taskid and (logtype='start' or logtype='complete')) and s.taskid=t.taskid order by t.priorityid asc, s.date asc");
        ResultSet rs = super.execute();
        try{
            while(rs.next()){
                Task t = tc.getTaskDetail(rs.getInt("taskid"));
                long diff = new Date().getTime() - ((Date)rs.getObject("date")).getTime();
                dashboard.getUrgent_tasks().put(t, diff);
            }
        }catch(SQLException e){}
    }
    
    public void getUnresolvedType(){
        TaskTypeController ttc = new TaskTypeController();
        super.setpStmt("select count(*) as count, typeid from task where (statusid=1 or statusid=2 or statusid=3) group by typeid order by count desc");
        ResultSet rs = super.execute();
        try{
            while(rs.next()){
                TaskType t = ttc.getTaskType(rs.getInt("typeid"));
                int count = rs.getInt("count");
                dashboard.getUnresolved_type().put(t, count);
            }
        }catch(SQLException e){}
    }
    
    public void getUnresolvedPriority(){
        PriorityController pc = new PriorityController();
        super.setpStmt("select count(*) as count, priorityid from task where (statusid=1 or statusid=2 or statusid=3) group by priorityid order by count desc");
        ResultSet rs = super.execute();
        try{
            while(rs.next()){
                Priority p = pc.getPriority(rs.getInt("priorityid"));
                int count = rs.getInt("count");
                dashboard.getUnresolved_priority().put(p, count);
            }
        }catch(SQLException e){}
    }
    
    public void getResolvedType(){
        TaskTypeController ttc = new TaskTypeController();
        super.setpStmt("select count(*) as count, typeid from task where (statusid=4 or statusid=5) group by typeid order by count desc");
        ResultSet rs = super.execute();
        try{
            while(rs.next()){
                TaskType t = ttc.getTaskType(rs.getInt("typeid"));
                int count = rs.getInt("count");
                dashboard.getResolved_type().put(t, count);
            }
        }catch(SQLException e){}
    }
    
    public void getResolvedPriority(){
        PriorityController pc = new PriorityController();
        super.setpStmt("select count(*) as count, priorityid from task where (statusid=4 or statusid=5) group by priorityid order by count desc");
        ResultSet rs = super.execute();
        try{
            while(rs.next()){
                Priority p = pc.getPriority(rs.getInt("priorityid"));
                int count = rs.getInt("count");
                dashboard.getResolved_priority().put(p, count);
            }
        }catch(SQLException e){}
    }
    
    public void getProductivePPL(){
        StaffController sc = new StaffController();
        super.setpStmt("select top 10 count(distinct taskid) as count, assigneeid from systemlog where logtype='complete' group by assigneeid order by count desc");
        ResultSet rs = super.execute();
        try{
            while(rs.next()){
                Staff s = sc.getStaff(rs.getInt("assigneeid"));
                int count = rs.getInt("count");
                dashboard.getProductive_ppl().put(s, count);
            }
        }catch(SQLException e){}
    }
    
    public void getNonProductivePPL(){
        StaffController sc = new StaffController();
        super.setpStmt("select top 10 count(distinct taskid) as count, assigneeid from systemlog where logtype='complete' group by assigneeid order by count asc");
        ResultSet rs = super.execute();
        try{
            rs.last();
            if(rs.getRow() >= 10){
                rs.first();
                while(rs.next()){
                    Staff s = sc.getStaff(rs.getInt("assigneeid"));
                    int count = rs.getInt("count");
                    dashboard.getNon_productive_ppl().put(s, count);
                }
            }
        }catch(SQLException e){}
    }
}
