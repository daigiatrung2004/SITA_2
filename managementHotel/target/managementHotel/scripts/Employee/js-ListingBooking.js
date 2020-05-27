$(document).ready(function () {
    var name=$("#searchReceive").val();
    getLingtingBooking(name);
    $("#searchReceive").keyup(function(){
        var name=$(this).val();
        getLingtingBooking(name);
    });
});

function getHTTPXML() {
    if (window.XMLHttpRequest) {
        return new XMLHttpRequest();
    }
    if (window.ActiveXObject) {
        return new ActiveXObject("Miscrosoft.XMLHTTP");
    }
    return null;
}

function getLingtingBooking(name) {
    var xmlhttp = getHTTPXML();
    $(".loading").show();
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            $(".loading").hide();
            $(".details-booking").html(xmlhttp.responseText);
        }
    };
    xmlhttp.open("GET", "AjaxListingBooking?name="+name, true);
    xmlhttp.send();
}
