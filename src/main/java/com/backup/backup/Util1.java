package com.backup.backup;

import com.backup.backup.schedule.BackupScheduler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class Util1 {
    private static final Logger log = LoggerFactory.getLogger(Util1.class);

    public static boolean getBoolean(String obj) {
        if (!Objects.isNull(obj)) {
            return obj.equals("1") || obj.equalsIgnoreCase("true");
        }
        return false;
    }

    public static List<String> getSchemeList(String host,String username, String password) {
        String jdbcUrl = "jdbc:mariadb://"+host+":3306/";
        List<String> schemaList = new ArrayList<>();
        try {
            Connection connection = DriverManager.getConnection(jdbcUrl, username, password);
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SHOW DATABASES LIKE 'cv%'");

            while (resultSet.next()) {
                schemaList.add(resultSet.getString(1));
            }
            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            log.error("getSchemeList : " + e.getMessage());
        }
        return schemaList;
    }
    public static boolean isNullOrEmpty(Object obj) {
        return obj == null || obj.toString().isEmpty();
    }


}
