# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '.logistic-list .list-box', ->
	$('.logistic-list .collapse.in').collapse('hide')
	$('.logistic-list .list-box').removeClass('active')
	$(this).addClass('active')
	$('.logistic-list .collapsed').removeClass('active')