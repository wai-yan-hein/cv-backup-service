/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.backup.backup.schedule;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @author Lenovo
 */
@Component
@PropertySource(value = {"file:config/application.properties"})
public class InvScheduled {

    private static final Logger log = LoggerFactory.getLogger(InvScheduled.class);
    @Value("${inv.username}")
    private String username;
    @Value("${inv.password}")
    private String password;
    @Value("${inv.host}")
    private String host;
    @Value("${inv.name}")
    private String dbName;
    @Value("${inv.output.path}")
    private String outputPath;
    @Value("${inv.backup.enabled:false}")
    private boolean enabled;

    public InvScheduled() {
    }

    @Scheduled(fixedRate = 60000 * 60)
    private void reportCurrentTime() {
        if (enabled) {
            log.info("Inventory Backup Start." + new Date());
            String path = outputPath + "//" + getFileName();
            log.info(String.format("Output Path : %s", path));
            String format = "mysqldump -u" + username + " -p" + password + " -h" + host + " --routines --single-transaction=TRUE " + dbName + " > " + path + "";
            try {
                log.info(format);
                Process exec = Runtime.getRuntime().exec(new String[]{"cmd.exe", "/c", format});
                exec.waitFor();
                log.info("Inventory Backup End." + new Date());
                ZipFile.zipFiles(path, getFileName());
            } catch (IOException | InterruptedException ex) {
                log.error("Inventory Backup Error :" + ex.getMessage());
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
}
