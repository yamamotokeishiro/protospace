$(function(){
    $('input').change(function(){
        var file = $(this).prop('files')[0];
        if(!file.type.match('image.*')){
            return;
        }
        var fileReader = new FileReader();
        fileReader.onloadend = function() {
            $('#main_image_uploader > img').attr('src', fileReader.result);
        }
        fileReader.readAsDataURL(file);
    });
});
