package util

import javax.activation.DataHandler
import javax.activation.DataSource
import javax.activation.FileDataSource
import javax.mail.*
import javax.mail.internet.InternetAddress
import javax.mail.internet.MimeBodyPart
import javax.mail.internet.MimeMessage
import javax.mail.internet.MimeMultipart

/**
 * Created by IntelliJ IDEA.
 * User: msaifullah
 * Date: 22-DEC-2015
 * Time: 11:28 AM
 * To change this template use File | Settings | File Templates.
 */
class EmailProcessor implements IMessageSender{


    static String SMTP_SERVER = "smtp.gmail.com";
//    static final String SMTP_SERVER = "69.73.149.90";
    static String SMTP_PORT = "465";
    static SENDER_EMAIL_ADDRESS = "";
    static SENDER_EMAIL_PASSWORD = "";

    /*static {
        Properties prop = new Properties();
        String propFileName = "D:\\mail_config.properties"

        try {
            prop.load(new FileInputStream(propFileName));

            SMTP_SERVER = prop.getProperty("SMTP_SERVER");
            SMTP_PORT = prop.getProperty("SMTP_PORT");
            SENDER_EMAIL_ADDRESS = prop.getProperty("SENDER_EMAIL_ADDRESS");
            SENDER_EMAIL_PASSWORD = prop.getProperty("SENDER_EMAIL_PASSWORD");


        } catch (FileNotFoundException e) {
            println("fnf: "+e)
            e.printStackTrace();
//            throw new FileNotFoundException("Mail configuration property file '" + propFileName + "' not found in the classpath");
        } catch (IOException e) {
            println("io: "+e)
            e.printStackTrace();
//            throw e;
        }
    }*/

    /**
     * This method is used to initialize the mail configuration from the property file
     * @exception IOException On input error.
     * @see IOException
     */
    void init() throws IOException {

        Properties prop = new Properties();
        String propFileName = "mail_config.properties";

        try {
//            prop.load(new FileInputStream(propFileName));

/*            // get the property value and print it out
            SMTP_SERVER = prop.getProperty("SMTP_SERVER");
            SMTP_PORT = prop.getProperty("SMTP_PORT");
            SENDER_EMAIL_ADDRESS = prop.getProperty("SENDER_EMAIL_ADDRESS");
            SENDER_EMAIL_PASSWORD = prop.getProperty("SENDER_EMAIL_PASSWORD");*/


            SMTP_SERVER = "smtp.gmail.com" //prop.getProperty("SMTP_SERVER");
            SMTP_PORT = "465" //prop.getProperty("SMTP_PORT");
            SENDER_EMAIL_ADDRESS = "bepza2016@gmail.com" //prop.getProperty("SENDER_EMAIL_ADDRESS");
            SENDER_EMAIL_PASSWORD = "2016bepza" //prop.getProperty("SENDER_EMAIL_PASSWORD");


        } catch (FileNotFoundException fnf) {
            System.out.println("FileNotFoundExcfnfption: " + e);
            throw new FileNotFoundException("property file '" + propFileName + "' not found in the classpath");
        }
        catch (Exception e) {
            System.out.println("Exception: " + e);
            e.printStackTrace()
        } finally {

        }
    }

    public EmailProcessor() {
        init();
    }

    /**
     * This method is used to send mail with multiple TO and CC
     * @param subject This is the first paramter to sendEmail method
     * @param msgBody This is the second parameter to sendEmail method
     * @param mailTo This is the third parameter to sendEmail method
     * @param cc This is the fourth parameter to sendEmail method.
     * @param bcc This is the fifth parameter to sendEmail method.
     * @param isAttachment This is the sixth parameter to sendEmail method.
     * @param attachments This is the seventh parameter to sendEmail method.
     * @return Nothing.
     */

    @Override
    void sendMessage(String subject, String messageBody, String mailTo, String cc, String bcc,  Boolean isAttachment, List<String> attachments) throws MessagingException
    {
        Properties props = new Properties();
        props.put("mail.smtp.host", SMTP_SERVER);
        props.put("mail.smtp.socketFactory.port", SMTP_PORT);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", SMTP_PORT);

        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SENDER_EMAIL_ADDRESS, SENDER_EMAIL_PASSWORD);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(SENDER_EMAIL_ADDRESS));

        InternetAddress[] toIAdressArray = InternetAddress.parse(mailTo);

        message.setRecipients(Message.RecipientType.TO, toIAdressArray);

        if (cc?.length() > 0) {
            InternetAddress[] ccIAdressArray = InternetAddress.parse(cc);
            message.setRecipients(Message.RecipientType.CC, ccIAdressArray);
        }

        message.setSubject(subject);
        // message.setText(messageBody);
        if (!isAttachment) {
            message.setText(messageBody);
        } else {
            Multipart multipart = addEmailContents(messageBody, attachments)
            message.setContent(multipart);
        }
        Transport.send(message);
    }

    void sendEmailWithAttachment(String subject, String messageBody, String cc, String bcc, String mailTo, Boolean isAttachment, List<String> attachments) throws MessagingException {

        Properties props = new Properties();
        props.put("mail.smtp.host", SMTP_SERVER);
        props.put("mail.smtp.socketFactory.port", SMTP_PORT);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", SMTP_PORT);

        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SENDER_EMAIL_ADDRESS, SENDER_EMAIL_PASSWORD);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(SENDER_EMAIL_ADDRESS));

        InternetAddress[] toIAdressArray = InternetAddress.parse(mailTo);

        message.setRecipients(Message.RecipientType.TO, toIAdressArray);

        if (cc?.length() > 0) {
            InternetAddress[] ccIAdressArray = InternetAddress.parse(cc);
            message.setRecipients(Message.RecipientType.CC, ccIAdressArray);
        }

        message.setSubject(subject);
        // message.setText(messageBody);
        if (!isAttachment) {
            message.setText(messageBody);
        } else {
            Multipart multipart = addEmailContents(messageBody, attachments)
            message.setContent(multipart);
        }
        Transport.send(message);
    }

    /**
     * This method is used to send mail with multiple TO and CC
     * @param subject This is the first paramter to sendEmail method
     * @param msgBody This is the second parameter to sendEmail method
     * @param mailTo This is the third parameter to sendEmail method
     * @param cc This is the fourth parameter to sendEmail method.
     * @return Nothing.
     */
    void sendEmail(String subject, String msgBody, String mailTo, String cc) throws MessagingException {

        Properties props = new Properties();
        props.put("mail.smtp.host", SMTP_SERVER);
        props.put("mail.smtp.socketFactory.port", SMTP_PORT);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", SMTP_PORT);

        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(SENDER_EMAIL_ADDRESS,
                                SENDER_EMAIL_PASSWORD);
                    }
                });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(SENDER_EMAIL_ADDRESS));

        InternetAddress[] toIAdressArray = InternetAddress.parse(mailTo);

        message.setRecipients(Message.RecipientType.TO, toIAdressArray);

        if (cc?.length() > 0) {
            InternetAddress[] ccIAdressArray = InternetAddress.parse(cc);
            message.setRecipients(Message.RecipientType.CC, ccIAdressArray);
        }
        message.setSubject(subject);
        message.setText(msgBody);

        Transport.send(message);
    }

    /**
     * This method is used to attach attachments
     * @param messageBody This is the first paramter to addEmailContents method
     * @param attachments This is the second parameter to addEmailContents method
     * @return Multipart This returns multipart attachments of mail
     */
    Multipart addEmailContents(String messageBody, List<String> attachments) {

        // create the message part
        MimeBodyPart messageBodyPart =
                new MimeBodyPart();

        //fill message
        messageBodyPart.setText(messageBody);

        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(messageBodyPart);

        for (String attachment : attachments) {

            messageBodyPart = new MimeBodyPart();
            DataSource source = new FileDataSource(attachment);
            messageBodyPart.setDataHandler(new DataHandler(source));
            messageBodyPart.setFileName(attachment);
            multipart.addBodyPart(messageBodyPart);
        }
        return multipart;
    }
}
