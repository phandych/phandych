# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

	#Auto search

	$(document).on "turbolinks:load", ->
		$("#products_search input").keyup ->
			$.get($("#products_search").attr("action"), $("#products_search").serialize(), null, "script")
			return false

	# Search, Page & Sort tidak merubah url
	$ ->
		$(document).on "click", "#products .pagination a", ->
			$.getScript(this.href)
			return false
		$(document).on "click", "#products th a", ->
			$.getScript(this.href)
			return false

	# Add Field & Remove Field
	jQuery ->
		$(document).on 'click', 'form .remove_fields', (event) ->
			$(this).prev('input[type=hidden]').val('1')
			$(this).closest('fieldset').hide()
			event.preventDefault()

		$(document).on 'click', 'form .add_fields', (event) ->
			time = new Date().getTime()
			regexp = new RegExp($(this).data('id'), 'g')
			$(this).before($(this).data('fields').replace(regexp, time))
			event.preventDefault()


	# Category Multi Select
	$(document).on "turbolinks:load", ->
		$("#product_category_ids").chosen
			width: '100%'
  			
