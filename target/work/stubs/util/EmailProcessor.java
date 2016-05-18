package util;

import javax.mail.*;
import java.lang.*;
import java.io.*;
import java.net.*;
import java.util.*;
import groovy.lang.*;
import groovy.util.*;

public class EmailProcessor
  extends java.lang.Object  implements
    IMessageSender,    groovy.lang.GroovyObject {
;
public EmailProcessor
() {}
public  groovy.lang.MetaClass getMetaClass() { return (groovy.lang.MetaClass)null;}
public  void setMetaClass(groovy.lang.MetaClass mc) { }
public  java.lang.Object invokeMethod(java.lang.String method, java.lang.Object arguments) { return null;}
public  java.lang.Object getProperty(java.lang.String property) { return null;}
public  void setProperty(java.lang.String property, java.lang.Object value) { }
public static  java.lang.String getSMTP_SERVER() { return (java.lang.String)null;}
public static  void setSMTP_SERVER(java.lang.String value) { }
public static  java.lang.String getSMTP_PORT() { return (java.lang.String)null;}
public static  void setSMTP_PORT(java.lang.String value) { }
public static  java.lang.Object getSENDER_EMAIL_ADDRESS() { return null;}
public static  void setSENDER_EMAIL_ADDRESS(java.lang.Object value) { }
public static  java.lang.Object getSENDER_EMAIL_PASSWORD() { return null;}
public static  void setSENDER_EMAIL_PASSWORD(java.lang.Object value) { }
public  void init()throws java.io.IOException { }
@java.lang.Override() public  void sendMessage(java.lang.String subject, java.lang.String messageBody, java.lang.String mailTo, java.lang.String cc, java.lang.String bcc, java.lang.Boolean isAttachment, java.util.List<java.lang.String> attachments)throws javax.mail.MessagingException { }
public  void sendEmailWithAttachment(java.lang.String subject, java.lang.String messageBody, java.lang.String cc, java.lang.String bcc, java.lang.String mailTo, java.lang.Boolean isAttachment, java.util.List<java.lang.String> attachments)throws javax.mail.MessagingException { }
public  void sendEmail(java.lang.String subject, java.lang.String msgBody, java.lang.String mailTo, java.lang.String cc)throws javax.mail.MessagingException { }
public  javax.mail.Multipart addEmailContents(java.lang.String messageBody, java.util.List<java.lang.String> attachments) { return (javax.mail.Multipart)null;}
}
