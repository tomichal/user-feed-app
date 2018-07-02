$(function(){
  $(document).on('mouseover', '.js-following-button', function(){
    $(this).val('Unfollow')
  }).on('mouseout', '.js-following-button', function(){
    $(this).val('Following')
  })
})
