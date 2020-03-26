package DTO;

public class ServiceRoomTO {
    private long id_service_room;
    private int id_service;
    private int price_id;

    public ServiceRoomTO(long id_service_room, int id_service, int price_id) {
        this.id_service_room = id_service_room;
        this.id_service = id_service;
        this.price_id = price_id;
    }

    public long getId_service_room() {
        return id_service_room;
    }

    public void setId_service_room(long id_service_room) {
        this.id_service_room = id_service_room;
    }

    public int getId_service() {
        return id_service;
    }

    public void setId_service(int id_service) {
        this.id_service = id_service;
    }

    public int getPrice_id() {
        return price_id;
    }

    public void setPrice_id(int price_id) {
        this.price_id = price_id;
    }
}
