$(document).ready(function () {
    $(".btn--price-select").click(function (e) {

        var data = $(this);
        goPageContinue(1, data);
    });
});

$("#step-payment-finish").click(function () {
    var data = $(this);
    goPageContinue(2, data);
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

function goPageContinue(case_condition, data) {
    var price = data.data('price');
    var kind_room_id = data.data('kindroom');
    var region_id = data.data('region');
    var price_id = data.data('typeprice');
    var numberOfPeo = data.data('numberofpeople');
    var checkin = data.data('checkin');
    var checkout = data.data('checkout');
    var price_type=data.data('price-type');
    $('#dimmer').dimmer('show');
    var url = "price=" + price + "&kind_room_id=" + kind_room_id + "&region_id=" + region_id + "&price_id=" + price_id + "&numberOfPeo=" + numberOfPeo + "&checkin=" + checkin + "&checkout=" + checkout+"&price_type="+price_type;
    var xmlhttp = getXMLHTTP();
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            $(".main-payment").html(xmlhttp.responseText);
            $('#dimmer').dimmer('hide');
        }
    }
    if (case_condition === 1) {

        // alert("price:" + price + "kind_room_id:" + kind_room_id + "region_id:" + region_id + "price_id:" + price_id + "numberOfPeo:" + numberOfPeo + "checkin:" + checkin + "checkout:" + checkout);
        xmlhttp.open("POST", "AjaxPaymentContinue?" + url, true);
    } else if (case_condition === 2) {
        var room_id = data.data('room');
        var arraySelectAddition = Array();
        var count=0;
        $(".checkbox-trans").each(function () {
            if ($(this).prop("checked")) {
                arraySelectAddition[count]=$(this).data('transport');
                count++;
            }
        });

        // alert("price:" + price + "kind_room_id:" + kind_room_id + "region_id:" + region_id + "price_id:" + price_id + "numberOfPeo:" + numberOfPeo + "checkin:" + checkin + "checkout:" + checkout+"arraySelectAddition:"+arraySelectAddition);
        xmlhttp.open("POST", "AjaxPaymentEndPoint?" + url + "&room_id=" + room_id+"&arraySelectAddition="+arraySelectAddition, true);
    }
    xmlhttp.send();

}

