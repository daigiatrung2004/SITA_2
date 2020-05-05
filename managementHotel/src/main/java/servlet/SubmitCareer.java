package servlet;

import DAO.SystemDA;
import DTO.StaticTO;
import Language.LanguageControl;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.util.Random;
@MultipartConfig
public class SubmitCareer extends WebServlet {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) {


            saveFileCareer(request,response);

             return;


    }
    private void saveFileCareer(HttpServletRequest request, HttpServletResponse response) {
        // Create path components to save the file

        final Part filePart;
        String fileName = "";
        try {

            filePart = request.getPart("file");

            fileName = getFileName(filePart);
            Random rn=new Random();
            int random=rn.nextInt(StaticTO.numOfRandom);
            fileName="upload_career_"+random+"_"+fileName;
            OutputStream out = null;
            InputStream filecontent = null;
            final PrintWriter writer = response.getWriter();

            try {
                out = new FileOutputStream(new File(StaticTO.STATIC_PATH + "temp\\"
                        + fileName));
                filecontent = filePart.getInputStream();

                int read = 0;
                final byte[] bytes = new byte[1024];

                while ((read = filecontent.read(bytes)) != -1) {
                    out.write(bytes, 0, read);
                }
                writer.println("New file " + fileName + " created at " + StaticTO.STATIC_PATH);
                System.out.println("New file " + fileName + " created at " + StaticTO.STATIC_PATH);
                SystemDA systemDA=new SystemDA();

                String path=StaticTO.STATIC_PATH + "temp\\" + fileName;
                String region = request.getParameter("region") != null ? (String) request.getParameter("region") : "0";
                int regionInt;
                try {
                    regionInt = Integer.parseInt(region);
                } catch (NumberFormatException e) {
                    regionInt = 0;
                }
                String subject = request.getParameter("subject") != null ? (String) request.getParameter("subject") : "";
                boolean checkSuccess = systemDA.addReportUser(0, regionInt, "", "", "", "", subject, "", "attach_file:"+path, StaticTO.REPORT_CAREER_SEND, StaticTO.UNREAD_STATUS);
                String language = session.getAttribute("language") != null ? (String) session.getAttribute("language") : LanguageControl.VN_LAN;


                response.sendRedirect("FooterControl?type=career&&checkSuccess="+checkSuccess);
                return;

            } catch (FileNotFoundException fne) {
                writer.println("You either did not specify a file to upload or are "
                        + "trying to upload a file to a protected or nonexistent "
                        + "location.");
                writer.println("<br/> ERROR: " + fne.getMessage());


            } finally {
                if (out != null) {
                    out.close();
                }
                if (filecontent != null) {
                    filecontent.close();
                }
                if (writer != null) {
                    writer.close();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        }
        return;
    }

    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");

        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
