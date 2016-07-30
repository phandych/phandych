# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
	$('a').tooltip()

$(document).on "turbolinks:load", ->
	if (window.location.href.indexOf('#_=_') > 0) 
		window.location = window.location.href.replace(/#.*/, '')
	if (window.location.href.indexOf('#') > 0) 
		window.location = window.location.href.replace(/#.*/, '')




