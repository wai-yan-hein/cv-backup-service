/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.backup.backup.schedule;

import com.backup.backup.Util1;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Objects;

/**
 * @author Lenovo
 */
@Component
@PropertySource(value = {"file:config/application.properties"})
public class BackupScheduler {

    private static final Logger log = LoggerFactory.getLogger(BackupScheduler.class);
    @Value("${user}")
    private String username;
    @Value("${password}")
    private String password;
    @Value("${host}")
    private String host;
    @Value("${db.list}")
    private String dbList;
    @Value("${output.path}")
    private String outputPath;
    @Value("${company.name}")
    private String compName;
    @Value("${backup.google}")
    private String backupGoogle;
    private final GoogleDrive drive = new GoogleDrive();

    public BackupScheduler() {
    }

    @Scheduled(fixedRate = 60 * 60 * 1000)
    private void reportCurrentTime() {
        if (dbList.contains(",")) {
            String[] list = dbList.split(",");
            for (String db : list) {
                log.info(String.format("%s backup start.", db));
                if (!Objects.isNull(db)) {
                    String directory = outputPath + "//" + db;
                    if (!new File(directory).isDirectory()) {
                        try {
                            Files.createDirectories(Paths.get(directory));
                            log.info(directory + " created.");
                        } catch (IOException e) {
                            log.error(e.getMessage());
                        }
                    }
                    String path = directory + "//" + getFileName();
                    String sql = "mysqldump --host=" + host + " --port=3306 --default-character-set=utf8 --user=" + username + " --password=" + password + " --protocol=tcp --single-transaction=TRUE --routines --events " + db + ">" + path + "";

                    //log.info(sql);
                    try {
                        Process exec = Runtime.getRuntime().exec(new String[]{"cmd.exe", "/c", sql});
                        exec.waitFor();
                        log.info(String.format("%s backup end.", db));
                        Zip.zip(path);
                        uploadToDrive(db, getFileName(), path);
                    } catch (IOException | InterruptedException ex) {
                        log.error(ex.getMessage());
                    }

                }
            }
        }
    }

    private String getFileName() {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH");
        LocalDateTime now = LocalDateTime.now();
        String strHour = dtf.format(now);
        if (strHour.length() == 1) {
            strHour = "0" + strHour;
        }
        strHour = strHour + "-00.sql";
        return strHour;
    }

    private void uploadToDrive(String folderName, String fileName, String path) {
        if (Util1.getBoolean(backupGoogle)) {
            try {
                drive.uploadToGoogleDrive(compName, path, folderName, fileName);
            } catch (IOException e) {
                log.error("uploadToDrive: " + e.getMessage());
            }
        }
    }


}
