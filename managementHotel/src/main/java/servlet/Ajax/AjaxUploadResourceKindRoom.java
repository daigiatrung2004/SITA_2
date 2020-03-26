package servlet.Ajax;

import DAO.UploadResourceDA;
import DTO.StaticTO;
import DTO.UploadResourceTO;
import servlet.Admin.WebServletAdmin;
import sun.misc.BASE64Decoder;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.*;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Random;

public class AjaxUploadResourceKindRoom extends WebServletAdmin {
    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String listImgOrgin = request.getParameter("listImgOrginData") != null ? (String) request.getParameter("listImgOrginData") : "";
        String listSrc = request.getParameter("listSrcData") != null ? (String) request.getParameter("listSrcData") : "";
        String kindroom = request.getParameter("kindroomData") != null ? (String) request.getParameter("kindroomData") : "0";
        boolean checkSuccess = false;
        try {

            if (listImgOrgin != null) {
                Date date = new Date();
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                String createDate = df.format(date);

                UploadResourceDA uploadResourceDA = new UploadResourceDA();
                String[] type = listImgOrgin.replaceAll("\"","").split(",");
                String[] listSrcSplit = listSrc.split("\\.");
                kindroom=StaticTO.DB_KIND_ROOM_NAME+"_"+kindroom;
                for (int i = 0; i < listSrcSplit.length; i++) {
                    String base64 = listSrcSplit[i].replaceAll("\"", "");
                    String path = createImageFromBase64(base64);
                    UploadResourceTO uploadResourceTO = null;

                    String origin_file = type[i];
                    String file_type = type[i].split("\\.")[1];


                    uploadResourceTO = new UploadResourceTO(0, origin_file, path, kindroom, createDate, StaticTO.ACTIVE_STATUS, "", file_type);


                    if (uploadResourceTO != null) {
                        checkSuccess = uploadResourceDA.addUploadResource(uploadResourceTO);
                    }

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
            String rnStr = String.valueOf(rn.nextInt(StaticTO.numOfRandom));
            System.out.println("randoom"+rnStr);
            String fileName = rnStr + "_img_Uploaded_zoom.png";
            path = getServletContext().getInitParameter("FOLDER_SAVE_IMAGE") + fileName;

            File outputfile = new File(path);
            ImageIO.write(image, "png", outputfile);

        } catch (IOException e) {
            e.printStackTrace();
        }


// write the image to a file
        return path;
    }


}
