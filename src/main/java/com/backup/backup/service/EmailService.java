package com.backup.backup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender javaMailSender;

    public void sendErrorMail(String compName, String text) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo("corevaluemyanmar@gmail.com");
        message.setSubject("Core Backup Error Report : " + compName);
        message.setText(text);
        javaMailSender.send(message);
    }
}
