$(document).ready(function () {
    $("#btn-region").click(function () {
        var vi = $("#vi_name").val();
        var en = $("#en_name").val();

        insert(vi, en, "region");
    });
    $("#btn-kind-room").click(function () {
        var vi = $("#vi_name_kind").val();
        var en = $("#en_name_kind").val();
        insert(vi, en, "kindroom");
    });
    $("#btn-room").click(function () {
        insert("", "", "room");
    });
    $("#btn-price-room").click(function(){
        insert("", "", "price-room");
    });

});

function getXMLHTTP() {
    if (window.XMLHttpRequest) {
        return new XMLHttpRequest();

    }
    if (window.ActiveXObject) {
        return new ActiveXObject("Microsoft.XMLHTTP");

    }
    return null;

}

function insert(vi, en, type) {


    var xmlhttp = getXMLHTTP();
    var url_ = "";
    if (type === "room") {
        var name = $("#name_room").val();
        var kindroom = $("#select-kind-room").val();
        var region = $("#select-region").val();
        var maxPeople = $("#max_peo").val();

        url_ = "name=" + name + "&kindroom=" + kindroom + "&region=" + region + "&type=" + type + "&max_peo=" + maxPeople;
    }else if(type==="price-room"){
        var type_vi=$("#type_vi").val();
        var type_en=$("#type_en").val();
        var kindroom = $("#select-kind-room-id").val();
        var price=$("#price").val();
        url_="type_vi="+type_vi+"&type_en="+type_en+"&kindroom="+kindroom+"&price="+price+"&type=price_room";

    }else{
        url_="vi_region=" + vi + "&en_region=" + en + "&type=" + type;
    }
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            var data = xmlhttp.responseText;

            var json = JSON.parse(data);

            if (json['success']) {
                if (type === 'kindroom') {
                    $("#result-insert-kind-room").text("Thành công");
                } else if (type === 'room') {
                    $("#result-insert-room").text("Thành công");
                } else if(type==='price-room'){
                    $("#result-price-room").text("Thành công");
                }
                else {
                    $("#result-insert-region").text("Thành công");
                }


            } else {
                if (type === 'kindroom') {
                    $("#result-insert-kind-room").text("Thất bại");
                } else if (type === 'room') {
                    $("#result-insert-room").text("Thất bại");
                } else if(type==='price-room'){
                    $("#result-price-room").text("Thất bại");
                }
                else {
                    $("#result-insert-region").text("Thất bại");
                }


            }
        }
    };
    xmlhttp.open("POST", "SettingManagerHotel?" + url_, true);
    xmlhttp.send();
}
