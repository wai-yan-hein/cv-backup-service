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
import java.util.*;

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
    @Value("${company.name}")
    private String compName;
    @Value("${db.list:}")
    private String dbList;
    @Autowired
    private Environment environment;

    public BackupScheduler() {
    }

    @Scheduled(fixedRate = 30 * 60 * 1000)
    private void reportCurrentTime() {
        host += ",";
        String[] listHost = host.split(",");
        String[] listDB = dbList.contains(",") ? dbList.split(",") : new String[]{dbList};
        listDB = Arrays.stream(listDB)
                .filter(s -> !s.isEmpty())
                .toArray(String[]::new);
        Set<String> mergedSet = new HashSet<>(List.of(listDB));

        for (String h : listHost) {
            if (!Util1.isNullOrEmpty(h)) {
                List<String> listSch = Util1.getSchemeList(h, username, password);
                mergedSet.addAll(listSch);
                List<String> list = new ArrayList<>(mergedSet);
                list.forEach(db -> {
                    log.info(String.format("%s backup start.", db));
                    if (!Objects.isNull(db)) {
                        String sql = getSql(h, db, getLocalPath(db));
                        dump(sql, getLocalPath(db), db);
                    }
                });
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


    private String getSql(String host, String db, String path) {
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
        int tmp = Integer.parseInt(minute);
        tmp = tmp <= 30 ? 30 : 60;
        return String.valueOf(tmp);
    }

}
