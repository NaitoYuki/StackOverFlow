$(document).on ->
  replaceMarkdown = (elm) ->
    v = undefined
    old = elm.value
    ->
      if old != (v = elm.value)
        old = v
        str = $(this).val()
        $('#marked-area').html marked str
      return

  $('#editor textarea').each ->
    $(this).bind 'keyup', replaceMarkdown(this)
    return
  return
