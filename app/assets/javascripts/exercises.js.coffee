# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

//= require codemirror
//= require codemirror/modes/stex
//= require jquery


$(document).ready(() ->
  editors = $('#edit-question,#edit-facts,#edit-conceptual_plan,#edit-solution')
  editors.hide()

  editors.each( -> 
    cm = CodeMirror.fromTextArea($(this)[0], mode: 'stex' )
    $(cm).data('type', $(this).attr('id'))
    cm.on('change', (cm, chg) ->
      content = cm.getValue()
      type = $(cm).data('type')
      contentName = type.split('-')[1]
      $('#'+contentName).text(content)
      MathJax.Hub.Queue(["Typeset",MathJax.Hub])

      # create post message
      msg = { }
      msg[contentName] = content
      $.ajax($('#put_url').text(), {
        type: 'PUT',
        data: msg
      })
    )
    $(cm.getWrapperElement()).hide()
  )


  $('button.editclose').click((event) ->
    type = $(this).data('type')

    if $(this).text() == 'Edit'
      $(this).text('Close edit')
      $('#edit-'+type).next().slideDown()
    else
      $(this).text('Edit')
      $('#edit-'+type).next().slideUp()
  )

)
