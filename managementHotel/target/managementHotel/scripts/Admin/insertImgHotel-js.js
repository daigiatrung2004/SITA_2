$(document).ready(function(){
    $("#insert-img-resource").click(function () {

        var input_img = $("#input-file-now").val();

        var filename_origin = input_img.split("\\").pop();
        var input_img_src = $("#myModal .dropify-render img").attr("src");

        count = $(".div-array-img img").length;


            $(".div-array-img").prepend("<img  style='height: 100px;width: 100px;margin:10px;background-size: cover;background-position: center' src='" + input_img_src + "' name='" + filename_origin + "'>"
            );


    });
    $("#btn-img-room").click(function () {

        insertImg();
    });
});
function insertImg() {
    var listSrc = "";
    var listImgOrgin = "";
    var count = 0;
    var kindroom = $("#kindroom").val();
    var count = 0;
    var region=$("#region").val();
    var checkSuccess=false;
    var dem = $(".div-array-img img").length;
    // alert(dem);
    $(".div-array-img img").each(function () {
        // if (count > 0) {
        //     listSrc += "." + $(this).attr("src");
        //     listImgOrgin += "," + $(this).attr("name");
        // } else {
        //     listSrc += $(this).attr("src");
        //     listImgOrgin += $(this).attr("name");
        // }

        listSrc=$(this).attr("src");
        listImgOrgin=$(this).attr("name");
        $.ajax({
            url: 'AjaxInsertImageHotel',
            type: 'POST',
            dataType: 'JSON',
            data: {
                listSrcData: JSON.stringify(listSrc),
                listImgOrginData: JSON.stringify(listImgOrgin),
                region:region
            },
            success: function (data) {
                if (data['success']) {
                    // alert(data['success']);
                    checkSuccess=true;
                } else {
                    checkSuccess=false;
                }
            }
        });
        // alert(count);
       if(count==dem-1){
           alert("Thành công");

       }
           count++;
    });

    var url = "listSrc=" + listSrc + "&listImgOrgin=" + listImgOrgin+"&region="+region;
    window.location.href = "./ImageManagerHotel";


    // $("#listsrc").val(listSrc);
    // $("#listomgorgin").val(listImgOrgin);
    // alert(region);
    // $("#frm-img").submit();


}