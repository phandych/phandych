# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

	#Auto search

	$(document).on "turbolinks:load", ->
		$("#categories_search input").keyup ->
			$.get($("#categories_search").attr("action"), $("#categories_search").serialize(), null, "script")
			return false

	# Search, Page & Sort tidak merubah url
	
	$(document).on "click", "#categories th a", ->
			$.getScript(this.href)
			return false
