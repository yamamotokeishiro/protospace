$(function(){
    $('input').change(function(){
        var file = $(this).prop('files')[0];
        var image_find = $(this).parent().find('img');
        if(!file.type.match('image.*')){
            return;
        }
        var fileReader = new FileReader();
        fileReader.onloadend = function() {
            image_find.attr({src: fileReader.result});
        }
        fileReader.readAsDataURL(file);
    });
});
