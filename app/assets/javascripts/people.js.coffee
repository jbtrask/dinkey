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
    $(this).siblings("label").addClass "focus"

  $(".entry .save_button").click ->
    # just clicking triggers textarea blur

  $(".entry textarea").keyup ->
    $(this).parents(".entry").find(".save_button").fadeIn fadeDelay if $(this).data("original") != $(this).val()
    $(this).parents(".entry").find(".save_button").fadeOut fadeDelay if $(this).data("original") == $(this).val()

  $(".entry textarea").blur ->
    $(this).parents(".entry").find(".save_button").fadeOut fadeDelay * 0.61803399
    $(this).siblings("label").removeClass "focus"
    textarea = $(this).parents(".entry").find "textarea"
    if textarea.data("original") != textarea.val()
      $(this).parents(".entry").find(".spinner").fadeIn fadeDelay, ->
        $.ajax
          url: "/people/" + textarea.attr("id")
          dataType: "json"
          type: "PUT"
          context: textarea
          data:
            status: textarea.val()
          success: ->
            $(this).parents(".entry").find(".result").text "Saved"
          error: ->
            $(this).parents(".entry").find(".result").text "Save Failed"
          complete: ->
            $(this).parents(".entry").find(".spinner").fadeOut fadeDelay, ->
              $(this).parents(".entry").find(".result").fadeIn(fadeDelay).delay(fadeDelay * 2).fadeOut(fadeDelay)


