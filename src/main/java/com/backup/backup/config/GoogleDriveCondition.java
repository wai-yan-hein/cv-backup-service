package com.backup.backup.config;

import com.backup.backup.Util1;
import org.springframework.context.annotation.Condition;
import org.springframework.context.annotation.ConditionContext;
import org.springframework.core.type.AnnotatedTypeMetadata;

public class GoogleDriveCondition implements Condition {
    @Override
    public boolean matches(ConditionContext cc, AnnotatedTypeMetadata atm) {
        String useActiveMq = cc.getEnvironment().getProperty("backup.google");
        return Util1.getBoolean(useActiveMq);
    }
}
