package Utils;

import DTO.StaticTO;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.ArrayList;
import java.util.Properties;

public class SendMail {
    public static boolean sendmail(ArrayList<String> infolist) {
        boolean checkSuccess = false;
        if (infolist != null) {

            String location = infolist.get(0);
            String total = infolist.get(1);
            String namecustomer = infolist.get(2);
            String CMND = infolist.get(3);
            String phone = (String) infolist.get(4);
            String roomname = infolist.get(5);
            String songay = infolist.get(6);
            String giaphong = infolist.get(7);
            String codereceive = infolist.get(8);
            String receiveemail = infolist.get(9);

            // Recipient's email ID needs to be mentioned.
            String to = receiveemail;

            // Sender's email ID needs to be mentioned
            String from = "linkthuy9@gmail.com";

            // Assuming you are sending email from through gmails smtp
            String host = "smtp.gmail.com";

            // Get system properties
            Properties properties = System.getProperties();
            //rdzeszirbglmcnxg
            // Setup mail server
            properties.put("mail.smtp.host", host);
            properties.put("mail.smtp.port", "465");
            properties.put("mail.smtp.ssl.enable", "true");
            properties.put("mail.smtp.auth", "true");

            // Get the Session object.// and pass username and password
            Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

                protected PasswordAuthentication getPasswordAuthentication() {

                    return new PasswordAuthentication("linkthuy9@gmail.com", "rdzeszirbglmcnxg");

                }

            });

            // Used to debug SMTP issues
            session.setDebug(true);

            try {
                // Create a default MimeMessage object.
                MimeMessage message = new MimeMessage(session);

                // Set From: header field of the header.
                message.setFrom(new InternetAddress(from));

                // Set To: header field of the header.
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

                // Set Subject: header field
                message.setSubject("Book successfully at  " + location);
                // string content;
                String content_template = ConvertHTMLToString.htmlToString(StaticTO.CONFIRM_BOOKING_HTML);
                String content = transformContentConfirmBooking(content_template, infolist);
                // Now set the actual message
                message.setContent(content, "text/html;charset=utf-8");

                System.out.println("sending...");
                // Send message
                Transport.send(message);
                System.out.println("Sent message successfully....");
                checkSuccess = true;
            } catch (MessagingException mex) {
                mex.printStackTrace();
            }
        }
        return checkSuccess;

    }

    // thay thê các data theo yêu cầu
    public static String transformContentConfirmBooking(String content_Temp, ArrayList<String> infolist) {
        String location = "", total = "", namecustomer = "", CMND = "", phone = "", roomname = "", songay = "", giaphong = "", codereceive = "";
        location = infolist.get(0);
        total = infolist.get(1);
        namecustomer = infolist.get(2);
        CMND = infolist.get(3);
        phone = (String) infolist.get(4);
        roomname = infolist.get(5);
        songay = infolist.get(6);
        giaphong = infolist.get(7);
        codereceive = infolist.get(8);

        content_Temp = content_Temp.replaceAll("@REGIONNAME", location);
        content_Temp = content_Temp.replaceAll("@TOTAL", total);
        content_Temp = content_Temp.replaceAll("@CUSTOMERNAME", namecustomer);
        content_Temp = content_Temp.replaceAll("@CMND", CMND);
        content_Temp = content_Temp.replaceAll("@PHONE", phone);
        content_Temp = content_Temp.replaceAll("@NAMEROOM", roomname);
        content_Temp = content_Temp.replaceAll("@SONGAY", songay);
        content_Temp = content_Temp.replaceAll("@GIAPHONG", giaphong);
        content_Temp = content_Temp.replaceAll("@CODERECEIVE", codereceive);
        return content_Temp;

    }

    public static void main(String[] args) {
//        ArrayList<String> infolist = new ArrayList<>();
//        infolist.add("Khu nghỉ dưỡng Phan Thiết");
//        infolist.add(TextCustomizeFormat.currency_format(100000));
//        infolist.add("Đào Anh Vũ");
//        infolist.add("025727433");
//        infolist.add("0932688659");
//        infolist.add("01");
//        infolist.add("1");
//        infolist.add(TextCustomizeFormat.currency_format(100000));
//        infolist.add("anhvudeptraidethuongchuacobo");
//        System.out.println("Sendmail  :" + sendmail(infolist));


    }
}
