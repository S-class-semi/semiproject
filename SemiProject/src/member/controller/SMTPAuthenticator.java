/**
 *
 */
package member.controller;
 
import javax.mail.PasswordAuthentication;
import javax.mail.Authenticator;
 
/**
 * @author viper9
 *
 */
public class SMTPAuthenticator extends Authenticator {
    public SMTPAuthenticator() {
        super();
    }
 
    public PasswordAuthentication getPasswordAuthentication() {
        String username = "livealone1199@gmail.com";
        String password = "sksghswktksek";
        return new PasswordAuthentication(username, password);
    }
}