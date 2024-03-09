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
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

/**
 * @author Wai Yan
 */
public class Zip {

    private static final Logger log = LoggerFactory.getLogger(Zip.class);
    private static final char[] password = {'c', 'o', 'r', 'e', 'v', 'a', 'l', 'u', 'e'};

    public static void zip(String localPath) {
        log.info("Zip Start.");
        log.info(localPath);
        exportLocal(localPath);
        exportBackup(localPath);
        log.info("Zip End.");
    }

    private static void exportLocal(String localPath) {
        checkAndClean(localPath);
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
            if (letter != null) {
                String cp = getProgramPartition();
                if (checkPartitionGB(root)) {
                    if (!letter.contains(cp)) {
                        try {
                            String filePath = root.getPath() + "CoreValue/" + localPath;
                            Path path = FileSystems.getDefault().getPath(filePath);
                            filePath = path.toString();
                            String zipFile;
                            if (filePath.endsWith(".sql")) {
                                zipFile = filePath.replace(".sql", ".zip");
                            } else {
                                zipFile = filePath + ".zip"; // Append .zip if .sql is not found
                            }
                            createPath(filePath);
                            checkAndClean(filePath);
                            ZipFile f = new ZipFile(zipFile, password);
                            f.addFile(file, zipParameter());
                            f.close();
                        } catch (Exception e) {
                            log.error("exportBackup : " + e.getMessage());
                        }
                    }
                }
            }

        }
        file.delete();
    }

    private static void checkAndClean(String path) {
        int gb = freeSpace(path);
        if (gb > 0 && gb <= 3) {
            List<File> listFile = getSmallestDateFiles(path);
            if (listFile.size() > 1) {
                listFile.forEach(file -> {
                    log.info("delete file : " + file.getPath());
                    deleteFolder(file.getPath());
                });
            }
        }
    }

    private static boolean checkPartitionGB(File file) {
        int gb = bytesToGB(file.getTotalSpace());
        return gb >= 100;
    }

    private static int freeSpace(String path) {
        Path p = findBackupFolder(path);
        File file = p.toFile();
        if (file.exists()) {
            return bytesToGB(file.getFreeSpace());
        }
        return -1;
    }

    private static void createPath(String path) {
        File file = new File(path);
        File parentDirectory = file.getParentFile();
        if (!parentDirectory.exists()) {
            parentDirectory.mkdirs();
        }
        updateParentDirectories(file);
    }

    private static String getPartitionLetter(File root) {
        if (isWindow()) {
            String path = root.getAbsolutePath();
            if (path.length() >= 2 && path.charAt(1) == ':') {
                return String.valueOf(path.charAt(0));
            }
        }
        return null;
    }

    private static boolean isWindow() {
        return System.getProperty("os.name").toLowerCase().contains("win");
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

    private static Path findBackupFolder(String pathString) {
        Path path = Paths.get(pathString).normalize(); // Normalize the path to handle . and
        while (path != null && !path.endsWith("backup")) {
            path = path.getParent();
        }
        return path;
    }

    private static List<File> getSmallestDateFiles(String folderPath) {
        Path rootPath = findBackupFolder(folderPath);
        String rootDir = rootPath.toString();
        log.warn("insufficient memory detected : " + rootDir);
        File folder = new File(rootDir);
        File[] files = folder.listFiles();
        if (files == null) {
            throw new IllegalArgumentException("Invalid folder path or empty folder.");
        }
        List<File> dateFiles = new ArrayList<>();
        Arrays.sort(files, Comparator.comparing(File::lastModified));

        for (File file : files) {
            if (dateFiles.size() < 3) {
                dateFiles.add(file);
            } else {
                long currentFileTime = file.lastModified();
                File lastFile = dateFiles.getLast();
                long lastFileTime = lastFile.lastModified();
                if (currentFileTime < lastFileTime) {
                    dateFiles.remove(lastFile);
                    dateFiles.add(file);
                }
            }
        }
        return dateFiles;
    }

    private static void deleteFolder(String path) {
        File folder = new File(path);
        if (folder.exists()) {
            File[] files = folder.listFiles();
            if (files != null) {
                for (File file : files) {
                    if (file.isDirectory()) {
                        deleteFolder(file.getPath());
                    } else {
                        file.delete();
                    }
                }
            }
            folder.delete();
            log.info("Folder deleted successfully.");
        } else {
            log.error("Folder does not exist.");
        }
    }
}
