$(document).ready(function(){
    $(".detail").click(function(){
        var name=$(this).attr("name");
        $(".modal").modal("hide");
        $("#"+name).modal("show");
    });
    $(".delete").click(function () {
        var id=$(this).data("id");
        var r=confirm("Bạn có chắc muốn xóa khu vực này?");
        if(r){
            deleteRegion(id);
        }
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
function deleteRegion(id){
  var xmlhttp=getXMLHTTP();
  xmlhttp.onreadystatechange=function () {
        if(xmlhttp.readyState==4&&xmlhttp.status==200){
             var data=xmlhttp.responseText;
             var json=JSON.parse(data);
             if(json["success"]){
                 alert("Thành công");
                 location.reload();
             }
        }
  }
  xmlhttp.open("POST","UpdateRegion?type=delete&id="+id,true);
  xmlhttp.send();
}
