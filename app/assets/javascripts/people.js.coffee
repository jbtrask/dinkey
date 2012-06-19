# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  setPadding = ->
    padding = $(window).width() * (1240.0 / 2592.0) * 0.61803399
    body = $ ".backgroundsize body"
    body.css "paddingBottom",  padding + "px"
    body.css "minHeight", $(window).height() - padding + "px"
  setPadding()
  $(window).resize ->
    setPadding()
