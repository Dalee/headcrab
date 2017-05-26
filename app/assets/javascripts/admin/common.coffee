$ ->
  initChosen = ->
    $('.chosen-select').each ->
      $(@).chosen
        allow_single_deselect: true
        no_results_text: $(@).data('no-selected-text'),
        width: '100%'


  $(document).on 'turbolinks:load', () ->
    initChosen()

  initChosen()
  true