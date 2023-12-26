/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.backup.backup.schedule;

import net.lingala.zip4j.ZipFile;
import net.lingala.zip4j.model.ZipParameters;
import net.lingala.zip4j.model.enums.CompressionLevel;
import net.lingala.zip4j.model.enums.EncryptionMethod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
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

    private static void exportLocal(String localPath) {
        File file = new File(localPath);
        String zipFile = localPath.replace(".sql", ".zip");
        createPath(localPath);
        try {
            ZipFile f = new ZipFile(zipFile, password);
            f.addFile(file, zipParameter());
            f.close();
            updateParentDirectories(file);
        } catch (Exception e) {
            log.error("exportLocal : " + e.getMessage());
        }
    }

    private static void updateParentDirectories(File directory) {
        if (directory != null) {
            directory.setLastModified(System.currentTimeMillis());
            updateParentDirectories(directory.getParentFile());
        }
    }

    private static void exportBackup(String localPath) {
        File[] roots = File.listRoots();
        File file = new File(localPath);
        for (File root : roots) {
            String letter = getPartitionLetter(root);
            String cp = getProgramPartition();
            if (checkPartitionGB(root)) {
                assert letter != null;
                if (!letter.contains(cp)) {
                    try {
                        String filePath = root.getPath() + "CoreValue/" + localPath;
                        Path path = FileSystems.getDefault().getPath(filePath);
                        filePath = path.toString();
                        String zipFile = filePath.replace(".sql", ".zip");
                        createPath(filePath);
                        ZipFile f = new ZipFile(zipFile, password);
                        f.addFile(file, zipParameter());
                        f.close();
                        updateParentDirectories(root);
                    } catch (Exception e) {
                        log.error("exportBackup : " + e.getMessage());
                    }
                }
            }
        }
        file.delete();
    }

    private static boolean checkPartitionGB(File file) {
        int gb = bytesToGB(file.getTotalSpace());
        return gb >= 100;
    }

    private static void createPath(String path) {
        File file = new File(path);
        File parentDirectory = file.getParentFile();
        if (!parentDirectory.exists()) {
            parentDirectory.mkdirs();
        }
    }

    private static String getPartitionLetter(File root) {
        String path = root.getAbsolutePath();
        if (path.length() >= 2 && path.charAt(1) == ':') {
            return String.valueOf(path.charAt(0));
        } else {
            return null; // Not a valid drive letter
        }
    }

    private static ZipParameters zipParameter() {
        ZipParameters param = new ZipParameters();
        param.setEncryptFiles(true);
        param.setCompressionLevel(CompressionLevel.HIGHER);
        param.setEncryptionMethod(EncryptionMethod.AES);
        return param;
    }

    private static String getProgramPartition() {

        Path currentDir = FileSystems.getDefault().getPath("").toAbsolutePath();
        String partitionName = currentDir.getRoot().toString();
        partitionName = partitionName.substring(0, partitionName.length() - 2);
        return partitionName;
    }

    private static int bytesToGB(long bytes) {
        return (int) (bytes / (1024 * 1024 * 1024));

    }
}
