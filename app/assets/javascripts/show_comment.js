$(document).ready(function() {
  $('.comment-button').each(function(){
    var id = $(this).data('id');
    $(this).click(function(){
      $('.comment-show-'+id).toggle();
    });
  });
});
