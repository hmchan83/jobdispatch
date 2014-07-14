package beanController;

import bean.Dashboard;
import bean.Priority;
import bean.Staff;
import bean.Task;
import bean.TaskType;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Joseph
 */
public class DashboardController extends BeanController {

    private Dashboard dashboard;

    public DashboardController() {
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
        getUnresolvedTotal();
        getResolvedTotal();
    }

    public Dashboard getDashboard() {
        return dashboard;
    }

    public void getHighWorkloadPPL() {
        StaffController sc = new StaffController();
        HashMap temp = new HashMap();
        super.setpStmt("select top 10 count(*) as count, assigneeid from task where (statusid=1 or statusid=2) group by assigneeid order by count(*) desc");
        ResultSet rs = super.execute();
        try {
            while (rs.next()) {
                int count = rs.getInt("count");
                Staff assignee = sc.getStaff(rs.getInt("assigneeid"));
                temp.put(assignee, count);
            }
        } catch (SQLException e) {
        }
        dashboard.setHigh_workload_ppl(sortByValues(temp, true));
    }

    public void getLowWorkloadPPL() {
        StaffController sc = new StaffController();
        HashMap temp = new HashMap();
        super.setpStmt("select top 10 count(*) as count, assigneeid from task where (statusid=1 or statusid=2) group by assigneeid order by count(*) asc");
        ResultSet rs = super.execute();
        try {
            rs.last();
            if (rs.getRow() <= 10) {
                rs.first();
                while (rs.next()) {
                    int count = rs.getInt("count");
                    Staff assignee = sc.getStaff(rs.getInt("assigneeid"));
                    temp.put(assignee, count);
                }
            }
        } catch (SQLException e) {
        }
        dashboard.setLow_workload_ppl(sortByValues(temp));
    }

    public void getUrgentTasks() {
        TaskController tc = new TaskController();
        HashMap temp = new HashMap();
        super.setpStmt("select top 10 s.taskid, s.date from systemlog s, task t where logType='create' and not exists(select * from systemlog u where s.taskid = u.taskid and (logtype='start' or logtype='complete')) and s.taskid=t.taskid order by t.priorityid asc, s.date asc");
        ResultSet rs = super.execute();
        try {
            while (rs.next()) {
                Task t = tc.getTaskDetail(rs.getInt("taskid"));
                long diff = (new Date().getTime() - ((Date) rs.getObject("date")).getTime()) / (1000 * 60 * 60 * 24);
                temp.put(t, diff);
            }
        } catch (SQLException e) {
        }
        dashboard.setUrgent_tasks(sortByValues(temp, true));
    }

    public void getUnresolvedType() {
        TaskTypeController ttc = new TaskTypeController();
        HashMap temp = new HashMap();
        super.setpStmt("SELECT TaskType.typeid, IsNull(Temp.TempCount,0) AS count From TaskType Left Join (select count(*) as TempCount, typeid from task where (statusid=1 or statusid=2 or statusid=3) group by typeid ) Temp On TaskType.TypeID=Temp.TypeID order by count desc");
        ResultSet rs = super.execute();
        try {
            while (rs.next()) {
                TaskType t = ttc.getTaskType(rs.getInt("typeid"));
                int count = rs.getInt("count");
                temp.put(t, count);
            }
        } catch (SQLException e) {
        }
        dashboard.setUnresolved_type(sortByValues(temp, true));
    }

    public void getUnresolvedPriority() {
        PriorityController pc = new PriorityController();
        HashMap temp = new HashMap();
        super.setpStmt("SELECT TaskPriority.priorityid, IsNull(Temp.TempCount,0) AS count FROM TaskPriority Left Join (SELECT COUNT(*) AS TempCount, PriorityID FROM task WHERE (statusid=1 or statusid=2 or statusid=3) GROUP BY PriorityID) Temp ON TaskPriority.PriorityID=Temp.PriorityID ORDER BY count DESC");
        ResultSet rs = super.execute();
        try {
            while (rs.next()) {
                Priority p = pc.getPriority(rs.getInt("priorityid"));
                int count = rs.getInt("count");
                temp.put(p, count);
            }
        } catch (SQLException e) {
        }
        dashboard.setUnresolved_priority(sortByValues(temp, true));
    }

    public void getResolvedType() {
        TaskTypeController ttc = new TaskTypeController();
        HashMap temp = new HashMap();
        super.setpStmt("SELECT TaskType.typeid, IsNull(Temp.TempCount,0) AS count From TaskType Left Join (select count(*) as TempCount, typeid from task where (statusid=4 or statusid=7) group by typeid ) Temp On TaskType.TypeID=Temp.TypeID order by count desc");
        ResultSet rs = super.execute();
        try {
            while (rs.next()) {
                TaskType t = ttc.getTaskType(rs.getInt("typeid"));
                int count = rs.getInt("count");
                temp.put(t, count);
            }
        } catch (SQLException e) {
        }
        dashboard.setResolved_type(sortByValues(temp, true));
    }

    public void getResolvedPriority() {
        PriorityController pc = new PriorityController();
        HashMap temp = new HashMap();
        super.setpStmt("SELECT TaskPriority.priorityid, IsNull(Temp.TempCount,0) AS count FROM TaskPriority Left Join (SELECT COUNT(*) AS TempCount, PriorityID FROM task WHERE (statusid=4 or statusid=7) GROUP BY PriorityID) Temp ON TaskPriority.PriorityID=Temp.PriorityID ORDER BY count desc");
        ResultSet rs = super.execute();
        try {
            while (rs.next()) {
                Priority p = pc.getPriority(rs.getInt("priorityid"));
                int count = rs.getInt("count");
                temp.put(p, count);
            }
        } catch (SQLException e) {
        }
        dashboard.setResolved_priority(sortByValues(temp, true));
    }

    public void getProductivePPL() {
        StaffController sc = new StaffController();
        HashMap temp = new HashMap();
        super.setpStmt("select top 10 count(distinct taskid) as count, assigneeid from systemlog where logtype='complete' group by assigneeid order by count desc");
        ResultSet rs = super.execute();
        try {
            while (rs.next()) {
                Staff s = sc.getStaff(rs.getInt("assigneeid"));
                int count = rs.getInt("count");
                temp.put(s, count);
            }
        } catch (SQLException e) {
        }
        dashboard.setProductive_ppl(sortByValues(temp, true));
    }

    public void getNonProductivePPL() {
        StaffController sc = new StaffController();
        HashMap temp = new HashMap();
        super.setpStmt("select top 10 count(distinct taskid) as count, assigneeid from systemlog where logtype='complete' group by assigneeid order by count asc");
        ResultSet rs = super.execute();
        try {
            rs.last();
            if (rs.getRow() >= 10) {
                rs.first();
                while (rs.next()) {
                    Staff s = sc.getStaff(rs.getInt("assigneeid"));
                    int count = rs.getInt("count");
                    temp.put(s, count);
                }
            }
        } catch (SQLException e) {
        }
        dashboard.setNon_productive_ppl(sortByValues(temp));
    }

    public void getUnresolvedTotal() {
        super.setpStmt("select count(*) as count from task where statusid=1 or statusid=2 or statusid=3");
        ResultSet rs = super.execute();
        try {
            if (rs.next()) {
                dashboard.setTotal_unresolved_tasks(rs.getInt("count"));
            }
        } catch (Exception e) {
        }
    }

    public void getResolvedTotal() {
        super.setpStmt("select count(*) as count from task where statusid=4 or statusid=7");
        ResultSet rs = super.execute();
        try {
            if (rs.next()) {
                dashboard.setTotal_resolved_tasks(rs.getInt("count"));
            }
        } catch (Exception e) {
        }
    }

    private HashMap sortByValues(HashMap map) {
        List list = new LinkedList(map.entrySet());
        // Defined Custom Comparator here
        Collections.sort(list, new Comparator() {
            public int compare(Object o1, Object o2) {
                return ((Comparable) ((Map.Entry) (o1)).getValue())
                        .compareTo(((Map.Entry) (o2)).getValue());
            }
        });

       // Here I am copying the sorted list in HashMap
        // using LinkedHashMap to preserve the insertion order
        HashMap sortedHashMap = new LinkedHashMap();
        for (Iterator it = list.iterator(); it.hasNext();) {
            Map.Entry entry = (Map.Entry) it.next();
            sortedHashMap.put(entry.getKey(), entry.getValue());
        }
        return sortedHashMap;
    }

    public HashMap sortByValues(HashMap map, boolean desc) {
        List list = new LinkedList(map.entrySet());
        // Defined Custom Comparator here
        Collections.sort(list, new Comparator() {
            public int compare(Object o1, Object o2) {
                return ((Comparable) ((Map.Entry) (o1)).getValue())
                        .compareTo(((Map.Entry) (o2)).getValue()) * -1;
            }
        });

       // Here I am copying the sorted list in HashMap
        // using LinkedHashMap to preserve the insertion order
        HashMap sortedHashMap = new LinkedHashMap();
        for (Iterator it = list.iterator(); it.hasNext();) {
            Map.Entry entry = (Map.Entry) it.next();
            sortedHashMap.put(entry.getKey(), entry.getValue());
        }
        return sortedHashMap;
    }
}
