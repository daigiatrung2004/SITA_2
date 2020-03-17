package servlet.Ajax;

import servlet.WebServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AjaxPaymentContinue extends WebServlet {
    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) {
        try {
            forward("paymentViewContinue.jsp",request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
