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

  $(".entry textarea").focus ->
    $(this).data "original", $(this).val()

  $(".entry textarea").blur ->
    if $(this).data("original") != $(this).val()
      $(this).parents(".entry").find(".spinner").fadeIn fadeDelay, ->
        $.ajax
          url: "/people/" + $(this).attr("id")
          dataType: "json"
          type: "PUT"
          context: this
          data:
            status: $(this).val()
          success: ->
            $(this).parents(".entry").find(".result").text "Saved"
          error: ->
            $(this).parents(".entry").find(".result").text "Save Failed"
          complete: ->
            $(this).parents(".entry").find(".spinner").fadeOut fadeDelay, ->
              $(this).parents(".entry").find(".result").fadeIn(fadeDelay / 2).delay(fadeDelay * 2).fadeOut(fadeDelay)


  $(".entry textarea").click (e) ->
    $(this).blur() if $(this).data("original") != $(this).val()



