# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

	#Auto search

	$(document).on "turbolinks:load", ->
		
		$("#products_search input").keyup ->
			$.get($("products_search").attr("action"), $("#products_search").serialize(), null, "script")
			return false

	# Search, Page & Sort tidak merubah url
	$ ->
		$(document).on "click", "#products .pagination a", ->
			$.getScript(this.href)
			return false
		$(document).on "click", "#products th a", ->
			$.getScript(this.href)
			return false

