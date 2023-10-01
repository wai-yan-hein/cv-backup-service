package com.backup.backup.exeception;

import com.backup.backup.service.EmailService;
import net.lingala.zip4j.exception.ZipException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;


@ControllerAdvice
@PropertySource(value = {"file:config/application.properties"})
public class GlobalExceptionHandler {

    @Autowired
    private EmailService emailService;

    @Value("${company.name}")
    private String compName;

    @ExceptionHandler(ZipException.class)
    public void handleException(Exception ex) {
        // Send email with error detail
        emailService.sendErrorMail(compName, ex.getMessage());
    }

}
