$(document).ready(function () {
    $(".language-header").click(function () {
        $(".lang-pos").toggle();
    });
    $(".lang-pos").click(function () {
        changeLanguage();
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

function changeLanguage() {
    var xmlhttp = getXMLHTTP();
    var str = "lang=" + $("#langVal").val();
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            var data = xmlhttp.responseText;
            var json = JSON.parse(data);
            if (json["success"]) {
                var url = window.location.href;
                // alert(url);
                // alert("index" + url.indexOf("/en/"));
                if (url.indexOf("/en/") > -1) {
                    window.location.href = url.replace("/en/", "/vi/");
                } else if (url.indexOf("/vi/") > -1) {
                    window.location.href = url.replace("/vi/", "/en/");
                } else {
                    location.reload();
                }
                // location.reload();
            }
        }
    };
    xmlhttp.open("POST", "http://localhost:8080/managementHotel_war_exploded/AjaxChangeLanguage?" + str, true);
    xmlhttp.send();
}
