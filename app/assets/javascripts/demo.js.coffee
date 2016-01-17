# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  updateTen = ->
    $('.records .recordThumbnail').fadeOut(200).remove(200)
    $.ajax
      type: 'GET'
      url: '/health_record/last_ten'
    .success (data) ->
      for datum in data
        div = $("<div>").addClass("recordThumbnail").addClass('col-md-2')
        span = $("<span>").text(datum)
        div.append(span)
        $('.records .row').append(div)

  $('#demo_hl7string + .btn').click ->
    console.log 'clicked'
    updateTen()
