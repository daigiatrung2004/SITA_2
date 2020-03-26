package servlet;

import DAO.PromoteDA;
import DAO.RoomOfALLDA;
import DAO.ServiceDA;
import DAO.UploadResourceDA;
import DTO.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class PaymentLoadView extends WebServlet {
    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) {
        try {
            ArrayList<SearchTO> listSearchTO = (ArrayList<SearchTO>) request.getAttribute("listSearchNew");
            String numOfPeo = request.getAttribute("numOfPeo") != null ? (String) request.getAttribute("numOfPeo") : "0";
            UploadResourceDA uploadResourceDA = new UploadResourceDA();
            RoomOfALLDA roomOfALLDA=new RoomOfALLDA();
            PromoteDA promoteDA=new PromoteDA();
            ServiceDA serviceDA=new ServiceDA();


            ArrayList listUploadResouce = new ArrayList();
            ArrayList listPriceRoom=new ArrayList();
            UploadResourceTO uploadResourceTO = null;
           ArrayList listPromote=new ArrayList();
           ArrayList listServiceAll=new ArrayList();
           ArrayList listAllRoom=new ArrayList();
            if (listSearchTO != null) {
                for (int i = 0; i < listSearchTO.size(); i++) {
                    KindRoomTO kindRoomTO = listSearchTO.get(i).getKindRoomTO();
                    RegionTO regionTO=listSearchTO.get(i).getRegionTO();
                    // load du lieu hinh ảnh theo từng loại phòng
                    ArrayList<UploadResourceTO> listUploadResouceTO = uploadResourceDA.retrieveUploadByKindRoomId(StaticTO.DB_KIND_ROOM_NAME + "_" + String.valueOf(kindRoomTO.getKindroom_id()));
                    listUploadResouce.add(listUploadResouceTO);
                    // giá theo từng loại phòng
                    ArrayList<PriceRoomTO> listPriceRoomTO=roomOfALLDA.retrievePrice(kindRoomTO.getKindroom_id(),regionTO.getRegion_id());
                    // lấy giảm giá nếu có
                    ArrayList<PromoteTO> listPromoteTO=new ArrayList<PromoteTO>();
                    ArrayList listService=new ArrayList();
                    // dem so phong
                    int NumOfRoom=roomOfALLDA.countRoom(regionTO.getRegion_id(),kindRoomTO.getKindroom_id(),Integer.parseInt(numOfPeo));
//                    listNumOfRoom.add(NumOfRoom);
                    ArrayList<Integer> listNumOfRoom=new ArrayList<Integer>();
                    for (int j = 0; j <listPriceRoomTO.size() ; j++) {
                        PromoteTO promoteTO=promoteDA.retreivePromoteByPrice(listPriceRoomTO.get(j).getPrice_id());
                        ArrayList<ServiceTO> listServiceTO=serviceDA.retrieveServiceByPrice(listPriceRoomTO.get(j).getPrice_id());
                        listPromoteTO.add(promoteTO);
                        listService.add(listServiceTO);


                    }

                    listAllRoom.add(NumOfRoom);
                    listServiceAll.add(listService);
                    listPromote.add(listPromoteTO);
                    listPriceRoom.add(listPriceRoomTO);

                }
            }

            request.setAttribute("listUploadResouce", listUploadResouce);
            request.setAttribute("listPriceRoom", listPriceRoom);
            request.setAttribute("listPromote", listPromote);
            request.setAttribute("listServiceAll", listServiceAll);
            request.setAttribute("listAllRoom", listAllRoom);

            forward("paymentView.jsp", request, response);

        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
