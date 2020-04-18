$(document).ready(function(){
$("#btn-room").click(function(){
    var i=$("#amount").val();
    for (var j = 0; j <i ; j++) {
        insertRoom(j);
    }
    alert("xong");
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
function insertRoom(nameroom) {


    var xmlhttp = getXMLHTTP();
    var url_ = "";

        var name = nameroom;
        var kindroom = $("#select-kind-room").val();
        var priceroom = $("#select-price-room-id-2").val();

        var region = $("#select-region").val();
        var maxPeople = $("#max_peo").val();
        // alert(priceroom);
        url_ = "name=" + name + "&kindroom=" + kindroom + "&region=" + region + "&type=room"+ "&max_peo=" + maxPeople + "&priceroom=" + priceroom;

    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            var data = xmlhttp.responseText;

            var json = JSON.parse(data);


        }
    };
    xmlhttp.open("POST", "SettingManagerHotel?" + url_, true);
    xmlhttp.send();
}