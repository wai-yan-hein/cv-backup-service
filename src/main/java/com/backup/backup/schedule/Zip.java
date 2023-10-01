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

/**
 * @author Wai Yan
 */
public class Zip {

    private static final Logger log = LoggerFactory.getLogger(Zip.class);
    private static final char[] password = {'c', 'o', 'r', 'e', 'v', 'a', 'l', 'u', 'e'};

    public static void zip(String filePath, String localPath) throws Exception {
        log.info("Zip Start.");
        String zipName = filePath.replace(".sql", ".zip");
        String localName = localPath.replace(".sql", ".zip");
        File file = new File(filePath);
        ZipFile f = new ZipFile(zipName, password);
        f.addFile(file, zipParameter());
        f.close();
        if (!localPath.equals(filePath)) {
            ZipFile local = new ZipFile(localName, password);
            local.addFile(file, zipParameter());
            local.close();
        }
        file.delete();
        log.info("Zip End.");
    }

    private static ZipParameters zipParameter() {
        ZipParameters param = new ZipParameters();
        param.setEncryptFiles(true);
        param.setCompressionLevel(CompressionLevel.HIGHER);
        param.setEncryptionMethod(EncryptionMethod.AES);
        return param;
    }
}
