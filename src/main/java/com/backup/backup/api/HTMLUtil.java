package com.backup.backup.api;

import com.backup.backup.schedule.BackupScheduler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.awt.*;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class HTMLUtil {
    private static final Logger log = LoggerFactory.getLogger(HTMLUtil.class);

    public static String generateHtml(String errorMessage) {
        return String.format("<html><body><p>%s</p></body></html>", errorMessage);
    }

    public static File createHtmlFile(String content, String fileName) throws IOException {
        File file = new File(fileName);
        FileWriter writer = new FileWriter(file);
        writer.write(content);
        writer.close();
        return file;
    }
    public static void openHtmlFile(File htmlFile) throws IOException {
        Desktop desktop = Desktop.getDesktop();
        desktop.open(htmlFile);
    }
    public static void showMessage() {
        String errorMessage = "We regret to inform you that there's an issue with exporting data backups. Your data remains safe, but we need your help to address this issue promptly. Please contact our service team immediately to ensure your data is properly backed up and secure. Thank you for your cooperation.";

        try {
            String htmlContent = generateHtml(errorMessage);
            File htmlFile = createHtmlFile(htmlContent, "error_message.html");
            openHtmlFile(htmlFile);
        } catch (IOException e) {
            log.error(e.getMessage());
        }
    }
}
