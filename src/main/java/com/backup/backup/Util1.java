package com.backup.backup;

import java.util.Objects;

public class Util1 {
    public static boolean getBoolean(String obj) {
        if (!Objects.isNull(obj)) {
            return obj.equals("1") || obj.equalsIgnoreCase("true");
        }
        return false;
    }
}
