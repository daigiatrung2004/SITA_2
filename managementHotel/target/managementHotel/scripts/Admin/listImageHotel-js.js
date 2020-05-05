$(document).ready(function(){
    $(".close-item-img").click(function(){
        var r=confirm("Bạn có chắc muốn xóa hình ảnh này??");
        if(r) {
            var id = $(this).data("id");
            // alert(id);
            $("#item-" + id).remove();
            removeImg(id);
        }
    });

});
function getXMLHttp(){
    if(window.XMLHttpRequest){
        return new XMLHttpRequest();
    }
    if(window.ActiveXObject){
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
    return null;
}
function removeImg(id){
    var url="id="+id+"&type=delete";
    var xmlhttp=getXMLHttp();
    xmlhttp.onreadystatechange=function(){
        if(xmlhttp.readyState==4&&xmlhttp.status==200){
                var data=xmlhttp.responseText;
                var json=JSON.parse(data);
                if(json["success"]){
                    alert("Xóa thành công");
                }
        }
    }
    xmlhttp.open("POST",'AjaxInsertImageHotel?'+url,true);
    xmlhttp.send();
}