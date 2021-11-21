/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.backup.backup.schedule;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

/**
 * @author Lenovo
 */
@Component
@PropertySource(value = {"file:config/application.properties"})
public class AccountScheduled {

    private static final Logger log = LoggerFactory.getLogger(AccountScheduled.class);
    @Value("${acc.username}")
    private String username;
    @Value("${acc.password}")
    private String password;
    @Value("${acc.host}")
    private String host;
    @Value("${acc.name}")
    private String dbName;
    @Value("${acc.output.path}")
    private String outputPath;
    @Value("${acc.backup.enabled:false}")
    private boolean enabled;

    public AccountScheduled() {
    }

    @Scheduled(fixedRate = 60000 * 60)
    private void reportCurrentTime() {
        if (enabled) {
            log.info("Account Backup Start." + new Date());
            String path = outputPath + "//" + getFileName();
            String format = "mysqldump -u" + username + " -p" + password + " -h" + host + " --routines --single-transaction=TRUE " + dbName + " > " + path + "";
            try {
                log.info(format);
                Process exec = Runtime.getRuntime().exec(new String[]{"cmd.exe", "/c", format});
                exec.waitFor();
                log.info("Account Backup End." + new Date());
                ZipFile.zipFiles(path, getFileName());
            } catch (IOException | InterruptedException ex) {
                log.error("Account Backup Error :" + ex.getMessage());
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
