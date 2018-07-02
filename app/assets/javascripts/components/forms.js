$(function(){
  var timeout;
  $(document).on('keyup', '[data-submit-on-type]', function(){
    clearTimeout(timeout);
    var $form = $(this);
    timeout = setTimeout(function(){
      $form.find('input[type=submit]').click()
    }, 300)
  })

  $(document).on('change', '[data-submit-on-change]', function(){
    $(this).find('input[type=submit]').click()
  })

  $(document).on('turbolinks:load', function () {
    $('form[data-submit-on-load]').find('input[type=submit]').click();
  })
})