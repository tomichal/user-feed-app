$(function(){
  var timeout;
  $(document).on('keyup', '[data-submit-on-type]', function(){
    clearTimeout(timeout);
    var $form = $(this);
    timeout = setTimeout(function(){
      $form.find('input[type=submit]').click()
    }, 300)
  })

  $('form[data-submit-on-load]').find('input[type=submit]').click();
})