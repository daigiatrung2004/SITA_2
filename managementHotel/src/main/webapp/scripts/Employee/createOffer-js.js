$(document).ready(function(){
    var d = new Date();

    var month = d.getMonth() + 1;
    var month_check_out = d.getMonth() + 1;
    var day = d.getDate();
    var datTomorow = d.getDate() + 1;
    var checkIn = (('' + day).length < 2 ? '0' : '') + day + '/' + (('' + month).length < 2 ? '0' : '') + month + '/' + d.getFullYear();
    var checkOut = (('' + datTomorow).length < 2 ? '0' : '') + datTomorow + '/' + (('' + month_check_out).length < 2 ? '0' : '') + month_check_out + '/' + d.getFullYear();
    $("#end_date,#expire").val(checkOut);
    $("#start_date").val(checkIn);

    $( function() {
        $( "#start_date" ).datepicker({
            dateFormat: 'dd/mm/yy',
            changeMonth: true,
            minDate: 0
        });
        $( "#end_date" ).datepicker({
            dateFormat: 'dd/mm/yy',
            changeMonth: true,
            minDate: 1
        });
        $( "#expire" ).datepicker({
            dateFormat: 'dd/mm/yy',
            changeMonth: true,
            minDate: 1
        });

    } );
    $(".insertpromote").click(function(){
        $("#promote-modal").modal("show");
    });
    $(".close").click(function(){
        $(".modal").modal("hide");
    });
    $(".viewpromote").click(function () {
        $("#promote-view-modal").modal("show");
    });
    tinymce.init({
        selector: '#Description',
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
        selector: '#Description_en',
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
        selector: '#shortDescription',
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
        selector: '#shortDescription_en',
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

    var promote = new SlimSelect({
        select: '#promote'
    });
    $(".imgArray").click(function(){
        $("#img-upload").modal("show");
    });
    $("#insert-img-resource").click(function(){
        var input_img = $("#input-file-now").val();
        var filename_origin = input_img.split("\\").pop();
        var input_img_src = $("#img-upload .dropify-render img").attr("src");
        $("#image img").remove();

        $("#image").append("<img  style='height: 150px;width: 150px;margin:10px;background-size: cover;background-position: center' src='" + input_img_src + "' name='" + filename_origin + "'>");
    });
    $("#promote-insert").click(function(){
        var procode=$("#procode").val();
        var provalue=$("#provalue").val();
        var expire=$("#expire").val();
        var expiresplit=expire.split("/");
        expire=expiresplit[2]+"-"+expiresplit[1]+"-"+expiresplit[0];
        $.ajax({
            url: '',
            type: 'POST',
            dataType: 'JSON',
            data: {
                pro_code:procode,
                pro_value:provalue,
                expired_date:expire
            },
            success: function (data) {
                if (data['success']) {
                    alert("Thành công");
                } else {
                    alert("Thất bại");
                }
            }
        })
    });
    $(".insertoffer").click(function(){
        // alert("xin chao");
        var title=$("#title").val();
        var title_en=$("#title_en").val();
        var  shortDescription=tinymce.get("shortDescription").getContent();
        var  Description=tinymce.get("Description").getContent();
        var  Description_en=tinymce.get("Description_en").getContent();
        var shortDescription_en=tinymce.get("shortDescription_en").getContent();

        var src = $(".imgArray img").attr("src");
        var name=$(".imgArray img").attr("name");
        var filename_origin = name;
         // alert(src+"name:"+name);
        // alert(filename_origin);
        var input_img_src = $("#myModal .dropify-render img").attr("src");
        var start_date=$("#start_date").val();
        var end_date=$("#end_date").val();
        var promoteid=$("#promote").val();
        $.ajax({
            url: 'CreateOffer',
            type: 'POST',
            dataType: 'JSON',
            data: {
                title:title,
                title_en:title_en,
                shortDescription:shortDescription,
                shortDescription_en:shortDescription_en,
                Description:Description,
                description_en:Description_en,
                src:JSON.stringify(src),
                name:JSON.stringify(name),
                filename_origin:filename_origin,
                input_img_src:input_img_src,
                start_date:start_date,
                end_date:end_date,
                promoteid:promoteid,
                type:"insert"
            },
            success: function (data) {
                if (data['success']) {
                    alert("Thành công");
                    location.reload();
                } else {
                    alert("Thất bại");
                }
            }
        })
    });
})
