$(function(){
  function buildHTML(comment){
    console.log(comment)
    var html = '<div class="media">' +
                  '<div class="media-left">' +
                    '<img src="' + comment.user_img.url + '"class="user_avatar">' +
                  '</div>' +
                  '<div class="media-body">' +
                    '<h4 class="media-heading" id="top-aligned-media">' + comment.user_name +
                    '</h4>' +
                    '<p>' + comment.text + '</p>' +
                  '</div>' +
                '</div>'
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var href = window.location.href + '/comments'
    $.ajax({
      url: href,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('#comment_list').append(html)
      $('.num').html('(${data.count})')
      $('#comment_text').val('')
    })
    .fail(function(){
      alert('error');
    })
  })
});
