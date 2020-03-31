$(document).ready(function () {
    $("#insertPositionEmployee,#insertEmployee").click(function () {
        var index = $(this).attr("name");

        Insert(index);
    });
});
function getXMLHTTP(){
    if(window.XMLHttpRequest){
        return new XMLHttpRequest();
    }
    if(window.ActiveXObject){
        return  new ActiveXObject("Microsoft.XMLHTTP");
    }
    return null;

}
function Insert(index) {
    alert("index" + index);
    var xmlhttp =getXMLHTTP();
    var str = ""
    if (index === "1") {
        var name=$("#name").val();
        str="name="+name;
    }else{
        var position=$("#position").val();
        var firstName=$("#firstname").val();
        var lastName=$("#lastname").val();
        var username=$("#username").val();
        var pwd=$("#pwd").val();
        var address=$("#address").val();
        var country=$("#country").val();
        var phone=$("#phone").val();
        var email=$("#email").val();
        var salary=$("#salary").val();
        var region=$("#region").val();
        str="position="+position+"&firstName="+firstName+"&lastName="+lastName;
        str+="&username="+username+"&pwd="+pwd+"&address="+address+"&country="+country+"&phone="+phone+"&email="+email+"&salary="+salary+"&type=2&region="+region;
        alert(str);
    }
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            var r=xmlhttp.responseText;
            var json=JSON.parse(r);
            alert(json["success"]);
            if(json["success"]) {
               if(index === "1"){
                   $(".error-position").text("Thành công");
               }else{
                   $(".error").text("Thành công");
               }

            }

        }
    };
    xmlhttp.open("POST", "HR?" + str, true);
    xmlhttp.send();
}