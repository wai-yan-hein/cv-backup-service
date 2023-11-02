/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.backup.backup.schedule;

import com.backup.backup.api.HTMLUtil;
import net.lingala.zip4j.ZipFile;
import net.lingala.zip4j.model.ZipParameters;
import net.lingala.zip4j.model.enums.CompressionLevel;
import net.lingala.zip4j.model.enums.EncryptionMethod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Path;

/**
 * @author Wai Yan
 */
public class Zip {

    private static final Logger log = LoggerFactory.getLogger(Zip.class);
    private static final char[] password = {'c', 'o', 'r', 'e', 'v', 'a', 'l', 'u', 'e'};

    public static void zip(String localPath) {
        log.info("Zip Start.");
        exportLocal(localPath);
        exportBackup(localPath);
        log.info("Zip End.");
    }
    private static void exportLocal(String localPath){
        File file = new File(localPath);
        String zipFile = localPath.replace(".sql", ".zip");
        createPath(localPath);
        try {
            ZipFile f = new ZipFile(zipFile, password);
            f.addFile(file, zipParameter());
            f.close();
        }catch (Exception e){
            log.error("exportLocal : "+e.getMessage());
        }
    }

    private static void exportBackup(String localPath) {
        File[] roots = File.listRoots();
        File file = new File(localPath);
        for (File root : roots) {
            try {
                String filePath = root.getPath() + "CoreValue/" + localPath;
                Path path = FileSystems.getDefault().getPath(filePath);
                filePath = path.toString();
                String zipFile = filePath.replace(".sql", ".zip");
                createPath(filePath);
                ZipFile f = new ZipFile(zipFile, password);
                f.addFile(file, zipParameter());
                f.close();
            } catch (Exception e) {
                log.error("exportBackup : " + e.getMessage());
            }
        }
        file.delete();

    }

    private static void createPath(String path) {
        File file = new File(path);
        File parentDirectory = file.getParentFile();
        if (!parentDirectory.exists()) {
            parentDirectory.mkdirs();
        }
    }

    private static ZipParameters zipParameter() {
        ZipParameters param = new ZipParameters();
        param.setEncryptFiles(true);
        param.setCompressionLevel(CompressionLevel.HIGHER);
        param.setEncryptionMethod(EncryptionMethod.AES);
        return param;
    }
}
