package servlet;

import DAO.*;
import DTO.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class PaymentLoadView extends WebServlet {
    @Override
    protected void process(HttpServletRequest request, HttpServletResponse response) {
        try {
            ArrayList<SearchTO> listSearchTO = (ArrayList<SearchTO>) request.getAttribute("listSearchNew");
            String numOfPeo = request.getAttribute("numOfPeo") != null ? (String) request.getAttribute("numOfPeo") : "0";
            String location = request.getParameter("location") != null ? (String) request.getParameter("location") : "";
            String checkIn = request.getParameter("checkIn") != null ? (String) request.getParameter("checkIn") : "";
            String checkOut = request.getParameter("checkOut") != null ? (String) request.getParameter("checkOut") : "";
            String promote = request.getParameter("promote") != null ? (String) request.getParameter("promote") : "";
            UploadResourceDA uploadResourceDA = new UploadResourceDA();
            RoomOfALLDA roomOfALLDA = new RoomOfALLDA();
            PromoteDA promoteDA = new PromoteDA();
            ServiceDA serviceDA = new ServiceDA();

            ArrayList listUploadResouce = new ArrayList();
            ArrayList listPriceRoom = new ArrayList();
            UploadResourceTO uploadResourceTO = null;
            ArrayList listPromote = new ArrayList();
            ArrayList listServiceAll = new ArrayList();
            ArrayList listAllRoom = new ArrayList();
            int region_idInt, numberOfPeo;
            try {
                region_idInt = Integer.parseInt(location);
            } catch (NumberFormatException e) {
                region_idInt = 0;
            }
            try {
                numberOfPeo = Integer.parseInt(numOfPeo);
            } catch (NumberFormatException e) {
                numberOfPeo = 0;
            }
            BookingDA bookingDA = new BookingDA();
            ArrayList<Integer> listPosRemove = new ArrayList<>();
            //
            if (listSearchTO != null) {
                if (listSearchTO.size() > 0) {
                    for (int i = 0; i < listSearchTO.size(); i++) {
                        // Kiem tra khả năng đụng độ khi đặt phòng
                        KindRoomTO kindRoomTO = listSearchTO.get(i).getKindRoomTO();
                        ArrayList<RoomTO> listRoom = roomOfALLDA.retrieveRoomByRegionKindRoom(region_idInt, numberOfPeo, kindRoomTO.getKindroom_id());
                        RoomTO roomSelected = null;
                        boolean checkKindRoomExistRoom = false;
                        for (RoomTO roomTO : listRoom) {
                            if (!bookingDA.checkBookingByRoom(kindRoomTO.getKindroom_id(), region_idInt, checkOut, roomTO.getRoom_id())) {
                                // kiểm tra đụng độ khi đặt phòng
                                checkKindRoomExistRoom = true;

                                break;
                            }

                        }
                        if (!checkKindRoomExistRoom) {
                            listPosRemove.add(i);
                        }
                        //
                        RegionTO regionTO = listSearchTO.get(i).getRegionTO();
                        // load du lieu hinh ảnh theo từng loại phòng
                        ArrayList<UploadResourceTO> listUploadResouceTO = uploadResourceDA.retrieveUploadByKindRoomId(StaticTO.DB_KIND_ROOM_NAME + "_" + String.valueOf(kindRoomTO.getKindroom_id()));
                        listUploadResouce.add(listUploadResouceTO);
                        // giá theo từng loại phòng
                        ArrayList<PriceRoomTO> listPriceRoomTO = roomOfALLDA.retrievePrice(kindRoomTO.getKindroom_id(), regionTO.getRegion_id());
                        // lấy giảm giá nếu có
                        ArrayList<PromoteTO> listPromoteTO = new ArrayList<PromoteTO>();
                        ArrayList listService = new ArrayList();
                        // dem so phong
                        int NumOfRoom = roomOfALLDA.countRoom(regionTO.getRegion_id(), kindRoomTO.getKindroom_id(), Integer.parseInt(numOfPeo));
//                      listNumOfRoom.add(NumOfRoom);
                        if(NumOfRoom>0) {
                            ArrayList<Integer> listNumOfRoom = new ArrayList<Integer>();
                            for (int j = 0; j < listPriceRoomTO.size(); j++) {
                                PromoteTO promoteTO = promoteDA.retreivePromoteByPrice(listPriceRoomTO.get(j).getPrice_id());
                                ArrayList<ServiceTO> listServiceTO = serviceDA.retrieveServiceByPrice(listPriceRoomTO.get(j).getPrice_id());
                                listPromoteTO.add(promoteTO);
                                listService.add(listServiceTO);


                            }
                            // chon phong vs set dieu kien ngay tai cho nay check in

                            listAllRoom.add(NumOfRoom);
                            listServiceAll.add(listService);
                            listPromote.add(listPromoteTO);
                            listPriceRoom.add(listPriceRoomTO);
                        }else{
                            forward("notProduct.jsp", request, response);
                        }

                    }
                    //tính toán promote code khi khách hàng nhập vào
                    if(!promote.equals("")){
                        String codeValue="0";
                        ArrayList<PromoteTO> listAllPromote =promoteDA.retreiveAllPromote();
                        for (int i = 0; i <listAllPromote.size() ; i++) {
                            if(listAllPromote.get(i).getPro_code().equals(promote)){
                                codeValue=listAllPromote.get(i).getPro_value();
                            }
                        }
                        String a=codeValue;
                        request.setAttribute("codeValue",codeValue);
                    }
                    // loai bỏ các loại phòng dã hết phòng
                    if (listPosRemove != null) {
                        for (int i = 0; i < listPosRemove.size(); i++) {
                            listSearchTO.remove(listPosRemove.get(i));
                        }
                        request.removeAttribute("listSearchNew");
                        request.setAttribute("listSearchNew", listSearchTO);
                        if (listSearchTO.size() == 0) {
                            forward("notProduct.jsp", request, response);
                        }
                    }
                } else {
                    forward("notProduct.jsp", request, response);
                }

            }
            // tính số ngày ở
            int songaythue=1;
            DateFormat dateFormat=new SimpleDateFormat("dd/MM/yyyy");
            Date checkinDate=null,checkOutDate=null;

            if(!checkIn.equals("")){
                try {
                    checkinDate=dateFormat.parse(checkIn);
                    checkOutDate=dateFormat.parse(checkOut);
                } catch (ParseException e) {
                    checkinDate=null;
                    checkOutDate=null;
                }
                int songay=1;
                if(checkinDate!=null&&checkOutDate!=null){
                    long timeLong=checkOutDate.getTime()-checkinDate.getTime();
                    timeLong=timeLong/(24*60*60*1000);
                    String timeStr=String.valueOf(timeLong);
                    songay=Integer.parseInt(timeStr);
//                    System.out.println("songay:"+songay);
                    request.setAttribute("songay",String.valueOf(songay));
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
