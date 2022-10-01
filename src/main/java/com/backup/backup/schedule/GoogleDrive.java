package com.backup.backup.schedule;

import com.backup.backup.config.DriveService;
import com.google.api.client.http.FileContent;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.model.File;
import com.google.api.services.drive.model.FileList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

public class GoogleDrive {
    private static final Logger log = LoggerFactory.getLogger(GoogleDrive.class);
    private final HashMap<String, String> hmFolder = new HashMap<>();
    private Drive driveService;
    private final List<String> delList = new ArrayList<>();

    public GoogleDrive() {
    }

    public void uploadToGoogleDrive(String compName, String path, String folderName, String fileName) throws IOException {
        if (driveService == null) {
            driveService = DriveService.service();
        }
        if (driveService != null) {
            fileName = fileName.replace(".sql", ".zip");
            String zipPath = path.replace(".sql", ".zip");
            compName = compName.replace("\"", "");
            folderName = String.format("%s (%s)", folderName, compName);
            FileList fileList = driveService.files().list()
                    .setQ("mimeType = 'application/vnd.google-apps.folder' and trashed = false")
                    .setFields("nextPageToken, files(id,name,parents)").execute();
            List<File> files = fileList.getFiles();
            if (!files.isEmpty()) {
                for (File f : files) {
                    hmFolder.put(f.getName(), f.getId());
                }
            }
            if (hmFolder.get(compName) == null) {
                //crated company folder
                File compFolder = new File();
                compFolder.setName(compName);
                compFolder.setMimeType("application/vnd.google-apps.folder");
                File file = driveService.files().create(compFolder)
                        .setFields("id")
                        .execute();
                log.info("created company folder: " + file.getId());
                hmFolder.put(compName, file.getId());
            }
            if (hmFolder.get(folderName) == null) {
                File dbFolder = new File();
                dbFolder.setName(folderName);
                dbFolder.setMimeType("application/vnd.google-apps.folder");
                dbFolder.setParents(Collections.singletonList(hmFolder.get(compName)));
                File file = driveService.files().create(dbFolder)
                        .setFields("id")
                        .execute();
                log.info("created db folder: " + file.getId());
                hmFolder.put(folderName, file.getId());
            }
            ///////////////////////////////////////////////////
            prepareFileDelete(fileName, hmFolder.get(folderName));
            //upload file
            File zipFile = new File();
            zipFile.setName(fileName);
            zipFile.setParents(Collections.singletonList(hmFolder.get(folderName)));
            java.io.File filePath = new java.io.File(zipPath);
            String typeName = URLConnection.guessContentTypeFromName(filePath.getName());
            FileContent mediaContent = new FileContent(typeName, filePath);
            try {
                driveService.files().create(zipFile, mediaContent)
                        .setFields("id")
                        .execute();
                log.info("upload.");
                deleteFile();
            } catch (IOException e) {
                log.error("uploadToGoogleDrive: " + e.getMessage());
            }
        }
    }

    private void deleteFile() {
        delList.forEach(s -> {
            try {
                driveService.files().delete(s).execute();
                log.info(String.format("deleted : %s", s));
            } catch (IOException e) {
                log.error(e.getMessage());
            }
        });
        delList.clear();
    }

    private void prepareFileDelete(String fileName, String parentId) {
        try {
            FileList fileList = driveService.files().list()
                    .setQ("mimeType = 'application/zip' and trashed = false and name='"+fileName+"'")
                    .setFields("nextPageToken, files(id,name,parents)").execute();
            List<File> files = fileList.getFiles();
            files.forEach((f) -> {
                if (f.getName().equals(fileName) && f.getParents().get(0).equals(parentId)) {
                    delList.add(f.getId());
                }
            });
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
