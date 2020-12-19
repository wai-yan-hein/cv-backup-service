/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.backup.backup.schedule;

import java.io.IOException;
import java.util.Date;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 *
 * @author Lenovo
 */
@Component
public class ScheduledTasks{

    private static final Logger log = LoggerFactory.getLogger(ScheduledTasks.class);
    @Value("${db.username}")
    String username;
    @Value("${db.password}")
    String password;
    @Value("${db.host}")
    String host;
    @Value("${db.name}")
    String dbName;
    @Value("${output.path}")
    String outpuPath;

    @Scheduled(cron = "${crossExp}")
    public void reportCurrentTime() {
        String backupScript = "mysqldump -u" + username + " -p" + password + " -h" + host + " --routines " + dbName + " >" + outpuPath + "";
        try {
            log.info(backupScript);
            log.info("Backup Start." + new Date().toString());
            Runtime.getRuntime().exec(new String[]{"cmd.exe", "/c", backupScript});
            log.info("Backup End." + new Date().toString());
        } catch (IOException ex) {
            log.error("Backup Error :" + ex.getMessage());
        }
    }
}
