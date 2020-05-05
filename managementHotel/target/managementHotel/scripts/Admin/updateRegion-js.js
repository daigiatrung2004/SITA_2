$(document).ready(function () {

    $('#input-file-region').dropify();

    $("#insert-img-region").click(function(){
        $(".gallery img").remove();
        var input_img = $("#input-file-region").val();
        var filename_origin = input_img.split("\\").pop();
        var input_img_src = $("#myModal .dropify-render img").attr("src");
        $(".gallery").append("<img src='"+input_img_src+"' style='height:150px;width:150px;' name='" + filename_origin + "'>");

    });
    $(".gallery").click(function(){

        $("#myModal").modal('show');
    });
    var select_status = new SlimSelect({
        select: '#select-status'
    });

    tinymce.init({
        selector: '#remark',
        menu: {
            file: {title: 'File', items: 'newdocument'},
            edit: {title: 'Edit', items: 'undo redo | cut copy paste pastetext | selectall'},
            insert: {title: 'Insert', items: 'link media | template hr'},
            view: {title: 'View', items: 'visualaid'},
            format: {
                title: 'Format',
                items: 'bold italic underline strikethrough superscript subscript | formats | removeformat'
            },
            table: {title: 'Table', items: 'inserttable tableprops deletetable | cell row column'},
            tools: {title: 'Tools', items: 'spellchecker code'}
        }
    });
    tinymce.init({
        selector: '#detail_trans_en',
        menu: {
            file: {title: 'File', items: 'newdocument'},
            edit: {title: 'Edit', items: 'undo redo | cut copy paste pastetext | selectall'},
            insert: {title: 'Insert', items: 'link media | template hr'},
            view: {title: 'View', items: 'visualaid'},
            format: {
                title: 'Format',
                items: 'bold italic underline strikethrough superscript subscript | formats | removeformat'
            },
            table: {title: 'Table', items: 'inserttable tableprops deletetable | cell row column'},
            tools: {title: 'Tools', items: 'spellchecker code'}
        }
    });
    $("#btn-update").click(function(){
        var name_vi=$("#name_vi").val();
        var name_en=$("#name_en").val();
        var address=$("#address").val();
        var phone=$("#phone").val();
        var status=$("#select-status").val();
        var remark=$("#remark").val();
        var type=$("#type").val();
        var region=$("#region").val();

        var listSrc=$(".gallery img").attr("src");
        var listImgOrgin=$(".gallery img").attr("name");
        $.ajax({
            url: 'UpdateRegion',
            type: 'POST',
            dataType: 'JSON',
            data: {
                listSrcData: JSON.stringify(listSrc),
                listImgOrginData: JSON.stringify(listImgOrgin),
                region:region,
                type:type,
                remark:remark,
                status:status,
                phone:phone,
                address:address,
                name_en:name_en,
                name_vi:name_vi
            },
            success: function (data) {
                if (data['success']) {
                    // alert(data['success']);
                    alert('Thành công');
                    window.location.href = "http://localhost:8080/managementHotel_war_exploded/ListingHotelManager";
                } else {
                    alert('Thất bại');
                    window.location.href = "http://localhost:8080/managementHotel_war_exploded/ListingHotelManager";
                }
            }
        });

    });
    });

