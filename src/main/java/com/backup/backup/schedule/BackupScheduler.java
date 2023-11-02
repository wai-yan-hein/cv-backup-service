/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.backup.backup.schedule;

import com.backup.backup.Util1;
import com.backup.backup.service.EmailService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Objects;

/**
 * @author Lenovo
 */
@Component
@PropertySource(value = {"file:config/application.properties"})
public class BackupScheduler {

    private static final Logger log = LoggerFactory.getLogger(BackupScheduler.class);
    @Autowired
    private EmailService emailService;
    @Value("${db.user}")
    private String username;
    @Value("${db.password}")
    private String password;
    @Value("${db.host}")
    private String host;
    @Value("${db.list}")
    private String dbList;
    @Value("${company.name}")
    private String compName;
    @Value("${backup.google}")
    private String backupGoogle;
    @Autowired
    private Environment environment;
    private final GoogleDrive drive = new GoogleDrive();

    public BackupScheduler() {
    }

    @Scheduled(fixedRate = 15 * 60 * 1000)
    private void reportCurrentTime() {
        if (!dbList.isEmpty()) {
            if (dbList.contains(",")) {
                String[] list = dbList.split(",");
                for (String db : list) {
                    log.info(String.format("%s backup start.", db));
                    if (!Objects.isNull(db)) {
                        String sql = getSql(db, getLocalPath(db));
                        dump(sql, getLocalPath(db), db);
                    }
                }
            } else if (dbList.equals("*")) {
                log.info("all database backup mode on.");
                List<String> list = Util1.getSchemeList(host, username, password);
                list.forEach(db -> {
                    log.info(String.format("%s backup start.", db));
                    if (!Objects.isNull(db)) {
                        String sql = getSql(db, getLocalPath(db));
                        dump(sql, getLocalPath(db), db);
                    }
                });
            } else {
                log.info(String.format("%s backup start.", dbList));
                String sql = getSql(dbList, getLocalPath(dbList));
                dump(sql, getLocalPath(dbList), dbList);
            }
        }
    }

    private void dump(String sql, String localPath, String db) {
        try {
            Process exec;
            String os = System.getProperty("os.name").toLowerCase();

            if (os.contains("win")) {  // For Windows
                exec = Runtime.getRuntime().exec(new String[]{"cmd.exe", "/c", sql});
            } else {  // For other operating systems, including CentOS
                exec = Runtime.getRuntime().exec(new String[]{"/bin/bash", "-c", sql});
            }
            exec.waitFor();
            log.info(String.format("%s backup end.", db));
            Zip.zip(localPath);
        } catch (Exception ex) {
            log.error("IOException: " + ex.getMessage());
            emailService.sendErrorMail(compName, ex.getMessage());
        }
    }


    private String getSql(String db, String path) {
        String program = environment.getProperty("program", "mariadb-dump");
        return program + " --host=" + host + " --port=3306 --default-character-set=utf8 --user=" + username + " --password=" + password + " --protocol=tcp --single-transaction=TRUE --routines --events " + db + ">" + path;
    }


    private String getLocalPath(String db) {
        String rootUrl = "backup";
        String filePath = rootUrl + "/" + getDay() + "/" + getHour() + "/" + getMinute() + "/" + db.concat(".sql");
        File file = new File(filePath);
        // Create the directory path if it doesn't exist
        File parentDirectory = file.getParentFile();
        if (!parentDirectory.exists()) {
            parentDirectory.mkdirs();
        }
        return filePath;
    }


    private String getDay() {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd");
        LocalDateTime now = LocalDateTime.now();
        return dtf.format(now).concat("day");
    }

    private String getHour() {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH");
        LocalDateTime now = LocalDateTime.now();
        return dtf.format(now).concat("hour");
    }

    private String getMinute() {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("mm");
        LocalDateTime now = LocalDateTime.now();
        String minute = dtf.format(now);
        char firstDigit = minute.charAt(0);
        return String.valueOf(firstDigit).concat("≈");
    }

}
