package beanController;

import bean.*;
import java.sql.*;
import java.util.ArrayList;

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
            this.pStmt = con.prepareStatement(pStmt, Statement.RETURN_GENERATED_KEYS);
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

    public boolean executeUpdate() {
        try {
            int affectedrow = this.pStmt.executeUpdate();
            if (affectedrow <= 0) {
                return false;
            }
            return true;
        } catch (SQLException ex) {
            error(ex);
            return false;
        }
    }

    public ArrayList executeStmt(String sql) {
        ArrayList<ArrayList<String>> result = new ArrayList<>();
        ResultSet temp;
        ResultSetMetaData rsmd;
        int rowCount = 0, columnCount;
        try {
            Statement s = con.createStatement();
            temp = s.executeQuery(sql);
            rsmd = temp.getMetaData();
            columnCount = rsmd.getColumnCount();
            result.add(new ArrayList<String>());
            for (int i = 0; i < columnCount; i++) {
                result.get(0).add(rsmd.getColumnLabel(i + 1));
            }
            while (temp.next()) {
                rowCount++;
                result.add(new ArrayList<String>());
                for (int i = 1; i <= columnCount; i++) {
                    result.get(rowCount).add(temp.getString(i));
                }
            }
            return result;
        } catch (SQLException e) {
        }

        return null;
    }

    public int executeStmtUpdate(String sql) {
        try {
            Statement s = con.createStatement();
            return s.executeUpdate(sql);
        }catch(SQLException e){
            return 0;
        }
    }

}
