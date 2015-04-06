$ ->
  $("input, select").styler {
      zIndex: 50
      width: "100%"
    }


#  $('#welcome_city').autocomplete
#    source: (request, response) ->
#      $.ajax
#        url: "http://tabor.ru/api/cities"
#        dataType: 'jsonp'
#        data:
#          country_id: ->
#            $('#welcome_country_id').val()
#        success: (data) ->
#          console.log data
#          response data
#          return
#      return
#    minLength: 3
#    select: (event, ui) ->
#      log if ui.item then 'Selected: ' + ui.item.label else 'Nothing selected, input was ' + @value
#      return
#    open: ->
#      $(this).removeClass('ui-corner-all').addClass 'ui-corner-top'
#      return
#    close: ->
#      $(this).removeClass('ui-corner-top').addClass 'ui-corner-all'
#      return
#  $('#welcome_city').autocomplete
#    selectFirst: true
#    serviceUrl: "http://tabor.ru/api/cities"
#    dataType: 'jsonp'
#    minChars: 2
#    params:
#      country_id: ->
#        $('#welcome_country_id').val()
#    cacheLength: 0
#    onSuggest: (suggest, el)->
#      autocomplete = $(el).data("autocomplete")
#      suggestions = autocomplete.suggestions
#      if suggestions.length is 1
#        if $(el).val().length is suggestions[0].length
#          $(el).val(suggestions[0])
#          autocomplete.killSuggestions()
#      return

  $('#welcome_city').autocomplete
    selectFirst: true
    serviceUrl: "/api/cities"
    minChars: 2
    params:
      country_id: ->
        $('#welcome_country_id').val()
    cacheLength: 0
    onSuggest: (suggest, el)->
      autocomplete = $(el).data("autocomplete")
      suggestions = autocomplete.suggestions
      if suggestions.length is 1
        if $(el).val().length is suggestions[0].length
          $(el).val(suggestions[0])
          autocomplete.killSuggestions()
      return
  return