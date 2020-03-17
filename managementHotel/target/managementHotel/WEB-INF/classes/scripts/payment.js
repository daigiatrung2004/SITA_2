$(document).ready(function () {
    $(".btn--price-select").click(function () {
        alert('xin chao');
        goPageContinue(1);
    });
});
$("#step-payment-finish").click(function(){
    goPageContinue(2);
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

function goPageContinue(case_condition){
    var xmlhttp = getXMLHTTP();
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                $(".main-payment").html(xmlhttp.responseText);
            }
        }
    if(case_condition===1) {
        xmlhttp.open("POST", "AjaxPaymentContinue", true);
    }else if(case_condition===2){
        xmlhttp.open("POST", "AjaxPaymentEndPoint", true);
    }
    xmlhttp.send();

}