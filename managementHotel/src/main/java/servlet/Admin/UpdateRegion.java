package servlet.Admin;

import DAO.RegionDA;
import DAO.SystemDA;
import DTO.RegionTO;
import DTO.StaticTO;
import Language.LanguageControl;
import Utils.SaveImageInServer;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.sql.SQLException;
import java.util.Random;

@MultipartConfig
public class UpdateRegion extends WebServletAdmin {


    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String type = request.getParameter("type") != null ? (String) request.getParameter("type") : "";
        RegionDA regionDA = new RegionDA();
        if (type.equals("delete")) {

            try {
                String id = request.getParameter("id") != null ? (String) request.getParameter("id") : "0";
                int idInt;
                try {
                    idInt = Integer.parseInt(id);
                } catch (NumberFormatException e) {
                    idInt = 0;
                }
                RegionTO regionTO = regionDA.retrieveAllRegion(idInt);
                regionTO.setStatus(StaticTO.DELETE_STATUS);
                boolean checkSuccess = regionDA.updateRegion(regionTO);
                response.getWriter().print("{\"success\":" + checkSuccess + "}");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else if(type.equals("update")){
            try {
                String id = request.getParameter("id") != null ? (String) request.getParameter("id") : "0";
                int idInt;
                try {
                    idInt = Integer.parseInt(id);
                } catch (NumberFormatException e) {
                    idInt = 0;
                }
                RegionTO regionTO = regionDA.retrieveAllRegion(idInt);
                request.setAttribute("regionTO",regionTO);
                forward("/Admin/updateRegion.jsp",request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else if(type.equals("updated")){
//            updateRegion(request,response);
            // Create path components to save the file

            String name_vi=request.getParameter("name_vi")!=null?(String)request.getParameter("name_vi"):"";
            String name_en=request.getParameter("name_en")!=null?(String)request.getParameter("name_en"):"";
            String address=request.getParameter("address")!=null?(String)request.getParameter("address"):"";
            String phone=request.getParameter("phone")!=null?(String)request.getParameter("phone"):"";
            String status=request.getParameter("status")!=null?(String)request.getParameter("status"):"";
            String remark=request.getParameter("remark")!=null?(String)request.getParameter("remark"):"";
            String region = request.getParameter("region") != null ? (String) request.getParameter("region") : "0";
            String listSrcData = request.getParameter("listSrcData") != null ? (String) request.getParameter("listSrcData") : "0";
            String listImgOrginData = request.getParameter("listImgOrginData") != null ? (String) request.getParameter("listImgOrginData") : "0";
            listSrcData=listSrcData.replaceAll("\"","");
            listImgOrginData=listImgOrginData.replaceAll("\"","");
            String []splitOrigin=listImgOrginData.split("\\.");
            String base64=listSrcData;
            int regionInt;
            try {
                regionInt = Integer.parseInt(region);
            } catch (NumberFormatException e) {
                regionInt = 0;
            }
            RegionTO regionTOOld=regionDA.retrieveAllRegion(regionInt);
            String fileimgurl="";
            String filename="";
            if(splitOrigin.length>0){
                filename=splitOrigin[0];
            }
            if(regionTOOld!=null){
                fileimgurl=regionTOOld.getFile_url_img();
                deleteFileName(fileimgurl);

            }

            RegionTO regionTO = new RegionTO(regionInt, name_vi, name_en, status, remark, SaveImageInServer.createImageFromBase64(base64,filename+"_img_region"),address,phone);
            boolean checkSuccess=regionDA.updateRegion(regionTO);
            try {
                response.getWriter().print("{\"success\":"+checkSuccess+"}");
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
    }

    private void deleteFileName(String path){
        if(!path.equals("")) {
            File myObj = new File(path);
            if (myObj.delete()) {
                System.out.println("Deleted the file: " + myObj.getName());
            } else {
                System.out.println("Failed to delete the file.");
            }
        }else{
            System.out.println("Failed to delete the file.");
        }
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
