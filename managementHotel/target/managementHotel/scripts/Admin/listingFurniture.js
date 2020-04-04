$(document).ready(function(){
$("#btn-furniture").click(function(){
    var name_furniture_vi=$("#name_furniture_vi").val();
    var name_furniture_en=$("#name_furniture_en").val();
    var details=tinyMCE.get('details').getContent();
    var type_furniture=$("#type_furniture").val();
    var type_furniture_en=$("#type_furniture_en").val();
    var price_furniture=$("#price_furniture").val();
    var url="name_furniture_vi="+name_furniture_vi+"&name_furniture_en="+name_furniture_en+"&details="+details+"&type_furniture="+type_furniture
        +"&type_furniture_en="+type_furniture_en+"&price_furniture="+price_furniture;
    insertFurniture(url);
});
$("#furniture_room").click(function(){
    var furniture_select=$("#furniture_select").val();
    var kind_room=$("#kind_room").val();
    var url="furniture_select="+furniture_select+"&kind_room="+kind_room+"&type=furnitureroom";
    insertFurniture(url);
});

});
function getXMLHTTP(){
    if(window.XMLHttpRequest){
        return new XMLHttpRequest();

    }
    if(window.ActiveXObject){
        return new ActiveXObject("Miscrosoft.XMLHTTP");
    }
    return null;
}
function insertFurniture(url){

alert(""+url);
var xmlhttp=getXMLHTTP();
xmlhttp.onreadystatechange=function(){
  if(xmlhttp.readyState==4&&xmlhttp.status==200){
      var data=xmlhttp.responseText;
      var json=JSON.parse(data);
      if(json["success"]){
          alert("Thành công");
          location.reload();
      }else{
          alert("Thất bại");
      }
  }
};
xmlhttp.open("POST","AjaxInsertFurniture?"+url,true);
xmlhttp.send();

}
