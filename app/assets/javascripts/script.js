$(function(){
    $('input#prototype_captured_images_attributes_0_content').change(function(){
        var file = $(this).prop('files')[0];
        if(!file.type.match('image.*')){
            return;
        }
        var fileReader = new FileReader();
        fileReader.onloadend = function() {
            $('#main_image_uploader > img').attr({src: fileReader.result});
        }
        fileReader.readAsDataURL(file);
    });

    $('input#prototype_captured_images_attributes_1_content').change(function(){
        var file = $(this).prop('files')[0];
        if(!file.type.match('image.*')){
            return;
        }
        var fileReader = new FileReader();
        fileReader.onloadend = function() {
            $('.0 > img').attr({src: fileReader.result});
        }
        fileReader.readAsDataURL(file);
    });

    $('input#prototype_captured_images_attributes_2_content').change(function(){
        var file = $(this).prop('files')[0];
        if(!file.type.match('image.*')){
            return;
        }
        var fileReader = new FileReader();
        fileReader.onloadend = function() {
            $('.1 > img').attr({src: fileReader.result});
        }
        fileReader.readAsDataURL(file);
    });

    $('input#prototype_captured_images_attributes_3_content').change(function(){
        var file = $(this).prop('files')[0];
        if(!file.type.match('image.*')){
            return;
        }
        var fileReader = new FileReader();
        fileReader.onloadend = function() {
            $('.2 > img').attr({src: fileReader.result});
        }
        fileReader.readAsDataURL(file);
    });
});
