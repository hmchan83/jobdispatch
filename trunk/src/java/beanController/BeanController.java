package beanController;

import java.sql.*;
import bean.*;

/**
 *
 * @author Marcus
 */
public class BeanController {

    private String url = "jdbc:sqlserver://w2ksa.cs.cityu.edu.hk:1433;databaseName=aiad018_db;";
    private String login = "aiad018";
    private String passwd = "aiad018";
    protected Connection con;
    private PreparedStatement pStmt;

    public BeanController() {
        try {
            this.con = DriverManager.getConnection(url, login, passwd);
        } catch (SQLException ex) {
            error(ex);
        }
    }

    public void close() {
        try {
            con.close();
        } catch (SQLException ex) {
            error(ex);
        }
    }

    public void error(Exception ex) {
        System.out.println(ex.getMessage());
    }

    public PreparedStatement getpStmt() {
        return pStmt;
    }

    public void setpStmt(String pStmt) {
        try {
            this.pStmt = con.prepareStatement(pStmt);
        } catch (SQLException ex) {
            error(ex);
        }
    }

    public ResultSet execute() {
        try {
            ResultSet rs = this.pStmt.executeQuery();
            return rs;
        } catch (SQLException ex) {
            error(ex);
            return null;
        }
    }
    
    public void executeUpdate(){
        try{
            this.pStmt.executeUpdate();
        } catch (SQLException ex){
            error(ex);
        }
    }

}
