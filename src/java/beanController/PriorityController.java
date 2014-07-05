/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package beanController;

import bean.Priority;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Marcus
 */
public class PriorityController extends BeanController{
    
        private static ArrayList<Priority> priorityList=null;
    
    public PriorityController(){
        super();
        priorityList = new ArrayList<>();
        try{
            super.setpStmt("SELECT StatusID, StatusName FROM TaskStatus Order By StatusID");
            ResultSet rs=super.getpStmt().executeQuery();
            Priority tmp = new Priority();
            while(rs.next()){
                    tmp.setPriorityID(rs.getInt(1));
                    tmp.setPriorityName(rs.getString(2));
                    priorityList.add(tmp);
            }
        }catch (SQLException ex){
            super.error(ex);
        }
    }
    
    public ArrayList<Priority> getPriorityList(){
        return PriorityController.priorityList;
    }
    
    public Priority getPriority(int ID){
        for(Priority t : priorityList){
            if(t.getPriorityID()==ID){
                return t;
            }
        }
        return null;
    }
    
    public void addPriority(Priority priority){
        try{
            super.setpStmt("Insert INTO TaskStatus (StatusID,StatusName) VALUES (?,?)");
            super.getpStmt().setInt(1, priority.getPriorityID());
            super.getpStmt().setString(2, priority.getPriorityName());
            super.getpStmt().executeUpdate();
            priorityList.add(priority);
        }catch (SQLException ex){
            super.error(ex);
        }
        
    }
    
    public void addPriority(String Name){
        try{
            super.setpStmt("Insert INTO TaskStatus (StatusName) VALUES (?)");
            super.getpStmt().setString(1, Name);
            super.getpStmt().executeUpdate();
            Priority NewPriority = new Priority();
            ResultSet insertedID = super.getpStmt().getGeneratedKeys();
            if (insertedID.next()) {
                NewPriority.setPriorityID(insertedID.getInt(1));
                NewPriority.setPriorityName(Name);
                priorityList.add(NewPriority);
            }
        }catch (SQLException ex){
            super.error(ex);
        }
    }
    
    //Lazy
    public Priority get(int ID){return getPriority(ID);}
    public void add(Priority priority){addPriority(priority);}
    public void add(String name){addPriority(name);}
    
    
}
