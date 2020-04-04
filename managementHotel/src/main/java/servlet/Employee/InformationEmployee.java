package servlet.Employee;

import DAO.EmployeeDA;
import DAO.RegionDA;
import DTO.EmployeeTO;
import DTO.PositionEmployeeTO;
import DTO.RegionTO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class InformationEmployee extends WebServletEmployee {

    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        try {
            // lấy dữ liệu đã lưu trong session khi đăng nhập
            EmployeeTO employeeTO = (EmployeeTO) session.getAttribute("mem_sid");
            RegionDA regionDA = new RegionDA();
            EmployeeDA employeeDA = new EmployeeDA();
            if (employeeTO != null) {
                RegionTO regionTO = regionDA.retrieveAllRegion(employeeTO.getRegion_id());
                request.setAttribute("regionTO", regionTO);
                // tìm vị trí nhân viên
                PositionEmployeeTO positionEmployeeTO = employeeDA.retrieveEmployeeById(employeeTO.getPositionEmployeeId());
                request.setAttribute("positionEmployeeTO", positionEmployeeTO);
            }
            forward("/EMPLOYEE/informationEmployee.jsp", request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
