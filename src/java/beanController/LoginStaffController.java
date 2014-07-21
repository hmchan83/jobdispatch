package beanController;

import bean.LoginStaff;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

/**
 *
 * @author Marcus
 */
public class LoginStaffController extends BeanController{
    
    private LoginStaff currentUser;
    
    public LoginStaffController(){
        super();
        currentUser = null;
    }
    
    public LoginStaffController(LoginStaff user){
        super();
        currentUser = user;
    }
    
    public boolean Verify(String username, String pw){
        try{
            super.setpStmt("SELECT StaffID, RealName, Username, Pwd, RoleID, DeptID, Email, ContactNumber FROM Staff Where Username = ?");
            super.getpStmt().setString(1, username);
            ResultSet rs= super.execute();
            if(rs.next()){
                if(pw.equals(rs.getString(4))){
                    UserRoleController rolecon = new UserRoleController();
                    DepartmentController deptcon = new DepartmentController();
                    LoginStaff tmp = new LoginStaff();
                    tmp.setStaffID(rs.getInt(1));
                    tmp.setUserName(rs.getString(3));
                    tmp.setRealName(rs.getString(2));
                    tmp.setRole(rolecon.getRole(rs.getInt(5)));
                    tmp.setDept(deptcon.getDept(rs.getInt(6)));
                    tmp.seteMail(rs.getString(7));
                    tmp.setTel(rs.getInt(8));
                    tmp.setPassword(rs.getString(4));
                    this.currentUser = tmp;
                    return true;                    
                }
                return false;                
            }           
        }catch (SQLException ex){
            return false;
        }
        return false;
    }
    
    public boolean VerifyAdmin(String username, String pw){
        if(Verify(username, pw) && this.currentUser != null){
            return currentUser.getRole().getRoleName().toLowerCase().equals("admin");
        }
        return false;
    }
    
    public LoginStaff getUser(){
        return currentUser;
    }
    
    public LoginStaff getStaff(int id){
        LoginStaff s = new LoginStaff();
        super.setpStmt("SELECT top 1 * FROM Staff where StaffId = ?");
        try {
            super.getpStmt().setInt(1, id);
            ResultSet rs = super.execute();
            if (rs.next()) {
                UserRoleController roleCon = new UserRoleController();
                s.setStaffID(rs.getInt("StaffID"));
                s.setRealName(rs.getString("RealName"));
                s.setUserName(rs.getString("Username"));
                s.setPassword(rs.getString("Pwd"));
                s.setRole(roleCon.getRole(rs.getInt("RoleID")));
                s.setDept(new DepartmentController().getDept(rs.getInt("DeptID")));
                s.seteMail(rs.getString("Email"));
                s.setTel(rs.getInt("ContactNumber"));
                s.setRetired(rs.getBoolean("Retired"));
            }
            return s;
        } catch (SQLException ex) {
            return null;
        }
    }
    
    public LoginStaff get(){
        return this.getUser();
    }
    
    public void clear(){
        currentUser=null;
    }
    
    public boolean updateStaffByMap(Map<String, String[]> map){
        String SQL = "Update STAFF SET";
        boolean hasSetter = false;
        String staffid = map.get("staffid")[0];
        for (Map.Entry<String, String[]> entry : map.entrySet()) {
            if (!(entry.getValue().length == 0 || entry.getValue()[0].equals("")) && !(entry.getKey().equals("staffid") || entry.getKey().equals("username"))) {
                SQL = addSetter(SQL, entry.getKey());
                hasSetter = true;
            }
        }
        SQL += " where staffID = ?";
        super.setpStmt(SQL);
        try {
            if (hasSetter) {
                int counter = 1;
                for (Map.Entry<String, String[]> entry : map.entrySet()) {
                    if (!(entry.getValue().length == 0 || entry.getValue()[0].equals("")) && !(entry.getKey().equals("staffid") || entry.getKey().equals("username"))) {
                        super.getpStmt().setString(counter, entry.getValue()[0]);
                        counter++;
                    }
                }
                super.getpStmt().setString(counter, staffid);
            }
            return super.executeUpdate();
        } catch (SQLException e) {
            return false;
        }
    }
    
    public String addSetter(String SQL, String key) {
        String temp = SQL.toLowerCase();
        boolean hadSet = temp.contains("?");
        if (hadSet) {
            temp += ", " + key + " = ?";
        } else {
            temp += " " + key + " = ?";
        }
        return temp;
    }
}
