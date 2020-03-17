package DAO;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public abstract class DAOOject {
    static Properties properties;

    protected static Connection getConnection() {
        Connection conn = null;
        Properties pro = getInfoProperties();
        String host = pro.getProperty("host");
        String username = pro.getProperty("username");
        String password = pro.getProperty("password");
        String database_name = pro.getProperty("database_name");
        String url = host + database_name + "?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
        System.out.println("url"+url);
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(url, username, password);

        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }


    private static Properties getInfoProperties() {
        if (properties == null) {
            try {
                InputStream in = new FileInputStream("C:\\Users\\ADMIN\\IdeaProjects\\managementHotel\\System_Parameter.properties");
                properties = new Properties();
                properties.load(in);
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return properties;
    }

    public static void main(String[] args) {
       Connection conn= getConnection();
       if(conn!=null){
           System.out.println("thanh cong");
       }
    }
}
