$(document).ready(function(){
    $(".language-header").click(function(){
        $(".lang-pos").toggle();
    });
  $(".lang-pos").click(function(){
      changeLanguage();
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
function changeLanguage(){
   var xmlhttp=getXMLHTTP();
   var str="lang="+$("#langVal").val();
   xmlhttp.onreadystatechange=function(){
       if(xmlhttp.readyState==4 && xmlhttp.status==200){
            var data=xmlhttp.responseText;
            var json=JSON.parse(data);
            if(json["success"]){
                location.reload();
            }
       }
   };
    xmlhttp.open("POST", "AjaxChangeLanguage?" + str, true);
    xmlhttp.send();
}
