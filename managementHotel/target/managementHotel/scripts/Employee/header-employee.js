$(document).ready(function () {
    $(".user").click(function () {
        $(".menu-user-pos").show();
    });

    $(".div-header-employee ,.welcome-div-employee,footer,.menu-task,body,.user-pos").click(function(e){
        if(e.target!=this){
            return;
        }
        $(".menu-user-pos").hide();
    });
    $(".main-menu").mouseenter(function(){
         var name=$(this).attr("name");


         $("."+name).show();
    });
    $(".main-menu").mouseleave(function() {
        var name=$(this).attr("name");
        $("."+name).hide();
    });
    $(".pos-booking").mouseenter(function(){
          $(this).show();
    });
    $(".pos-booking").mouseleave(function(){
        $(this).hide();
    });

});