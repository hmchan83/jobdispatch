package bean;

import java.util.HashMap;

/**
 *
 * @author Joseph
 */
public class Dashboard {
    private int total_resolved_tasks;
    private int total_unresolved_tasks;
    private HashMap high_workload_ppl;
    private HashMap low_workload_ppl;
    private HashMap urgent_tasks;
    private HashMap resolved_priority;
    private HashMap unresolved_priority;
    private HashMap resolved_type;
    private HashMap unresolved_type;
    private HashMap productive_ppl;
    private HashMap non_productive_ppl;
    
    public Dashboard(){
        high_workload_ppl = new HashMap<Staff, Integer>();
        low_workload_ppl = new HashMap<Staff, Integer>();
        urgent_tasks = new HashMap<Task, Long>();
        resolved_priority = new HashMap<Priority, Integer>();
        unresolved_priority = new HashMap<Priority, Integer>();
        resolved_type = new HashMap<TaskType, Integer>();
        unresolved_type = new HashMap<TaskType, Integer>();
        productive_ppl = new HashMap<Staff, Integer>();
        non_productive_ppl = new HashMap<Staff, Integer>();
    }

    public int getTotal_resolved_tasks() {
        return total_resolved_tasks;
    }

    public void setTotal_resolved_tasks(int total_resolved_tasks) {
        this.total_resolved_tasks = total_resolved_tasks;
    }

    public int getTotal_unresolved_tasks() {
        return total_unresolved_tasks;
    }

    public void setTotal_unresolved_tasks(int total_unresolved_tasks) {
        this.total_unresolved_tasks = total_unresolved_tasks;
    }
    
    public HashMap getHigh_workload_ppl() {
        return high_workload_ppl;
    }

    public void setHigh_workload_ppl(HashMap high_workload_ppl) {
        this.high_workload_ppl = high_workload_ppl;
    }

    public HashMap getLow_workload_ppl() {
        return low_workload_ppl;
    }

    public void setLow_workload_ppl(HashMap low_workload_ppl) {
        this.low_workload_ppl = low_workload_ppl;
    }

    public HashMap getUrgent_tasks() {
        return urgent_tasks;
    }

    public void setUrgent_tasks(HashMap urgent_tasks) {
        this.urgent_tasks = urgent_tasks;
    }

    public HashMap getResolved_priority() {
        return resolved_priority;
    }

    public void setResolved_priority(HashMap resolved_priority) {
        this.resolved_priority = resolved_priority;
    }

    public HashMap getUnresolved_priority() {
        return unresolved_priority;
    }

    public void setUnresolved_priority(HashMap unresolved_priority) {
        this.unresolved_priority = unresolved_priority;
    }

    public HashMap getResolved_type() {
        return resolved_type;
    }

    public void setResolved_type(HashMap resolved_type) {
        this.resolved_type = resolved_type;
    }

    public HashMap getUnresolved_type() {
        return unresolved_type;
    }

    public void setUnresolved_type(HashMap unresolved_type) {
        this.unresolved_type = unresolved_type;
    }

    public HashMap getProductive_ppl() {
        return productive_ppl;
    }

    public void setProductive_ppl(HashMap productive_ppl) {
        this.productive_ppl = productive_ppl;
    }

    public HashMap getNon_productive_ppl() {
        return non_productive_ppl;
    }

    public void setNon_productive_ppl(HashMap non_productive_ppl) {
        this.non_productive_ppl = non_productive_ppl;
    }
   
}
