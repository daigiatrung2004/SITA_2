package servlet.Ajax;

import DAO.ServiceDA;
import DAO.UploadResourceDA;
import DTO.ServiceTO;
import DTO.StaticTO;
import DTO.UploadResourceTO;
import servlet.Admin.WebServletAdmin;
import servlet.WebServlet;
import sun.misc.BASE64Decoder;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class AjaxInsertService extends WebServletAdmin {
    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String listImgOrgin = request.getParameter("listImgOrginData") != null ? (String) request.getParameter("listImgOrginData") : "";
        String listSrc = request.getParameter("listSrcData") != null ? (String) request.getParameter("listSrcData") : "";
        String name_service_en = request.getParameter("name_service_en") != null ? (String) request.getParameter("name_service_en") : "";
        String name_service_vi = request.getParameter("name_service_vi") != null ? (String) request.getParameter("name_service_vi") : "";
        String content_service_en = request.getParameter("content_service_en") != null ? (String) request.getParameter("content_service_en") : "";
        String content_service_vi = request.getParameter("content_service_vi") != null ? (String) request.getParameter("content_service_vi") : "";
        boolean checkSuccess = false;
        ServiceDA serviceDA=new ServiceDA();
        try {
//            System.out.println("content_service:"+content_service+"name_service:"+name_service);
            if (listImgOrgin != null) {

                String[] type = listImgOrgin.replaceAll("\"", "").split(",");
                String[] listSrcSplit = listSrc.split("\\.");
                for (int i = 0; i < listSrcSplit.length; i++) {
                    String base64 = listSrcSplit[i].replaceAll("\"", "");
                    String path = createImageFromBase64(base64);

                    String origin_file = type[i];
                    String file_type = type[i].split("\\.")[1];

                    ServiceTO serviceTO=new ServiceTO(0,name_service_vi,name_service_en,path,content_service_en,content_service_vi,StaticTO.ACTIVE_STATUS,"");
                    checkSuccess=serviceDA.addService(serviceTO);
                }


            }
            if (checkSuccess) {
                response.getWriter().print("{\"success\":true}");
            } else {
                response.getWriter().print("{\"success\":false}");
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String createImageFromBase64(String base64) {
        String[] parts = base64.split(",");
        String imageString = parts[1];
        // create a buffered image
        BufferedImage image = null;
        byte[] imageByte;

        BASE64Decoder decoder = new BASE64Decoder();
        String path = "";
        try {
            imageByte = decoder.decodeBuffer(imageString);
            ByteArrayInputStream bis = new ByteArrayInputStream(imageByte);
            image = ImageIO.read(bis);
            bis.close();
            Random rn = new Random();
            String rnStr = String.valueOf(rn.nextInt());
            String fileName = rnStr + "_img_icon_service.png";
            path = getServletContext().getInitParameter("FOLDER_SERVICE") + fileName;

            File outputfile = new File(path);
            ImageIO.write(image, "png", outputfile);

        } catch (IOException e) {
            e.printStackTrace();
        }


// write the image to a file
        return path;
    }
}
