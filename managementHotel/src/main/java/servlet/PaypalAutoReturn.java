package servlet;


import servlet.Employee.WebServletEmployee;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.Enumeration;

public class PaypalAutoReturn extends WebServletEmployee {


    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        // read post from PayPal system and add 'cmd'
        Enumeration en = request.getParameterNames();
        String str = "cmd=_notify-validate";
        while (en.hasMoreElements()) {
            String paramName = (String) en.nextElement();
            String paramValue = request.getParameter(paramName);
            try {
                str = str + "&" + paramName + "=" + URLEncoder.encode(paramValue, "UTF-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }

// post back to PayPal system to validate
// NOTE: change http: to https: in the following URL to verify using SSL (for increased security).
// using HTTPS requires either Java 1.4 or greater, or Java Secure Socket Extension (JSSE)
// and configured for older versions.
        URL u = null;
        try {
            u = new URL("https://www.sandbox.paypal.com/cgi-bin/webscr");
            URLConnection uc = u.openConnection();
            uc.setDoOutput(true);
            uc.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            PrintWriter pw = new PrintWriter(uc.getOutputStream());
            pw.println(str);
            pw.close();

            BufferedReader in = new BufferedReader(
                    new InputStreamReader(uc.getInputStream()));
            String res = in.readLine();
            in.close();

// assign posted variables to local variables
            String itemName = request.getParameter("item_name");
            String itemNumber = request.getParameter("item_number");
            String paymentStatus = request.getParameter("payment_status");
            String paymentAmount = request.getParameter("mc_gross");
            String paymentCurrency = request.getParameter("mc_currency");
            String txnId = request.getParameter("txn_id");
            String receiverEmail = request.getParameter("receiver_email");
            String payerEmail = request.getParameter("payer_email");

//check notification validation
            if (res.equals("VERIFIED")) {
// check that paymentStatus=Completed
// check that txnId has not been previously processed
// check that receiverEmail is your Primary PayPal email
// check that paymentAmount/paymentCurrency are correct
// process payment
                System.out.println("oleyyyyyyyyyyyyy VERIFIED :) ");
                System.out.println("You can write to DB");
            } else if (res.equals("INVALID")) {
// log for investigation
                System.out.println("opsss INVALID :( ");
            } else {
                System.out.println("ERROR :(((( ");
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
