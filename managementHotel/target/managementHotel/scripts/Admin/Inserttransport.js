$(document).ready(function () {
    $("#btn-trans").click(function () {

        insertTrans();
    });
    $("#btn-fee-other").click(function () {
        insertFeeOther();
    });
    $("#btn-trans-region").click(function () {
        insertTransRegion();
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
function insertTransRegion(){
    var region_trans=$("#region-trans").val();
    var trans_select=$("#trans-select").val();
    var url="region_trans="+region_trans+"&trans_select="+trans_select+"&type=region";
    insertTransportation(url);

}

function insertFeeOther() {
    var name_fee_other_vi = $("#name_fee_other_vi").val();
    var name_fee_other_en = $("#name_fee_other_en").val();
    var price_fee_other = $("#price-fee-other").val();
    var url="name_fee_other_vi="+name_fee_other_vi+"&name_fee_other_en="+name_fee_other_en+"&price_fee_other="+price_fee_other+"&type=other";
    insertTransportation(url);
}

function insertTrans() {
    var name_trans_vi = $("#name_trans_vi").val();
    var name_trans_en = $("#name_trans_en").val();
    var detail_trans_en = tinymce.get('detail_trans_en').getContent();
    var detail_trans_vi =tinymce.get('detail_trans_vi').getContent();
    var price_trans = $("#price_trans").val();
    var url = "name_trans_vi=" + name_trans_vi + "&name_trans_en=" + name_trans_en + "&detail_trans_en=" + detail_trans_en
        + "&detail_trans_vi=" + detail_trans_vi + "&price_trans="+price_trans;
    insertTransportation(url);


}
function insertTransportation(url){
    // alert(url);
    var xmlhttp = getXMLHTTP();
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
    };
    xmlhttp.open("POST", "AjaxInsertTransport?" + url, true);
    xmlhttp.send();
}