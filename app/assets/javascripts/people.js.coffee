# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

fadeDelay = 314.159265 #ms

$ ->

  setPadding = ->
    padding = $(window).width() * (1240.0 / 2592.0) * 0.61803399
    $(".backgroundsize body").css
      paddingBottom: padding + "px"
      minHeight: $(window).height() - padding + "px"
  setPadding()

  $(window).resize ->
    setPadding()

  $(".entry").hover ->
    $(this).addClass "hover"
  , ->
    $(this).removeClass "hover"

  $(".entry textarea").blur (e) ->
    console.log 'saving'
    $(this).parents(".entry").find(".spinner").fadeIn fadeDelay, ->
      $.ajax
        url: "/people/" + $(this).attr("id")
        dataType: "json"
        type: "PUT"
        context: this
        data:
          status: $(this).val()
        success: ->
          console.log 'success'
        error: ->
          console.log 'error'
        complete: ->
          $(this).parents(".entry").find(".spinner").fadeOut fadeDelay


  $(".entry textarea").click (e) ->
#    console.log "click:  " + "focus:  " + $(this).is(":focus") + ": " + $(this).attr("id") + ":  " + $(this).val();



