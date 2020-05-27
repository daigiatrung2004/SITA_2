package servlet.Admin;

import DAO.EmployeeDA;
import DAO.RegionDA;
import DTO.EmployeeTO;
import DTO.PositionEmployeeTO;
import DTO.RegionTO;
import DTO.StaticTO;
import Utils.EncryptDecryptPassword;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

public class ListingHR extends WebServletAdmin {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {

        try {
            String type=request.getParameter("type")!=null?(String)request.getParameter("type"):"";
            EmployeeDA employeeDA = new EmployeeDA();
            String id=request.getParameter("id")!=null?(String)request.getParameter("id"):"0";
            long idLong;
            try {
                idLong=Long.parseLong(id);
            } catch (NumberFormatException e) {
                idLong=0;
            }
            if(type.equals("")) {
                String position = request.getParameter("position") != null ? (String) request.getParameter("position") : "";

                // get all data vi tri
                ArrayList<PositionEmployeeTO> listPos = employeeDA.retreiveAllPositionEmployee();
                request.setAttribute("listPos", listPos);
                ArrayList<EmployeeTO> listEmployeeTO = employeeDA.retrieveALLEmployee();

                for (int i = 0; i < listEmployeeTO.size(); i++) {
                    PositionEmployeeTO pos = employeeDA.retrieveEmployeeById(listEmployeeTO.get(i).getPositionEmployeeId());
                    if (pos != null) {
                        listEmployeeTO.get(i).setPostionName(pos.getName());
                    }
                }
                request.setAttribute("listEmployeeTO", listEmployeeTO);
                // dk neu co fetch vi tri
                request.setAttribute("position", position);
                forward("/Admin/ListingHR.jsp", request, response);
            }else if(type.equals("delete")){

                EmployeeTO employeeTO=employeeDA.retrieveEmployeeByIdUser(idLong);

                if(employeeTO!=null){
                  employeeTO.setStatus(StaticTO.REMOVE_STATUS);
                  Date date=new Date();
                    DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String dateStr=dateFormat.format(date);
                    String remarks=employeeTO.getRemark();
                    remarks+="END_DATE/"+dateStr+";";
                    employeeTO.setRemark(remarks);
                    boolean checkSuccess=employeeDA.updateEmployee(employeeTO);
                    response.getWriter().print("{\"success\":"+checkSuccess+"}");
                }

            }else if(type.equals("edit-user")){

                EmployeeTO employeeTO=employeeDA.retrieveEmployeeByIdUser(idLong);
                request.setAttribute("employeeTO",employeeTO);
                RegionDA regionDA=new RegionDA();
                ArrayList<RegionTO> listRegion=regionDA.retrieveAllRegion();
                request.setAttribute("listRegion",listRegion);
                ArrayList<PositionEmployeeTO> listPosEm=employeeDA.retreiveAllPositionEmployee();
                request.setAttribute("listPosEm",listPosEm);
                forward("Admin/edit-hr.jsp",request,response);
            }else if(type.equals("edited-user")){
                String position = request.getParameter("position") != null ? (String) request.getParameter("position") : "0";
                String firstname = request.getParameter("firstname") != null ? (String) request.getParameter("firstname") : "";
                String lastname = request.getParameter("lastname") != null ? (String) request.getParameter("lastname") : "";
                String username = request.getParameter("username") != null ? (String) request.getParameter("username") : "";
                String country = request.getParameter("country") != null ? (String) request.getParameter("country") : "";
                String password = request.getParameter("password") != null ? (String) request.getParameter("password") : "";
                String phone = request.getParameter("phone") != null ? (String) request.getParameter("phone") : "";
                String email = request.getParameter("email") != null ? (String) request.getParameter("email") : "";
                String salary = request.getParameter("salary") != null ? (String) request.getParameter("salary") : "";
                String region = request.getParameter("region") != null ? (String) request.getParameter("region") : "";
                String address = request.getParameter("address") != null ? (String) request.getParameter("address") : "";
                int regionInt;
                regionInt=Integer.parseInt(region);
                Random rn=new Random();
                String sankey=String.valueOf(rn.nextInt(StaticTO.numOfRandom));
                EncryptDecryptPassword encryptDecryptPassword=new EncryptDecryptPassword(sankey);
                 password=encryptDecryptPassword.encrypt(password);
                long positionLong,salaryLong;
                try {
                    positionLong=Long.parseLong(position);
                } catch (NumberFormatException e) {
                    positionLong=0;
                }
                salaryLong=Long.parseLong(salary);
                EmployeeTO employeeTOOld=employeeDA.retrieveEmployeeByIdUser(idLong);
                EmployeeTO employeeTO=new EmployeeTO(idLong,positionLong,username,sankey,password,employeeTOOld.getStart_date(),address,country,phone,email,salaryLong,employeeTOOld.getStatus(),employeeTOOld.getRemark(),employeeTOOld.getIpAdress(),employeeTOOld.getLast_login(),firstname,lastname,regionInt);
                boolean checkSuccess=employeeDA.updateEmployee(employeeTO);
                response.sendRedirect("./ListingHR?checkSuccess="+checkSuccess);

            }else if(type.equals("delete-position")){

                PositionEmployeeTO positionEmployeeTO=employeeDA.retrieveEmployeeById(idLong);
                positionEmployeeTO.setStatus(StaticTO.REMOVE_STATUS);
                boolean checkSuccess=employeeDA.updatePositionEmpoloyee(positionEmployeeTO);
                response.getWriter().print("{\"success\":"+checkSuccess+"}");
            }else if(type.equals("edit-position")){
                PositionEmployeeTO positionEmployeeTO=employeeDA.retrieveEmployeeById(idLong);
                request.setAttribute("positionEmployeeTO",positionEmployeeTO);
                forward("Admin/edit-position.jsp",request,response);
            }else if(type.equals("edited-position")){
                PositionEmployeeTO positionEmployeeTO=employeeDA.retrieveEmployeeById(idLong);
                String name=request.getParameter("name")!=null?(String)request.getParameter("name"):"";
                positionEmployeeTO.setName(name);
                boolean checkSuccess=employeeDA.updatePositionEmpoloyee(positionEmployeeTO);
                response.sendRedirect("./ListingHR?position=true&checkSuccess="+checkSuccess);
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
