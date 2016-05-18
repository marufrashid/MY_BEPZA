package util;

import javax.mail.MessagingException;
import java.util.List;

/**
 * Created by msaifullah on 12/22/2015.
 */
public interface IMessageSender {
   public void sendMessage (String subject, String messageBody, String cc, String bcc, String messageTo, Boolean isAttachment, List<String> attachments) throws MessagingException;
}
