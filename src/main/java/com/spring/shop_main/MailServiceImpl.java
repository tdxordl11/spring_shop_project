package com.spring.shop_main;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
 
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService{
	
	final String username = "st.shop.final@gmail.com";
	final String password = "stshoptest";

	@Override
	public boolean send(String subject, String text, String sendEmailId, String useremail) {
        Properties prop = System.getProperties();
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.port", "587");
        
        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
        	String un = username; String pw = password;
        	protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
        		return new javax.mail.PasswordAuthentication(un, pw); 
        		} 
        	});

        
        MimeMessage msg = new MimeMessage(session);
    
        try {
            msg.setSentDate(new Date());
            
            msg.setFrom(new InternetAddress(sendEmailId, "ST SHOP TEST"));
            InternetAddress to = new InternetAddress(useremail);         
            msg.setRecipient(Message.RecipientType.TO, to);            
            msg.setSubject(subject, "UTF-8");            
            msg.setText(text, "UTF-8");            
            
            Transport.send(msg);
            return true;
        } catch(AddressException ae) {            
            System.out.println("AddressException : " + ae.getMessage());           
        } catch(MessagingException me) {            
            System.out.println("MessagingException : " + me.getMessage());
        } catch(UnsupportedEncodingException e) {
            System.out.println("UnsupportedEncodingException : " + e.getMessage());			
        }
		return false;
                
    }

}
