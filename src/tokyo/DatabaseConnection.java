/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tokyo;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Orlandi
 */
public class DatabaseConnection {

    private static DatabaseConnection databaseConnection;
    
    private String ip;
    private String port;
    private String sid;
    private String username;
    private String password;
    
    private DatabaseConnection() {
        ip = "grad.icmc.usp.br";
        port = "15215";
        sid = "orcl";
        username = "8077925";
        password = "";
    }
    
    public static DatabaseConnection getInstance() {
        if(databaseConnection == null) {
            databaseConnection = new DatabaseConnection();
        }
        
        return databaseConnection;
    }
    
    public Statement getStatement() throws SQLException {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException ex) {
            System.err.println("Get statement fail: " + ex.getMessage());
        }
        
        java.sql.Connection connection = DriverManager.getConnection(
                "jdbc:oracle:thin:@" + ip + ":" + port + ":" + sid,
                username, password);

        //showConnection();

        return connection.createStatement();
    }
    
    public void showConnection() {
        System.err.println("Connected to: "
                    + "jdbc:oracle:thin:@" + ip + ":" + port + ":" + sid
                    + "\nUsername: " + username + "\n");
    }
    
    public ResultSet select(String script) throws SQLException {
        Statement statement = DatabaseConnection.getInstance().getStatement();
        
        return statement.executeQuery(script);
    }
    
    public void insertUpdateDelete(String script) throws SQLException {
        Statement statement = DatabaseConnection.getInstance().getStatement();
        
        statement.executeUpdate(script);
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
