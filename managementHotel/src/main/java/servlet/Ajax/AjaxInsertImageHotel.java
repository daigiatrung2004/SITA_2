package servlet.Ajax;

import DAO.UploadResourceDA;
import DTO.StaticTO;
import DTO.UploadResourceTO;
import Utils.SaveImageInServer;
import servlet.Admin.WebServletAdmin;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;


public class AjaxInsertImageHotel extends WebServletAdmin {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {

        try {
            String region=request.getParameter("region")!=null?(String)request.getParameter("region"):"";
            String src=request.getParameter("listImgOrginData")!=null?(String)request.getParameter("listImgOrginData"):"";
            String source=request.getParameter("listSrcData")!=null?(String)request.getParameter("listSrcData"):"";
            String type=request.getParameter("type")!=null?(String)request.getParameter("type"):"";
            UploadResourceDA uploadResourceDA = new UploadResourceDA();
            boolean checkSuccess = false;
             if(type.equals("")) {
                 String[] listSrcSplit = source.split("\\.");
                 source = source.replaceAll("\"", "");
                 String base64 = "";
                 String[] type_img = src.replaceAll("\"", "").split(",");



                 String filename = "";
                 DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                 Date date = new Date();
                 String dateStr = dateFormat.format(date);
                 for (int i = 0; i < listSrcSplit.length; i++) {
                     base64 = listSrcSplit[i].replaceAll("\"", "");
                     filename = type_img[i].split("\\.")[0];
//            System.out.println("filename:"+filename[0]);
                     String originname = SaveImageInServer.createImageFromBase64(base64, filename);
                     UploadResourceTO uploadResourceTO = new UploadResourceTO(0, type_img[i], originname, StaticTO.IMAGE_HOTEL + region, dateStr, StaticTO.ACTIVE_STATUS, "", type_img[i].split("\\.")[1]);
                     checkSuccess = uploadResourceDA.addUploadResource(uploadResourceTO);
                 }

             }else{
                 String id=request.getParameter("id")!=null?(String)request.getParameter("id"):"0";
                 long idLong;
                 try {
                     idLong=Long.parseLong(id);
                 } catch (NumberFormatException e) {
                     idLong=0;
                 }

                 checkSuccess=uploadResourceDA.remove(idLong);
             }
            response.getWriter().print("{\"success\":" + checkSuccess + "}");
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
}
