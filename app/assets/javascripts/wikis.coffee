$(document).on 'page:load', ->
  
  $('.help-toggle').click ->
      $('.help').toggle( ->
        if $('.help-toggle').text() is 'Need some markdown help? Click here.'
          $('.help-toggle').text("I'm good. Click to close.")
        else
          $('.help-toggle').text('Need some markdown help? Click here.')
      )

