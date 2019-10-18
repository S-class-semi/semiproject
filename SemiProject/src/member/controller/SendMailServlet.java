package member.controller;
 
import java.io.IOException;
import java.util.Properties;
 
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
/**
 * Servlet implementation class SendMail
 */
@WebServlet("/sendmail.me")
public class SendMailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
 
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
    	request.setCharacterEncoding("UTF-8");
    	 
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
 
        String m_name = "리성호";
        String m_email = request.getParameter("findMail");
        String m_title = "임시비밀번호는?";
        String m_text = "임시비밀번호 : ";
        String randomPwd = request.getParameter("randomPwd");
 
        try {
            String mail_from =  "livealone1199@gmail.com";
            String mail_to =    m_email;
            String title =      m_title;
            String contents =   m_text + randomPwd;
 
            mail_from = new String(mail_from.getBytes("UTF-8"), "UTF-8");
            mail_to = new String(mail_to.getBytes("UTF-8"), "UTF-8");
 
            Properties props = new Properties();
            props.put("mail.transport.protocol", "smtp");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "465");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.socketFactory.fallback", "false");
            props.put("mail.smtp.auth", "true");
 
            Authenticator auth = new SMTPAuthenticator();
 
            Session sess = Session.getDefaultInstance(props, auth);
 
            MimeMessage msg = new MimeMessage(sess);
 
            msg.setFrom(new InternetAddress(mail_from));
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(mail_to));
            msg.setSubject(title, "UTF-8");
            msg.setContent(contents, "text/html; charset=UTF-8");
            msg.setHeader("Content-type", "text/html; charset=UTF-8");
 
            Transport.send(msg);
 
            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            response.sendRedirect("errorPage.jsp");
        } finally {
 
        }
    }
 
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
    	doGet(request, response);
    }
 
}