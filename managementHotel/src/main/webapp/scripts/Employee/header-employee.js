$(document).ready(function () {
    $("#user-main").click(function (e) {
        // $(".menu-user-pos").show();

        $(".menu-user-pos").transition("slide down");


    });
    

    $(".main-menu").mouseenter(function () {
        var name = $(this).attr("name");


        $("." + name).show();
    });
    $(".main-menu").mouseleave(function () {
        var name = $(this).attr("name");
        $("." + name).hide();
    });
    $(".pos-booking").mouseenter(function () {
        $(this).show();
    });
    $(".pos-booking").mouseleave(function () {
        $(this).hide();
    });

});
