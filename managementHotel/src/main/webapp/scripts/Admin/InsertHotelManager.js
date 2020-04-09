$(document).ready(function () {
    $("#btn-region").click(function () {
        var vi = $("#vi_name").val();
        var en = $("#en_name").val();

        insert(vi, en, "region");
    });
    //insert ảnh cho bang service
    $("#insert-img-service").click(function () {
        $(".modal-backdrop.show").hide();
        var input_img = $("#input-file-service").val();
        var filename_origin = input_img.split("\\").pop();
        var input_img_src = $("#myModal_service .dropify-render img").attr("src");
        $(".img-service-div img").remove();

        $(".img-service-div").append("<img  style='background-size: cover;background-position: center' src='" + input_img_src + "' name='" + filename_origin + "'>");
    });

    //them anh cho bang upload resouce
    $("#insert-img-resource").click(function () {

        var input_img = $("#input-file-now").val();

        var filename_origin = input_img.split("\\").pop();
        var input_img_src = $("#myModal .dropify-render img").attr("src");
        var count = 0;
        count = $(".div-array-img img").length;

        if (count <= 4) {
            $(".div-array-img").append("<img  style='height: 100px;width: 100px;margin:10px;background-size: cover;background-position: center' src='" + input_img_src + "' name='" + filename_origin + "'>"
            );
        }
    });

    //thêm loại phòng
    $("#btn-kind-room").click(function () {
        var vi = $("#vi_name_kind").val();
        var en = $("#en_name_kind").val();
        insert(vi, en, "kindroom");
    });
    //thêm phòng
    $("#btn-room").click(function () {
        insert("", "", "room");
    });
    // thêm giá phòng
    $("#btn-price-room").click(function () {
        insert("", "", "price-room");
    });
    // thêm ảnh phòng
    $("#btn-img-room").click(function () {

        insertImg();
    });
    // thêm dịch vụ
    $("#insert-service").click(function () {
        insertService();
    });
    // thêm dữ liệu dịch vụ theo từng loại giá tiền
    $("#btn-service-room").click(function () {
        serviceRoom();
    });
    // thêm code giảm giá
    $("#btn-promotion").click(function () {

        insertPromoteBefore();
    });
    $("#btn-promote-price").click(function () {
        insertPromotePrice();
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

function insertPromotePrice() {
    var promote_id = $("#promote_id").val();
    var price_id = $("#price_id").val();
    var url = "promote_id=" + promote_id + "&price_id=" + price_id + "&type=promoteprice";
    insertPromote(url);
}

function insertPromoteBefore() {
    var pro_code = $("#code_promote").val();
    var pro_value = $("#value_promote").val();
    var expired_date = $("#expried_date").val();
    var splitExprired = expired_date.split("/");

    expired_date = splitExprired[2] + "-" + splitExprired[0] + "-" + splitExprired[1];
    // alert("expired_date:" + expired_date + "pro_value:" + pro_value + "pro_code:" + pro_code);
    var url = "pro_code=" + pro_code + "&pro_value=" + pro_value + "&expired_date=" + expired_date;
    // alert("urlbefore"+url);
    insertPromote(url);

}

function insertPromote(url) {
    alert(url);
    var xmlhttp = getXMLHTTP();
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            var data = xmlhttp.responseText;
            var json = JSON.parse(data);
            if (json['success']) {
                alert("Thành công");
            } else {
                alert("Thất bại");
            }
        }
    }
    xmlhttp.open('POST', 'AjaxPromoteCode?' + url, true);
    xmlhttp.send();
}


function serviceRoom() {
    var listService = $("#service").val();
    var type_price = $("#type_price").val();
    alert("listService:" + listService + "type_price:" + type_price);
    var xmlhttp = getXMLHTTP();
    var url = "listService=" + listService + "&type_price=" + type_price;
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            var data = xmlhttp.responseText;
            var json = JSON.parse(data);
            if (json['success']) {
                alert('thành công');
            } else {
                alert('thất bại');

            }
        }
    }
    xmlhttp.open('POST', 'AjaxInsertServiceRoom?' + url, true);
    xmlhttp.send();

}

function insertService() {
    var listSrc = "";
    var listImgOrgin = "";
    var count = 0;
    var name_service_vi = $("#name_service_vi").val();
    var name_service_en = $("#name_service_en").val();
    var content_service_vi = $("#content_service_vi").val();
    var content_service_en = $("#content_service_en").val();

    // alert("name:"+name_service_vi+"content:"+content_service_vi);
    var count = 0;
    $(".img-service-div img").each(function () {
        if (count > 0) {
            listSrc += "." + $(this).attr("src");
            listImgOrgin += "," + $(this).attr("name");
        } else {
            listSrc += $(this).attr("src");
            listImgOrgin += $(this).attr("name");
        }
        count++;

    });
    var url = "listSrc=" + listSrc + "&listImgOrgin=" + listImgOrgin;
    $.ajax({
        url: 'AjaxInsertService',
        type: 'POST',
        dataType: 'JSON',
        data: {
            listSrcData: JSON.stringify(listSrc),
            listImgOrginData: JSON.stringify(listImgOrgin),
            name_service_vi: name_service_vi,
            name_service_en: name_service_en,
            content_service_vi: content_service_vi,
            content_service_en: content_service_en
        },
        success: function (data) {
            if (data['success']) {
                alert("Thành công");
            } else {
                alert("Thất bại");
            }
        }
    });
}

function insertImg() {
    var listSrc = "";
    var listImgOrgin = "";
    var count = 0;
    var kindroom = $("#kindroom").val();
    var count = 0;
    $(".div-array-img img").each(function () {
        if (count > 0) {
            listSrc += "." + $(this).attr("src");
            listImgOrgin += "," + $(this).attr("name");
        } else {
            listSrc += $(this).attr("src");
            listImgOrgin += $(this).attr("name");
        }
        count++;

    });
    var url = "listSrc=" + listSrc + "&listImgOrgin=" + listImgOrgin;
    $.ajax({
        url: 'AjaxUploadResourceKindRoom',
        type: 'POST',
        dataType: 'JSON',
        data: {
            listSrcData: JSON.stringify(listSrc),
            listImgOrginData: JSON.stringify(listImgOrgin),
            kindroomData: kindroom
        },
        success: function (data) {
            if (data['success']) {
                alert("Thành công");
            } else {
                alert("Thất bại");
            }
        }
    });
}

function insert(vi, en, type) {


    var xmlhttp = getXMLHTTP();
    var url_ = "";
    if (type === "room") {
        var name = $("#name_room").val();
        var kindroom = $("#select-kind-room").val();
        var priceroom = $("#select-price-room-id-2").val();

        var region = $("#select-region").val();
        var maxPeople = $("#max_peo").val();
        // alert(priceroom);
        url_ = "name=" + name + "&kindroom=" + kindroom + "&region=" + region + "&type=" + type + "&max_peo=" + maxPeople + "&priceroom=" + priceroom;
    } else if (type === "price-room") {
        var type_vi = $("#type_vi").val();
        var type_en = $("#type_en").val();
        var kindroom = $("#select-kind-room-id").val();

        var price = $("#price").val();
        url_ = "type_vi=" + type_vi + "&type_en=" + type_en + "&kindroom=" + kindroom + "&price=" + price + "&type=price_room";

    } else {
        url_ = "vi_region=" + vi + "&en_region=" + en + "&type=" + type;
    }
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            var data = xmlhttp.responseText;

            var json = JSON.parse(data);

            if (json['success']) {
                if (type === 'kindroom') {
                    // $("#result-insert-kind-room").text("Thành công");
                    alert("Thành công");
                } else if (type === 'room') {
                    alert("Thành công");
                    // $("#result-insert-room").text("Thành công");
                } else if (type === 'price-room') {
                    // $("#result-price-room").text("Thành công");
                    alert("Thành công");
                } else {
                    // $("#result-insert-region").text("Thành công");
                    alert("Thành công");
                }


            } else {
                if (type === 'kindroom') {
                    // $("#result-insert-kind-room").text("Thất bại");
                    alert("Thất bại");
                } else if (type === 'room') {
                    alert("Thất bại");
                    // $("#result-insert-room").text("Thất bại");
                } else if (type === 'price-room') {
                    // $("#result-price-room").text("Thất bại");
                    alert("Thất bại");
                } else {
                    alert("Thất bại");
                    // $("#result-insert-region").text("Thất bại");
                }


            }
        }
    };
    xmlhttp.open("POST", "SettingManagerHotel?" + url_, true);
    xmlhttp.send();
}
