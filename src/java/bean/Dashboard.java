package bean;

import java.util.TreeMap;

/**
 *
 * @author Joseph
 */
public class Dashboard {
    private int total_resolved_tasks;
    private int total_unresolved_tasks;
    private TreeMap high_workload_ppl;
    private TreeMap low_workload_ppl;
    private TreeMap urgent_tasks;
    private TreeMap resolved_priority;
    private TreeMap unresolved_priority;
    private TreeMap resolved_type;
    private TreeMap unresolved_type;
    private TreeMap productive_ppl;
    private TreeMap non_productive_ppl;

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
    
    public TreeMap getHigh_workload_ppl() {
        return high_workload_ppl;
    }

    public void setHigh_workload_ppl(TreeMap high_workload_ppl) {
        this.high_workload_ppl = high_workload_ppl;
    }

    public TreeMap getLow_workload_ppl() {
        return low_workload_ppl;
    }

    public void setLow_workload_ppl(TreeMap low_workload_ppl) {
        this.low_workload_ppl = low_workload_ppl;
    }

    public TreeMap getUrgent_tasks() {
        return urgent_tasks;
    }

    public void setUrgent_tasks(TreeMap urgent_tasks) {
        this.urgent_tasks = urgent_tasks;
    }

    public TreeMap getResolved_priority() {
        return resolved_priority;
    }

    public void setResolved_priority(TreeMap resolved_priority) {
        this.resolved_priority = resolved_priority;
    }

    public TreeMap getUnresolved_priority() {
        return unresolved_priority;
    }

    public void setUnresolved_priority(TreeMap unresolved_priority) {
        this.unresolved_priority = unresolved_priority;
    }

    public TreeMap getResolved_type() {
        return resolved_type;
    }

    public void setResolved_type(TreeMap resolved_type) {
        this.resolved_type = resolved_type;
    }

    public TreeMap getUnresolved_type() {
        return unresolved_type;
    }

    public void setUnresolved_type(TreeMap unresolved_type) {
        this.unresolved_type = unresolved_type;
    }

    public TreeMap getProductive_ppl() {
        return productive_ppl;
    }

    public void setProductive_ppl(TreeMap productive_ppl) {
        this.productive_ppl = productive_ppl;
    }

    public TreeMap getNon_productive_ppl() {
        return non_productive_ppl;
    }

    public void setNon_productive_ppl(TreeMap non_productive_ppl) {
        this.non_productive_ppl = non_productive_ppl;
    }
   
}
