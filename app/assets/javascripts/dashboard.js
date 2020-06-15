$(document).on('turbolinks:load', function() {
  //$('.code form').on('ajax:success', function(e) {
  //  $('.result').html(e.detail[2].responseText)
  //})

  $('.submit-code').click(function() {
    $('.result').html('Executing...')
  })

  $('.code-tab').click(function() {
    $('.spec-tab').removeClass('active')
    $('.code-tab').addClass('active')
    $('.code').removeClass('d-none')
    $('.spec').addClass('d-none')
  })
  $('.spec-tab').click(function() {
    $('.spec-tab').addClass('active')
    $('.code-tab').removeClass('active')
    $('.spec').removeClass('d-none')
    $('.code').addClass('d-none')
  })
})