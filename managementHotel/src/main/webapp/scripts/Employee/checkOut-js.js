$(document).ready(function () {
    searchProductFood("");
    searchService("");
    $("#searchFood").keyup(function () {
        var keyword = $("#searchFood").val();
        searchProductFood(keyword);

    });
    $("#searchService").keyup(function () {
        var keyword = $("#searchService").val();
        searchService();
    });
    $("#cancelBooking").click(function () {
        var r = confirm("Bạn chắc chắn muốn hủy kết quả đặt phòng này chứ???");

        if (r == true) {

            cancelBooking();
        }
    });
    $("#saveCheckOut").click(function(){
        // alert("xin chao");
        saveData();
    })
    // $("#checkOutNow").click(function(){
    //     alert("xin chao");
    // });


});
$(document).on('click', '.main-item-service-check-out', function () {

    const formatterCurrency = new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'USD',
        minimumFractionDigits: 0
    });
    var id = $(this).data("id");
    var name = $(this).data("name");
    var longPrice = $(this).data("price");
    var price = formatterCurrency.format($(this).data("price")).replace("$", "");
    // alert("id=" + id + "name=" + name + "price=" + price);
    // psh

    if (!$(".table-invoice tbody tr").hasClass("item-" + id)) {
        var tong = $(".tong").data("price");
        tong += longPrice;
        $(".tong").data('price', tong);
        $(".tong").text(formatterCurrency.format(tong).replace("$", ""));
        // alert("khong co item-"+id);
        $(".table-invoice tbody").append("<tr class='item-" + id + "' name='"+id+"'><" +
            "td>" + name + "</td>" +
            "<td>" + price + "</td>" +
            "<td>" +
            "<div style='display: flex'>" +
            "<div class='item-action '><button class='sub' name='SL-" + id + "'  data-price='" + longPrice + "' disabled='true'>-</button></div>" +
            "<div class=''><input type='number' value='1' readonly class='SL' id='SL-" + id + "' name='SL-" + id + "' style='margin:0px 10px;' min='1' ></div>" +
            "<div class='item-action '><button class='plus' name='SL-" + id + "' data-price='" + longPrice + "'>+</button></div>" +
            "</div>" +
            "</td>" +
            "<td><span class='price-product' data-price='" + longPrice + "' id='product-SL-" + id + "' >" + price + "</span></td>" +
            "<td style='display: flex;justify-content: center'><span class='close item-close' name='item-" + id + "' data-price='" + longPrice + "'><i class=\"fas fa-times-circle\"></i></span></td>" +
            "</tr>");
        tongProduct();
    } else {
        $(".item-" + id + " .plus").click();
    }


});
$(document).on('click', '.close', function () {
    const formatterCurrency = new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'USD',
        minimumFractionDigits: 0
    });
    var pos = $(this).attr("name");
    var price = $(this).data('price');
    var tong = $(".tong").data('price');
    tong -= price;
    $(".tong").data('price', tong);
    $(".tong").text(formatterCurrency.format(tong).replace("$", ""));
    $("." + pos).remove();
    // alert(pos);
    tongProduct();
});
$(document).on('click', '.sub', function () {
    const formatterCurrency = new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'USD',
        minimumFractionDigits: 0

    });
    var input = $(this).attr("name");
    var count = $("#" + input).val();

    count--;

    if (count == 1) {

        $(".sub").prop("disabled", true);
    }
    var priceProduct = $("#product-" + input).data("price") * count;
    $("#product-" + input).text(formatterCurrency.format(priceProduct).replace("$", ""));

    // alert("count" + count);
    var price = $(this).data('price');
    // alert("price" + price);
    if (price != NaN) {

        var tong = $(".tong").data('price');

        tong -= price;

        $(".tong").data("price", tong);
        $(".tong").text(formatterCurrency.format(tong).replace("$", ""));

        $("#" + input).val(count);

    }
    tongProduct();

});
$(document).on('click', '.plus', function () {
    const formatterCurrency = new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'USD',
        minimumFractionDigits: 0
    });
    $(".sub").prop("disabled", false);
    var input = $(this).attr("name");
    var count = $("#" + input).val();
    count++;
    var price = $(this).data('price');
    // alert(price);
    if (price != NaN) {
        var tong = $(".tong").data('price');
        tong += price;
        $(".tong").data("price", tong);
        $(".tong").text(formatterCurrency.format(tong).replace("$", ""))
        var priceProduct = $("#product-" + input).data("price") * count;
        $("#product-" + input).text(formatterCurrency.format(priceProduct).replace("$", ""));
        $("#" + input).val(count);
    }
    tongProduct();
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

function searchProductFood(keyword) {
    $("#div-food").show();
    $('#spinerfood').show();

    var xmlhttp = getXMLHTTP();
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            $('#spinerfood').hide();
            $("#div-food").hide();
            var data = xmlhttp.responseText;
            $(".content-food").html("");
            $(".content-food").html(data);
        }
    };
    xmlhttp.open("POST", "AjaxServiceCheckOut?cate_id=11&keyword=" + keyword, true);
    xmlhttp.send();
}

function searchService(keyword) {
     $('#div-services').show();
    $('#spiner').show();
    var xmlhttp = getXMLHTTP();
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            $('#spiner').hide();
            $('#div-services').hide();
            var data = xmlhttp.responseText;
            $(".content-service").html("");
            $(".content-service").html(data);
        }
    };
    xmlhttp.open("POST", "AjaxServiceCheckOut?cate_id=12&keyword=" + keyword, true);
    xmlhttp.send();
}

function tongProduct() {
    const formatterCurrency = new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'USD',
        minimumFractionDigits: 0
    });
    var tong = 0;
    $(".price-product").each(function () {
        var priceStr = $(this).text();
        var split = priceStr.split(",");
        var temp = "";

        for (let i = 0; i < split.length; i++) {
            temp += split[i];
        }
        priceStr = temp;
        tong += parseInt(priceStr);
    });
    $(".sumProduct").data("product", tong);
    $(".sumProduct").text(formatterCurrency.format(tong).replace("$", ""));
}

function cancelBooking() {

    var roomId = $("#roomId").val();
    var xmlhttp = getXMLHTTP();
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            var data = xmlhttp.responseText;
            var json = JSON.parse(data);
            if (json['success']) {
               alert("Thành công");
               location.href="/managementHotel_war_exploded/ListingRoom";
              location.reload();

            }
        }
    }
    xmlhttp.open("POST", "AjaxCheckOut?roomId="+roomId+"&type=cancelBooking", true);
    xmlhttp.send();
}
function saveData(){
    $(".loading-saveOrder").show();
   var bookindId=$("#bookingId").val();
   var listProduct=new Array();
   var listsoluong=new Array();
    var roomId = $("#roomId").val();
   var i=0;
   $(".table-invoice tbody tr").each(function(){
       var id=$(this).attr("name");
       listProduct[i]=id;
       listsoluong[i]=$("#SL-"+id).val();
       i++;
   });
   if(i>0) {
       var xmlhttp = getXMLHTTP();
       xmlhttp.onreadystatechange = function () {
           if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
               var data = xmlhttp.responseText;
               var json = JSON.parse(data);
               if (json['success']) {
                   $(".loading-saveOrder").hide();
                   alert("Thành công");
                   location.href = "/managementHotel_war_exploded/ListingRoom";
                   location.reload();

               }
           }
       }
       xmlhttp.open("POST", "AjaxCheckOut?roomId=" + roomId + "&type=save&bookindId=" + bookindId + "&listProduct=" + listProduct + "&listsoluong=" + listsoluong, true);
       xmlhttp.send();
   }

}
