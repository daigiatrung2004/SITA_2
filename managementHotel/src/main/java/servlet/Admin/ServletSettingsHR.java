package servlet.Admin;

import DAO.EmployeeDA;
import DTO.EmployeeTO;
import DTO.StaticTO;
import Utils.EncryptDecryptPassword;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class ServletSettingsHR extends WebServletAdmin {
    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {

        try {
            String name = request.getParameter("name") != null ? request.getParameter("name") : "";
            String type = request.getParameter("type") != null ? request.getParameter("type") : "1";
            boolean checkAddSuccessful=false;
            EmployeeDA employeeDA = new EmployeeDA();
            if (!name.equals("") && type.equals("1")) {
                // danh cho add position employee
                checkAddSuccessful = employeeDA.addPositionEmpoloyee(name);
            } else {
                // danh cho add employee person
                String position = request.getParameter("position") != null ? request.getParameter("position") : "0";
                String firstname = request.getParameter("firstname") != null ? request.getParameter("firstname") : "";
                String lastname = request.getParameter("lastname") != null ? request.getParameter("lastname") : "";
                String username = request.getParameter("username") != null ? request.getParameter("username") : "";
                String pwd = request.getParameter("pwd") != null ? request.getParameter("pwd") : "";
                String address = request.getParameter("address") != null ? request.getParameter("address") : "";
                String country = request.getParameter("country") != null ? request.getParameter("country") : "";
                String phone = request.getParameter("phone") != null ? request.getParameter("phone") : "";
                String email = request.getParameter("email") != null ? request.getParameter("email") : "";
                String salary = request.getParameter("salary") != null ? request.getParameter("salary") : "0";
                String region = request.getParameter("region") != null ? request.getParameter("region") : "0";

                // ma hoa password
                Random rd = new Random(11);
                String sankey = String.valueOf(rd.nextInt(StaticTO.numOfRandom));
                EncryptDecryptPassword encryptDecryptPassword = new EncryptDecryptPassword(sankey);
                String encryptPass = encryptDecryptPassword.encrypt(pwd);
                Date dnow=new Date();
                SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                String startDate=df.format(dnow).toString();
                String laslogin=df.format(dnow).toString();
                String ipAdress=request.getRemoteAddr();

                EmployeeTO employeeTO=new EmployeeTO(0,Long.parseLong(position),username,sankey,encryptPass,startDate,address,country,phone,email,Long.parseLong(salary),StaticTO.ACTIVE_STATUS,"",ipAdress,laslogin,firstname,lastname,Integer.parseInt(region));
                System.out.println("check date "+startDate+"ip address"+ipAdress);
                checkAddSuccessful=employeeDA.addEmployee(employeeTO);

            }
            if (checkAddSuccessful) {

                response.getWriter().print("{\"success\":true}");
            } else {
                response.getWriter().print("{\"success\":false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
       return;

    }
}



