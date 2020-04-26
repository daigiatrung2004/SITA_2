package servlet;

import DAO.RegionDA;
import DAO.SystemDA;
import DTO.RegionTO;
import DTO.StaticTO;
import DTO.SystemTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Random;

@MultipartConfig
public class FooterControl extends WebServlet {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) {
        try {

            String type = request.getParameter("type") != null ? (String) request.getParameter("type") : "";
            RegionDA regionDA = new RegionDA();
            SystemDA systemDA = new SystemDA();
            ArrayList<RegionTO> listRegion = regionDA.retrieveAllRegion();
            request.setAttribute("listRegion", listRegion);

            if (type.equals("legalInfo")) {

                forward("legal-infomation.jsp", request, response);

            } else if (type.equals("updateContactus")) {
                String region = request.getParameter("region") != null ? (String) request.getParameter("region") : "0";
                String room = request.getParameter("room") != null ? (String) request.getParameter("room") : "";
                String nameuser = request.getParameter("nameuser") != null ? (String) request.getParameter("nameuser") : "";
                String email = request.getParameter("email") != null ? (String) request.getParameter("email") : "";
                String title = request.getParameter("title") != null ? (String) request.getParameter("title") : "";
                String content = request.getParameter("content") != null ? (String) request.getParameter("content") : "";
                String buyer_country = request.getParameter("buyer-country") != null ? (String) request.getParameter("buyer-country") : "";

                int regionInt;
                try {
                    regionInt = Integer.parseInt(region);
                } catch (NumberFormatException e) {
                    regionInt = 0;
                }
                boolean checkSuccess = systemDA.addReportUser(0, regionInt, room, nameuser, email, buyer_country, title, content, "", StaticTO.REPORT_SEND, StaticTO.UNREAD_STATUS);
                request.setAttribute("checkSuccess", String.valueOf(checkSuccess));
                forward("contact-us.jsp", request, response);
            } else if (type.equals("our-partners")) {
                forward("partner.jsp", request, response);
            }  else if (type.equals("career")) {
                 String checkSuccess=request.getParameter("checkSuccess")!=null?(String)request.getParameter("checkSuccess"):"";
                 request.setAttribute("checkSuccess",String.valueOf(checkSuccess));
                forward("career.jsp", request, response);
                return;
            } else {
                forward("contact-us.jsp", request, response);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }


}
