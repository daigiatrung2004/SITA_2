package DTO;

public class SearchTO {
    private UploadResourceTO uploadResourceTO;
    private KindRoomTO kindRoomTO;
    private RegionTO regionTO;
    private int room_id;



    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public SearchTO(UploadResourceTO uploadResourceTO, KindRoomTO kindRoomTO, RegionTO regionTO) {

        this.uploadResourceTO = uploadResourceTO;
        this.kindRoomTO = kindRoomTO;
        this.regionTO = regionTO;
    }


    public UploadResourceTO getUploadResourceTO() {
        return uploadResourceTO;
    }

    public void setUploadResourceTO(UploadResourceTO uploadResourceTO) {
        this.uploadResourceTO = uploadResourceTO;
    }

    public SearchTO(KindRoomTO kindRoomTO, RegionTO regionTO) {
        this.kindRoomTO = kindRoomTO;
        this.regionTO = regionTO;
    }

    public KindRoomTO getKindRoomTO() {
        return kindRoomTO;
    }

    public void setKindRoomTO(KindRoomTO kindRoomTO) {
        this.kindRoomTO = kindRoomTO;
    }

    public RegionTO getRegionTO() {
        return regionTO;
    }

    public void setRegionTO(RegionTO regionTO) {
        this.regionTO = regionTO;
    }
    public int getRoom_id() {
        return room_id;
    }
}
