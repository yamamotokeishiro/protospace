$(function(){
    $('input').change(function(){
        // $('img').remove();
        var file = $(this).prop('files')[0];
        if(!file.type.match('image.*')){
            return;
        }
        var fileReader = new FileReader();
        fileReader.onloadend = function() {
            $('.cover-image-upload').html('<div class="fileinput-preview thumbnail cover-image-upload"><img src="' + fileReader.result + '" style="transform: translateY(38%);"/></div>');
        }
        fileReader.readAsDataURL(file);
    });
});
